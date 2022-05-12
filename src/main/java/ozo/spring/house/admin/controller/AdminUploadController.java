package ozo.spring.house.admin.controller;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	// �Ѿ�� file list �� ���� �� �ν����ֱ�
	
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
					
					//String url = awss3Client.upload(is, key, contentType, contentLength, dirName);
					//System.out.println(url);
					System.out.println("aws main file upload complete");
					vo.setBanner_bigname(key);
					//vo.setBanner_urlbig(url);
					System.out.println("ū��");
					//System.out.println(url);
					AdminBannerService.b_insert(vo);
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
						//String url = awss3Client.upload(is, key, contentType, contentLength, dirName);
						//System.out.println(url);
						System.out.println("aws detail file upload complete");
						vo.setBanner_smname(key);
						//vo.setBanner_urlsm(url);
						System.out.println("������");
						//System.out.println(url);
						AdminBannerService.b_insert(vo);
						System.out.println("mybatis detail photo ok");

					}
						
					
					
				}
				

				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			
			return null;
}
}