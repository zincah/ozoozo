package ozo.spring.house.admin.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import ozo.spring.house.seller.service.CategoryService;
import ozo.spring.house.seller.service.ProductService;
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
			
			int waitcount = productService.registrationWait();
			int holdcount = productService.registrationHold();
			List<Integer> regiList = new ArrayList<Integer>();
			regiList.add(waitcount);
			regiList.add(holdcount);
			
			for(int i=0; i<floatList.size(); i++) {
				UserVO vo = floatList.get(i);
				dateList.add("\""+String.valueOf(vo.getLogin_date())+"\"");
				countList.add(vo.getCount());

			}

			System.out.println(dateList.size());
			System.out.println(countList.size());
			
			model.addAttribute("dateList", dateList);
			model.addAttribute("countList", countList);
			model.addAttribute("regiList", regiList);

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
	public String companyManageView(HttpServletRequest request, Model model, SellerVO vo) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {
			
			List<SellerVO> sellerList = userService.selectSellerList(vo);
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
	public String saleStatusView(HttpServletRequest request, AdminProductVO vo, Model model) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("admincode")!=null) {
			
			// 매출 날짜 세팅
			vo.setStartdate(java.sql.Date.valueOf("2018-01-01"));
			Date today = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        String formattedDate = simpleDateFormat.format(today);
			vo.setEnddate(java.sql.Date.valueOf(formattedDate));
			
			List<AdminProductVO> sellerSaleList = productService.sellerSale(vo);
			
			for(int i=0; i<sellerSaleList.size(); i++) {
				AdminProductVO ch = sellerSaleList.get(i);
				int fee = 5;
				int realPayment = (int)Math.round(ch.getPayment()*(1-fee/100.0));
				ch.setFee(fee);
				ch.setRealPayment(realPayment);
			}
			
			model.addAttribute("sellerSaleList", sellerSaleList);
			
			

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
