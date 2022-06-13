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
public class A_UploadController {
	@Autowired
	AwsS3 awss3Client;
	
	@Autowired
	AdminBannerService AdminBannerService;
	
	@ResponseBody
	@RequestMapping(value="/eventupload.admin", method=RequestMethod.POST)
	public String bannerupload( @RequestPart(value = "key", required=false) Map<String, String> param, @RequestPart(value="big", required=false) List<MultipartFile> big, @RequestPart(value="small", required=false) List<MultipartFile> small, BannerVO vo) {
		System.err.println("[Log] --- Upload 	Controller >>>>> bannerupload 	Method");
	// 넘어온 file list 가 없을 때 인식해주기
	
			String dirName = "Banner";
			
			try {
					vo.setBanner_title(param.get("banner_title"));
				
					if(big!=null) {	
					
				for(int i=0; i<big.size(); i++) {
					MultipartFile bigfile = big.get(i);
					String key = bigfile.getOriginalFilename();
					InputStream is = bigfile.getInputStream();
					String contentType = bigfile.getContentType();
					long contentLength = bigfile.getSize();
					
					String url = awss3Client.upload(is, key, contentType, contentLength, dirName);
					vo.setBanner_bigname(key);
					vo.setBanner_urlbig(url);
				}
					}
				
				if(small!=null) {
					
					for(int i=0; i<small.size(); i++) {
						MultipartFile smfile = small.get(i);
						String key = smfile.getOriginalFilename();
						//System.out.println("filename --> " +key);
						InputStream is = smfile.getInputStream();
						String contentType = smfile.getContentType();
						long contentLength = smfile.getSize();
						
						String url = awss3Client.upload(is, key, contentType, contentLength, dirName);
						vo.setBanner_smname(key);
						vo.setBanner_urlsm(url);

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
		System.err.println("[Log] --- Upload 	Controller >>>>> deleteBanner 	Method");
		String dirName = "Banner";
		
		bvo.setBanner_id(Integer.parseInt(banner_id.replace("\"", "")));
		
		List<BannerVO> bannerList = AdminBannerService.b_selectone(bvo);
		BannerVO banner = bannerList.get(0);
		
		String[] bigs = banner.getBanner_urlbig().split("/");
		String bigurl = dirName + "/" + bigs[bigs.length-1];
		
		String[] sms = banner.getBanner_urlsm().split("/");
		String smurl = dirName + "/" + sms[sms.length-1];
		

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
