package ozo.spring.house.user.controller;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import ozo.spring.house.user.service.userMyPageService;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class UserUploadController {
	
	@Autowired
	AwsS3 awss3Client;
	
	@Autowired
	userMyPageService usermypageservice;
	
	@ResponseBody
	@RequestMapping(value="/mypageupload.com", method=RequestMethod.POST)
	public String bannerupload( @RequestPart(value = "key", required=false) Map<String, String> param, @RequestPart(value="myphoto", required=false) List<MultipartFile> myphoto, UserVO vo, HttpServletRequest request) {
	
	// 넘어온 file list 가 없을 때 인식해주기
		HttpSession session = request.getSession();
			System.out.println("file upload ready");
			String dirName = "MyPage";
			
			try {	
					vo.setUser_num((int)session.getAttribute("User_Num"));
					vo.setNickname(param.get("user_nickname"));
					vo.setNickname(param.get("user_birth"));
					vo.setNickname(param.get("comment"));
					
					if(myphoto!=null) {	
					
				for(int i=0; i<myphoto.size(); i++) {
					MultipartFile myphotofile = myphoto.get(i);
					String key = myphotofile.getOriginalFilename();
					System.out.println("filename --> " +key);
					InputStream is = myphotofile.getInputStream();
					String contentType = myphotofile.getContentType();
					long contentLength = myphotofile.getSize();
					
					//String url = awss3Client.upload(is, key, contentType, contentLength, dirName);
					//System.out.println(url);
					System.out.println("aws main file upload complete");
					//vo.setUser_img(url);
					System.out.println("마이페이지사진");
					System.out.println("mybatis main photo ok");
				}
					}
				
					usermypageservice.user_edit(vo);
				
				

				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			
			return null;

}
}
