package ozo.spring.house.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ozo.spring.house.admin.vo.MemberVO;
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
	// login
		@RequestMapping(value = "/login.com", method=RequestMethod.GET)
		public String loginView(HttpSession session) {
			if(session.getAttribute("usercode")!=null) {
				return "redirect:main.com";
			}else {
				return "ozoLogin_zinc";
			}
		}
		
		@RequestMapping(value="/login.com", method=RequestMethod.POST)
		public String login(UserVO vo, Model model, HttpSession session) {

			// log 처리
			System.out.println("login controller");
			UserVO user = userService.checkUser(vo);
			
			if(user != null) {
				session.setAttribute("Usercode", user.getUser_email());
				model.addAttribute("Usercode", vo.getUser_email());
				model.addAttribute("member", vo); // member 정보
				return "index";
			}else {
				String msg = "입력하신 정보가 잘못 되었습니다.";
				model.addAttribute("msg", msg);
				return "adminLogin_dj";
			}
		}
		
		
	
	

}
