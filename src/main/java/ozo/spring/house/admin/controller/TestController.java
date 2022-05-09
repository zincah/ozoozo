package ozo.spring.house.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@RequestMapping(value = "/test.admin")
	public String testView() {
		return "test";
	}
	

	@RequestMapping(value = "/testtest.admin", method = RequestMethod.POST)
	public String testtestView(@RequestBody String test) {
		
		System.out.println(test);
		
		return "test2";
	}
	



}
