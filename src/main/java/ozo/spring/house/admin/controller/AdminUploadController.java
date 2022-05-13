package ozo.spring.house.admin.controller;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ozo.spring.house.admin.service.AdminBannerService;
import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.seller.service.AwsS3;

@Controller
public class AdminUploadController {
	@Autowired
	AwsS3 awss3Client;
	
	@Autowired
	AdminBannerService AdminBannerService;
	
	@ResponseBody
	@RequestMapping(value="/eventupload.admin", method=RequestMethod.POST)
	public String bannerupload( @RequestPart(value = "key", required=false) Map<String, String> param, @RequestPart(value="big", required=false) List<MultipartFile> big, @RequestPart(value="small", required=false) List<MultipartFile> small, BannerVO vo) {
	
	// 넘어온 file list 가 없을 때 인식해주기
	
			System.out.println("file upload ready");
			String dirName = "Banner";
			
			try {
					vo.setBanner_title(param.get("banner_title"));
				
					if(big!=null) {	
					
				for(int i=0; i<big.size(); i++) {
					MultipartFile bigfile = big.get(i);
					String key = bigfile.getOriginalFilename();
					System.out.println("filename --> " +key);
					InputStream is = bigfile.getInputStream();
					String contentType = bigfile.getContentType();
					long contentLength = bigfile.getSize();
					
					String url = awss3Client.upload(is, key, contentType, contentLength, dirName);
					System.out.println(url);
					System.out.println("aws main file upload complete");
					vo.setBanner_bigname(key);
					vo.setBanner_urlbig(url);
					System.out.println("큰거");
					System.out.println(url);
					
					System.out.println("mybatis main photo ok");
				}
					}
				
				if(small!=null) {
					
					for(int i=0; i<small.size(); i++) {
						MultipartFile smfile = small.get(i);
						String key = smfile.getOriginalFilename();
						System.out.println("filename --> " +key);
						InputStream is = smfile.getInputStream();
						String contentType = smfile.getContentType();
						long contentLength = smfile.getSize();
						
						System.out.println(key);		
						String url = awss3Client.upload(is, key, contentType, contentLength, dirName);
						System.out.println(url);
						System.out.println("aws detail file upload complete");
						vo.setBanner_smname(key);
						vo.setBanner_urlsm(url);
						System.out.println("작은거");
						System.out.println(url);
						
						System.out.println("mybatis detail photo ok");

					}
						
					
					AdminBannerService.b_insert(vo);
				}
				

				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			
			return null;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/deleteBanner.admin", method=RequestMethod.POST)
	public String deleteBanner(@RequestBody String banner_id, BannerVO bvo) {

		String dirName = "Banner";
		
		bvo.setBanner_id(Integer.parseInt(banner_id.replace("\"", "")));
		System.out.println(bvo.getBanner_id());
		
		List<BannerVO> bannerList = AdminBannerService.b_selectone(bvo);
		BannerVO banner = bannerList.get(0);
		
		String[] bigs = banner.getBanner_urlbig().split("/");
		String bigurl = dirName + "/" + bigs[bigs.length-1];
		
		String[] sms = banner.getBanner_urlsm().split("/");
		String smurl = dirName + "/" + sms[sms.length-1];
		
		System.out.println(bigurl);
		System.out.println(smurl);

		try {
			awss3Client.delete(bigurl);
			awss3Client.delete(smurl);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		AdminBannerService.b_delete(bvo);
		
		return "success";

	}
}
