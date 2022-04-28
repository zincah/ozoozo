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
	
	private String key; // 이메일로 보내진 난수
	
	@ResponseBody
	@RequestMapping(value = "/sendEmail.com", method=RequestMethod.POST)
	public String sendEmail(@RequestBody Map<String, String> map) {
		System.out.println(map.get("email"));
		String email = map.get("email");
		key = mailSendService.sendAuthEmail(email);
		System.out.println(key);
		return key;
	}
	
	@ResponseBody
	@RequestMapping(value = "/email_code_check.com", method=RequestMethod.POST)
	public Boolean checkCode(@RequestBody String Code) {
		String code = Code.replace("\"", "");
		System.out.println("사용자가 입력한 Code : "+code + "\n원래 코드 : " + key);
		if(key.equals(code)) {
			return true;
		}else {
			return false;
		}
	}
}
