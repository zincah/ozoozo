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
	
	private String key; // �̸��Ϸ� ������ ����
	
	@ResponseBody
	@RequestMapping(value = "/sendEmail.com", method=RequestMethod.POST)
	public String sendEmail(@RequestBody Map<String, String> map) {
		System.out.println(map.get("email"));
		String email = map.get("email");
		key = mailSendService.sendAuthEmail(email);
		System.out.println("�̸��� ���� �ڵ� : " + key);
		return key;
	}
	
	@ResponseBody
	@RequestMapping(value = "/email_code_check.com", method=RequestMethod.POST)
	public Boolean checkCode(@RequestBody String Code) {
		String code = Code.replace("\"", "");
		//System.out.println("����ڰ� �Է��� Code : "+code + "\n���� �ڵ� : " + key);
		if(key.equals(code)) {
			return true;
		}else {
			return false;
		}
	}
}
