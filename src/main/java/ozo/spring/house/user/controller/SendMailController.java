package ozo.spring.house.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.service.MailSendService;

@Controller
public class SendMailController {
	
	@Autowired
	MailSendService mailSendService;
	
	@ResponseBody
	@RequestMapping(value = "/sendEmail.com", method=RequestMethod.POST)
	public String sendEmail(@RequestBody Map<String, String> map) {
		System.out.println(map.get("email"));
		String email = map.get("email");
		String key = mailSendService.sendAuthEmail(email);
		return key;
	}
	
	


}
