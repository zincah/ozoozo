package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.user.service.CScenterService;
import ozo.spring.house.user.service.MailSendService;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.service.UserScrapService;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserScrapVO;
@Controller
public class U_PublicController {
	
	@Autowired
	UserService userservice;
	
	@Autowired
	UserMainService userMainService;
	
	@Autowired
	UserScrapService userScrapService;
	
	@Autowired
	MailSendService mailSendService;
	
	//send Emails
	private String key; // 이메일로 보내진 난수
	
	@ResponseBody
	@RequestMapping(value = "/sendEmail.com", method=RequestMethod.POST)
	public String sendEmail(@RequestBody Map<String, String> map) {
		System.out.println(map.get("email"));
		String email = map.get("email");
		key = mailSendService.sendAuthEmail(email);
		System.out.println("이메일 인증 코드 : " + key);
		return key;
	}
	
	@ResponseBody
	@RequestMapping(value = "/email_code_check.com", method=RequestMethod.POST)
	public Boolean checkCode(@RequestBody String Code) {
		String code = Code.replace("\"", "");
		//System.out.println("사용자가 입력한 Code : "+code + "\n원래 코드 : " + key);
		if(key.equals(code)) {
			return true;
		}else {
			return false;
		}
	}
	
	
}
