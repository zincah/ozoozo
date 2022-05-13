package ozo.spring.house.admin.controller;

import java.util.HashMap;
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
	public Map<String,String> eventbtn(@RequestBody Map<String,String> param, BannerVO vo) {
		
		
		if(param.get("bool").equals("�簳��")) {
			vo.setBanner_status(true);
			System.out.println(param.get("Ʈ�� �־���"));
		}else if(param.get("bool").equals("����")) {
			vo.setBanner_status(false);
			System.out.println(param.get("false �־���"));
		}
		
		vo.setBanner_id(Integer.parseInt(param.get("item")));
		
		System.out.println(param.get("item"));
		System.out.println(param.get("bool"));
		
		AdminBannerService.b_boolean(vo);
		
		// �����Ҷ� ������ �����Ͽ� ajax ������ �Բ� �׽�Ʈ�Ͽ� �޴� �� ���޴� �� üũ �Ұ�!!
		//sysout���� ���� �׽�Ʈ �غ��� 
		//json�� @requestbody
		Map<String,String> map = new HashMap<String,String>();
		map.put("item", param.get("item"));
		map.put("bool", param.get("bool"));
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/view.admin", method = { RequestMethod.POST })
	public List<BannerVO> bannerview(@RequestBody Map<String,String> param,BannerVO vo ){

		vo.setBanner_id(Integer.parseInt(param.get("id")));
		System.out.println(param.get("id"));
		List<BannerVO> list = AdminBannerService.b_selectone(vo);
		
		return list;
		
	}
}
