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
		
		// product list �̱�
		List<UserProductVO> productList = userMainService.mainProductList(vo);
		
		// ������ �� list �̱�
		List<UserProductVO> todayDealList = userMainService.mainDealProductList(vo);
		System.out.println(todayDealList.size());
		
		// main banner list �̱�
		List<BannerVO> bannerList = userMainService.selectBannerList();

		for(int i=0; i<productList.size(); i++) {
			UserProductVO pro = productList.get(i);
			int sale_price = pro.getWhole_price()*(100-pro.getSale_ratio())/100;
			
			DecimalFormat decFormat = new DecimalFormat("###,###"); //�Ҽ��� �Լ�
			
			pro.setSale_price(decFormat.format(sale_price));
		}

		model.addAttribute("productList", productList);
		model.addAttribute("todayDealList", todayDealList);
		model.addAttribute("bannerList", bannerList);
		
		return "ozomain_zinc";
	}
	@RequestMapping(value = "/best.com")
	public String user_best() {
		return "ozobest_zinc";
	}
	@RequestMapping(value = "/category.com")
	public String user_category() {
		return "ozocategory_zinc";
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
	@RequestMapping(value = "/orders.com")
	public String user_orders() {
		return "orders";
	}
	
	@RequestMapping(value = "/calculation.com")
	public String user_calculation() {
		return "calculation";
	}
	@RequestMapping(value = "/customercenter.com")
	public String user_customercenter() {
		return "customercenter";
	}
	// my_shopping (status) �̰� �ΰ��� ���� ����ؾ���
	
	
	//���� ����
	@RequestMapping(value = "/myshopping.com")
	public String user_myShopping() {
		return "my_shopping_status";
	}
	//���Ǹ���
	@RequestMapping(value = "/myreview.com")
	public String user_myReview_view() {
		return "myReview-view";
	}
	
	//����
	//-	��й�ȣ ����
	
	@RequestMapping(value = "/password_m.com")
	public String user_P_M(HttpSession session) {
		if(session.getAttribute("Usercode")!=null) {
			return "ozopasswordModi_zinc";
		}else {
			return "ozoLogin_zinc";
		}
	}
	//-ȸ������ ����
	@RequestMapping(value = "/edit.com")
	public String user_edit() {
		return "ozoedit_zinc";
	}
	//���侲�� ������ 
	@RequestMapping(value = "/myreview_write.com")
	public String user_myReview_write() {
		return "myReview-write";
	}
	//������û
	@RequestMapping(value = "/shopApply.com")
	public String user_shopApply(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Num")!=null) {
			return "ShopApply";
		}else {
			return "redirect:login.com";
		}
	}
	//�α��� ȭ�鿡�� ��й�ȣ �缳��
	@RequestMapping(value = "/passwordReset.com")
	public String user_passwordReset() {
		return "passwordReset";
	}


}
