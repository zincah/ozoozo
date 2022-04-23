package ozo.spring.house.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping(value = "/index.admin")
	public String adminIndex(HttpSession session) {
		
		if(session.getAttribute("admincode")!=null) {
			return "index";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/information.admin")
	public String informationView() {
		
		return "information_zinc";
	}

	@RequestMapping(value = "/companyManagement.admin")
	public String companyManageView() {
		return "companyManagement_dh";
	}

	@RequestMapping(value = "/productManagementList.admin")
	public String productManageView() {
		return "productManagementList_zinc";
	}

	@RequestMapping(value = "/reviewManagement.admin")
	public String reviewManageView() {
		return "reviewManagement_02";
	}

	@RequestMapping(value = "/salesStatus.admin")
	public String saleStatusView() {
		return "salesStatus_dh";
	}

	@RequestMapping(value = "/calculateManagement.admin")
	public String calculateManageView() {
		return "calculateManagement_dj";
	}

	@RequestMapping(value = "/clientInformation.admin")
	public String clientInformationView() {
		return "clientInformation_zinc";
	}

	@RequestMapping(value = "/memberManagement.admin")
	public String memberManagementView() {
		return "memberManagement_dh";
	}

	@RequestMapping(value = "/couponManagement.admin")
	public String couponManagementView() {
		return "couponManagement_zinc";
	}

	@RequestMapping(value = "/eventManagement.admin")
	public String eventManagementView() {
		return "eventManagement_dj";
	}
	

}
