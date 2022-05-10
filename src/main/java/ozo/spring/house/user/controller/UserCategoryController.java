package ozo.spring.house.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.service.UserCategoryService;
import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserCategoryVO;

@Controller
public class UserCategoryController {
	
	
	@Autowired
	UserCategoryService userCategoryService;
	
	@RequestMapping(value = "/m_category.com")
	public String firstpage( UserCategoryVO vo,Model model) {
//		List<UserCategoryVO> m_list; 
//		m_list = UserCategoryService.m_category(vo);
//		List<UserCategoryVO> s_list; 
//		s_list = UserCategoryService.s_category(vo);
//		List<UserCategoryVO> b_list; 
//		b_list = UserCategoryService.b_category(vo);
//		model.addAttribute("m_list", m_list);
//		model.addAttribute("s_list", s_list);
//		model.addAttribute("b_list", b_list);
		
		
		return "ozocategory_zinc";
	}
	@ResponseBody
	@RequestMapping(value = "/gocategory.com", method=RequestMethod.GET)
	public List<UserCategoryVO> catelist(String category,UserCategoryVO vo) {
		
		System.out.println(category);
		List<UserCategoryVO> s_list=null ;
		
			
		s_list = userCategoryService.s_category(vo);
		
		
		return s_list;
	}
	
}
