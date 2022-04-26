package ozo.spring.house.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ozo.spring.house.user.vo.CScenterVO;

@Controller
public class CSController {

	
	@RequestMapping(value = "/CScenter.com")
	public String user_CSceneter(CScenterVO vo,Model model ) {
		
		model.addAttribute("question",vo.getCustomer_question());
		model.addAttribute("answer",vo.getCustomer_answer());
		return "customercenter";
	}
}
