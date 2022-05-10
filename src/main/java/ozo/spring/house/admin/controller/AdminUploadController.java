package ozo.spring.house.admin.controller;

import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ozo.spring.house.admin.service.AdminBannerService;
import ozo.spring.house.seller.service.AwsS3;
import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.vo.ProductVO;

public class AdminUploadController {
	@Autowired
	AwsS3 awss3Client;
	
	@Autowired
	AdminBannerService AdminBannerService;
	
	@ResponseBody
	@RequestMapping(value="/", method=RequestMethod.POST)
	public String bannerupload(@RequestParam(value="mainfile") List<MultipartFile> main, @RequestParam(value="file", required=false) List<MultipartFile> multi, ProductVO vo) {
	
	// �Ѿ�� file list �� ���� �� �ν����ֱ�
	
			System.out.println("file upload ready");
			String dirName = "product";

			try {
				
				for(int i=0; i<main.size(); i++) {
					MultipartFile mainfile = main.get(i);
					String key = mainfile.getOriginalFilename();
					System.out.println("filename --> " +key);
					InputStream is = mainfile.getInputStream();
					String contentType = mainfile.getContentType();
					long contentLength = mainfile.getSize();
					
					String url = awss3Client.upload(is, key, contentType, contentLength, dirName);
					System.out.println(url);
					System.out.println("aws main file upload complete");
					
					vo.setPhoto_url(url);
					vo.setPhoto_separate(true);
//					AdminBannerService.insertPhoto(vo);
					System.out.println("mybatis main photo ok");
				}
				
				if(multi!=null) {
					
					for(int i=0; i<multi.size(); i++) {
						MultipartFile file = multi.get(i);
						String key = file.getOriginalFilename();
						System.out.println("filename --> " +key);
						InputStream is = file.getInputStream();
						String contentType = file.getContentType();
						long contentLength = file.getSize();
						
						//aws upload �޼ҵ�
						String url = awss3Client.upload(is, key, contentType, contentLength, dirName);
						System.out.println(url);
						System.out.println("aws detail file upload complete");
						
						vo.setPhoto_url(url);
						vo.setPhoto_separate(false);
//						AdminBannerService.insertPhoto(vo);
						System.out.println("mybatis detail photo ok");

					}
				}
				

				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return null;
}
}
