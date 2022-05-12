package ozo.spring.house.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.admin.service.AdminBannerService;
import ozo.spring.house.admin.vo.BannerVO;

@Controller
public class AdminEventController {
	
	@Autowired
	AdminBannerService AdminBannerService; 
	
	@RequestMapping(value = "/m_eventManagement.admin")
	public String eventManagementView(HttpServletRequest request,Model model,BannerVO vo) {
		
		HttpSession session = request.getSession();
		
		List<BannerVO> list ; 
		list = AdminBannerService.b_select(vo);
		model.addAttribute("list",list);
		
		if(session.getAttribute("admincode")!=null) {
			return "eventManagement_dj";
		}else {
			return "adminLogin_dj";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/statuschange.admin", method = { RequestMethod.POST })
	public void eventbtn(@RequestParam Map<String,String> param, BannerVO vo) {
		
//		vo.setBanner_id(id);
//		if(bool == "Àç°³½Ã") {
//			vo.setBanner_status(false);s
//		}else {
//			vo.setBanner_status(true);
//		}
//		System.out.println(bool);
		System.out.println(param.get("item"));
		
		
	}
}
