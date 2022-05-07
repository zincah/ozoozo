package ozo.spring.house.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.user.service.CScenterService;
import ozo.spring.house.user.vo.CScenterVO;

@Controller
public class CSController {

	@Autowired
	CScenterService csservice;
	
	
	@RequestMapping(value = "/CScenter.com")
	public String user_CSceneter(Model model,CScenterVO vo) {
		List<CScenterVO> list;
		list =csservice.csall(vo);
		model.addAttribute("list",list);
		return "customercenter";
	}
	


	
	
	@ResponseBody
	@RequestMapping(value = "/getCS.com", method=RequestMethod.GET)
	public List<CScenterVO> getCSList(String key,CScenterVO vo) {
		vo.setCustomer_keyword(key);
		System.out.println(key);
		List<CScenterVO> list = csservice.cskeyword(vo);
		
		return list;
	}
	
	
	
	
}
