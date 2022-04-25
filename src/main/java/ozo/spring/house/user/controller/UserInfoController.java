package ozo.spring.house.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class UserInfoController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/signUpProc.com", method=RequestMethod.POST)
	public String signUpProc(UserVO vo, @RequestParam(value="user_email1") String email1, @RequestParam(value="user_email2")String email2) {
		
		vo.setUser_email(email1 + "@" + email2);
		userService.insertUser(vo);
		return "redirect:login.com";
		
		// return "redirect:signUp.com";
		
	}
	
	

}
