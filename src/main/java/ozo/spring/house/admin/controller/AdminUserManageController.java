package ozo.spring.house.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.admin.service.AdminUserManageService;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class AdminUserManageController {
	
	@Autowired
	AdminUserManageService userManage;
	
	@RequestMapping(value = "/memberManagement.admin")
	public String memberManagementView(HttpServletRequest request, UserVO vo, Model model) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			
			List<UserVO> userList = userManage.selectUser(vo);
			model.addAttribute("userList", userList);
			
			
			return "memberManagement_dh";
		}else {
			return "adminLogin_dj";
		}
	}
	

	@ResponseBody
	@RequestMapping(value = "/getUserList.admin", method=RequestMethod.POST)
	public List<UserVO> getUserList(@RequestBody String check, UserVO vo) {
		
		check = check.replaceAll("\"", "");
		List<UserVO> userList = new ArrayList<UserVO>();
		
		if(check.equals("")) {
			userList = userManage.selectUser(vo);
			return userList;
		}else {
			vo.setUser_type(check);
			userList = userManage.selectUserType(vo);
			return userList;
		}
		
	}

}
