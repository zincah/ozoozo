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
	
	// login
	@RequestMapping(value = "/login.admin", method=RequestMethod.GET)
	public String loginView(HttpSession session) {
		if(session.getAttribute("admincode")!=null) {
			return "index";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value="/login.admin", method=RequestMethod.POST)
	public String login(MemberVO vo, Model model, HttpSession session) {

		// log ó��
		System.out.println("login controller");
		MemberVO admin = memberService.checkAdmin(vo);
		
		if(admin != null) {
			session.setAttribute("admincode", admin.getAdmin_code());
			model.addAttribute("admincode", vo.getAdmin_code());
			model.addAttribute("member", vo); // member ����
			return "index";
		}else {
			String msg = "�Է��Ͻ� ������ �߸� �Ǿ����ϴ�.";
			model.addAttribute("msg", msg);
			return "adminLogin_dj";
		}
	}
	
	// logout
	@RequestMapping(value = "/logout.admin", method=RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:login.admin";
	}

}