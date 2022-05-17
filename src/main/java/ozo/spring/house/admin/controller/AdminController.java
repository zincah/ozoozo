package ozo.spring.house.admin.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ozo.spring.house.admin.service.AdminProductManageService;
import ozo.spring.house.admin.service.AdminUserManageService;
import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.common.PageDTO;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminProductManageService productService;
	
	@Autowired
	AdminUserManageService userService;

	@RequestMapping(value = "/index.admin")
	public String adminIndex(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {

			List<UserVO> floatList = userService.floatingPopulation();
			List<String> dateList = new ArrayList<String>();
			List<Integer> countList = new ArrayList<Integer>();
			
			for(int i=0; i<floatList.size(); i++) {
				UserVO vo = floatList.get(i);
				dateList.add("\""+String.valueOf(vo.getLogin_date())+"\"");
				countList.add(vo.getCount());

			}

			System.out.println(dateList.size());
			System.out.println(countList.size());
			
			model.addAttribute("dateList", dateList);
			model.addAttribute("countList", countList);

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
	public String companyManageView(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {
			
			List<SellerVO> sellerList = userService.selectSellerList();
			model.addAttribute("sellerList", sellerList);
			
			return "companyManagement_dh";
		}else {
			return "adminLogin_dj";
		}
	}

	@RequestMapping(value = "/productManagementList.admin")
	public String productManageView(HttpServletRequest request, Model model, Criteria cri, AdminProductVO pvo) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("admincode")!=null) {
			
			pvo.setCri(cri);
			List<AdminProductVO> postList = productService.getProductList(pvo);
			List<AdminProductVO> couponList = productService.selectCouponList();
			int total = productService.searchListCount(pvo);
			
			model.addAttribute("postList", postList);
			model.addAttribute("pageMaker", cri);
			model.addAttribute("totalcount", total);
			model.addAttribute("couponList", couponList);
			
			System.out.println(couponList.size());

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

	

}
