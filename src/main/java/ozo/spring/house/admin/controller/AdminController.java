package ozo.spring.house.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping(value = "/index.admin")
	public String adminIndex(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "index";
		}else {
			return "adminLogin_dj";
		}

	}

	@RequestMapping(value = "/information.admin")
	public String informationView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "information_zinc";
		}else {
			return "adminLogin_dj";
		}

	}

	@RequestMapping(value = "/companyManagement.admin")
	public String companyManageView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "companyManagement_dh";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/productManagementList.admin")
	public String productManageView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "productManagementList_zinc";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/reviewManagement.admin")
	public String reviewManageView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "reviewManagement_02";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/salesStatus.admin")
	public String saleStatusView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "salesStatus_dh";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/calculateManagement.admin")
	public String calculateManageView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "calculateManagement_dj";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/clientInformation.admin")
	public String clientInformationView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "clientInformation_zinc";
		}else {
			return "adminLogin_dj";
		}
	}



	@RequestMapping(value = "/couponManagement.admin")
	public String couponManagementView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "couponManagement_zinc";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/eventManagement.admin")
	public String eventManagementView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			return "eventManagement_dj";
		}else {
			return "adminLogin_dj";
		}
	}
	

}
