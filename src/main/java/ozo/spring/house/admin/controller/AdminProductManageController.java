package ozo.spring.house.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.admin.service.AdminProductManageService;
import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.common.PageDTO;

@Controller
public class AdminProductManageController {
	
	@Autowired
	AdminProductManageService productService;
	
	@RequestMapping(value="/movePaging.admin", method=RequestMethod.POST)
	public String movePaging(@RequestBody Map<String, String> searchCondition, Criteria cri, Model model) {

		System.out.println(searchCondition);
		int pageNum = Integer.parseInt(searchCondition.get("pageNum"));
		
		cri = new Criteria(pageNum, 10);
		List<AdminProductVO> postList = productService.selectPosting(cri);
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", cri);

		return "postList";
	}
	
	

}
