package ozo.spring.house.admin.controller;

import java.sql.Date;
import java.sql.Timestamp;
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

import ozo.spring.house.admin.service.AdminUserManageService;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class AdminUserManageController {
	
	@Autowired
	AdminUserManageService userManage;
	
	// 회원관리 로딩시 처음으로 정보를 가지고 오는 mapping
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
	
	// 회원 타입 선택시 정보를 가지고 오는 mapping
	@ResponseBody
	@RequestMapping(value = "/getUserList.admin", method=RequestMethod.POST)
	public List<UserVO> getUserList(@RequestBody Map<String, String> searchMap, UserVO vo) {
		
		List<UserVO> userList = new ArrayList<UserVO>();
		
		System.out.println(searchMap);
		
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));
		
		userList = userManage.getUserList(vo);
		
		return userList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateUserStatus.admin", method=RequestMethod.POST)
	public List<UserVO> updateUserStatus(@RequestBody List<String> usernumlist, UserVO vo) {

		List<UserVO> userList = new ArrayList<UserVO>(); // 받아오는 정보 저장하는 list

		String user_status = usernumlist.get(usernumlist.size()-1);
		vo.setUser_status(user_status);
		
		for(int i=0; i<usernumlist.size()-1; i++) {
			vo.setUser_num(Integer.parseInt(usernumlist.get(i)));
			userManage.updateUserStatus(vo);
		}
		
		userList = userManage.selectUser(vo);
		
		return userList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/useSearchBox.admin", method=RequestMethod.POST)
	public List<UserVO> useSearchBox(@RequestBody Map<String, String> searchMap, UserVO vo) {

		List<UserVO> userList = new ArrayList<UserVO>(); // 받아오는 정보 저장하는 list

		System.out.println(searchMap);
		
		vo.setUser_type(searchMap.get("user_type"));
		vo.setUser_status(searchMap.get("user_status"));
		vo.setStartdate(Date.valueOf(searchMap.get("startdate")));
		vo.setEnddate(Date.valueOf(searchMap.get("enddate")));
		vo.setPack(searchMap.get("pack"));
		vo.setKeyword(searchMap.get("keyword"));
		
		userList = userManage.getUserList(vo);
		
		
		return userList;
	}
	
	


}
