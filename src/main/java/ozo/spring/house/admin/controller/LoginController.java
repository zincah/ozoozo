package ozo.spring.house.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	// test
	private String admincode = "ozohouse";
	private String password = "1234";
	
	@RequestMapping("/loginTest.admin")
	public String loginTest(HttpServletRequest request, HttpServletResponse response) {
		
		String code = request.getParameter("admincode");
		String pw = request.getParameter("password");
		
		System.out.println(code + pw);
		
		if(code.equals(admincode) && pw.equals(password)) {
			System.out.println("������ �α��� ����");
			// session�� ����
			return "redirect:index.admin";
		}else {
			System.out.println("�α��� ����");
			return "redirect:views/adminLogin_dj.jsp";
		}
		
	}
	

}
