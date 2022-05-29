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
	
	@RequestMapping(value = "/login.admin", method=RequestMethod.GET) // admin �α��� �� ������
	public String loginView(HttpSession session) {
		if(session.getAttribute("admincode")!=null) {
			return "redirect:index.admin";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value="/login.admin", method=RequestMethod.POST) // admin �α��� ������
	public String login(MemberVO vo, Model model, HttpSession session) {

		System.out.println("login controller");
		MemberVO admin = memberService.checkAdmin(vo); // �α��� �Է°� üũ
		
		if(admin != null) {
			session.setAttribute("admincode", admin.getAdmin_code());
			return "redirect:index.admin";
		}else {
			return "adminLogin_dj";
		}
	}
	
	// logout
	@RequestMapping(value = "/logout.admin", method=RequestMethod.GET) // admin �α׾ƿ� ó��
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:login.admin";
	}

}
