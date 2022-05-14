package ozo.spring.house.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.service.userMyPageService;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class UserMyPageController {
	
	@Autowired
	userMyPageService usermypageservice;
	
	@RequestMapping(value="/m_edit.com")
	public String myuser(UserVO vo,Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		System.out.println((int)session.getAttribute("User_Num"));
		vo.setUser_num((int)session.getAttribute("User_Num"));
		
		List<UserVO> list;
		list =usermypageservice.User_Info(vo);
		
//		 model.addAttribute("user_info", list);
		return "ozoedit_zinc";
	}
	
	@ResponseBody
	@RequestMapping
	public void user_edit(UserVO vo) {
		
	}
}
