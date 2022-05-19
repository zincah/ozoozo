package ozo.spring.house.user.controller;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.user.service.UserMainService;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserVO;
@Controller
public class UserController {
	
	@Autowired
	UserService userservice;
	
	@Autowired
	UserMainService userMainService;
	
	@RequestMapping(value = "/main.com")
	public String user_main(UserProductVO vo, Model model) {
		
		// product list �뜝�떛源띿삕
		List<UserProductVO> productList = userMainService.mainProductList(vo);
		int total = userMainService.getProductCount();
		
		// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 list �뜝�떛源띿삕
		List<UserProductVO> todayDealList = userMainService.mainDealProductList(vo);
		System.out.println(todayDealList.size());
		
		// main banner list �뜝�떛源띿삕
		List<BannerVO> bannerList = userMainService.selectBannerList();

		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //�뜝���눦�삕�뜝�룞�삕 �뜝�뙃�눦�삕
			
			pro.setSale_price(decFormat.format(sale_price));
		}

		model.addAttribute("totalCount", total);
		model.addAttribute("productList", productList);
		model.addAttribute("todayDealList", todayDealList);
		model.addAttribute("bannerList", bannerList);
		
		return "ozomain_zinc";
	}
	@RequestMapping(value = "/best.com")
	public String user_best() {
		return "ozobest_zinc";
	}

	

	
	@RequestMapping(value = "/shop.com")
	public String user_shop() {
		return "ozoshop_main";
	}

	
	
	
	@RequestMapping(value = "/myReview_view.com")
	public String user_Review_V() {
		return "myReview-view";
	}
	@RequestMapping(value = "/myReview_write.com")
	public String user_Review_W() {
		return "myReview-write";
	}

	
	
	@RequestMapping(value = "/customercenter.com")
	public String user_customercenter() {
		return "customercenter";
	}
	// my_shopping (status) �뜝�떛怨ㅼ삕 �뜝�떥怨ㅼ삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�옚�뜝�룞�삕�뜝占�
	
	
	
	@RequestMapping(value = "/myreview.com")
	public String user_myReview_view() {
		return "myReview-view";
	}
	
	//�뜝�룞�삕�뜝�룞�삕
	//-	�뜝�룞�삕艅섇뜝�떕占� �뜝�룞�삕�뜝�룞�삕
	
	@RequestMapping(value = "/password_m.com")
	public String user_P_M(HttpSession session) {
		if(session.getAttribute("Usercode")!=null) {
			return "ozopasswordModi_zinc";
		}else {
			return "ozoLogin_zinc";
		}
	}
	//-�쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	@RequestMapping(value = "/edit.com")
	public String user_edit() {
		return "ozoedit_zinc";
	}
	//�뜝�룞�삕�뜝�뜲�벐�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 
	@RequestMapping(value = "/myreview_write.com")
	public String user_myReview_write() {
		return "myReview-write";
	}
	//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕泥�
	@RequestMapping(value = "/shopApply.com")
	public String user_shopApply(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			return "ShopApply";
		}else {
			return "redirect:login.com";
		}
	}
	//�뜝�떥源띿삕�뜝�룞�삕 �솕�뜝�띂�뿉�뜝�룞�삕 �뜝�룞�삕艅섇뜝�떕占� �뜝�뜾�꽕�뜝�룞�삕
	@RequestMapping(value = "/passwordReset.com")
	public String user_passwordReset() {
		return "passwordReset";
	}
	
	@RequestMapping(value = "/error404.com")
	public String error404() {
		return "error/404Error";
	}
	
	@RequestMapping(value = "/error500.com")
	public String error500() {
		return "error/500Error";
	}
	@RequestMapping(value = "/shoptest.com")
	public String shop() {
		return "shop";
	}


}
