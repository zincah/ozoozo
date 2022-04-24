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
public class LoginController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/login.admin", method=RequestMethod.GET)
	public String loginView(HttpSession session) {
		if(session.getAttribute("admincode")!=null) {
			return "index";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value="/login.admin", method=RequestMethod.POST)
	public String loginTest(MemberVO vo, Model model, HttpSession session) {

		// log 처리
		System.out.println("login controller");
		MemberVO admin = memberService.checkAdmin(vo);
		
		if(admin != null) {
			session.setAttribute("admincode", admin.getAdmin_code());
			return "index";
		}else {
			String msg = "입력하신 정보가 잘못 되었습니다.";
			model.addAttribute("msg", msg);
			return "adminLogin_dj";
		}
	}
	

}
