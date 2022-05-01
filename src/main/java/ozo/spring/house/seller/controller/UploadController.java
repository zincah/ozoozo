package ozo.spring.house.seller.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ozo.spring.house.seller.service.AwsS3;

@Controller
public class UploadController {
	
	@Autowired
	AwsS3 awss3Client;
	
	@ResponseBody
	@RequestMapping(value="/uploadPhotos.seller", method=RequestMethod.POST)
	public String uploadPhotos(@RequestParam("file") List<MultipartFile> multi) {
		
		System.out.println("file upload ready");

		try {
			System.out.println(multi.size());
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		/*
		try {
			String key = mainuploadFile.getOriginalFilename();
			System.out.println(key);
			InputStream is = mainuploadFile.getInputStream();
			String contentType = mainuploadFile.getContentType();
			long contentLength = mainuploadFile.getSize();
			awss3Client.upload(is, key, contentType, contentLength);
			System.out.println("main 업로드 완료");
			
		}catch(IOException e) {
			e.printStackTrace();
		}*/
		
		return "success";

	}

}
