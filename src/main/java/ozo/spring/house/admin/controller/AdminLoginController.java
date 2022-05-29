package ozo.spring.house.admin.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.admin.service.MemberService;
import ozo.spring.house.admin.vo.MemberVO;

@Controller
public class AdminLoginController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/login.admin", method=RequestMethod.GET) // admin 로그인 뷰 페이지
	public String loginView(HttpSession session) {
		if(session.getAttribute("admincode")!=null) {
			return "redirect:index.admin";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value="/login.admin", method=RequestMethod.POST) // admin 로그인 페이지
	public String login(MemberVO vo, Model model, HttpSession session) {

		System.out.println("login controller");
		MemberVO admin = memberService.checkAdmin(vo); // 로그인 입력값 체크
		
		if(admin != null) {
			session.setAttribute("admincode", admin.getAdmin_code());
			return "redirect:index.admin";
		}else {
			return "adminLogin_dj";
		}
	}
	
	// logout
	@RequestMapping(value = "/logout.admin", method=RequestMethod.GET) // admin 로그아웃 처리
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:login.admin";
	}

}
