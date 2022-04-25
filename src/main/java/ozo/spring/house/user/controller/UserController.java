package ozo.spring.house.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class UserController {
	@RequestMapping(value = "/main.com")
	public String user_main() {
		return "ozomain_zinc";
	}
	@RequestMapping(value = "/best.com")
	public String user_best() {
		return "ozobest_zinc";
	}
	@RequestMapping(value = "/cart.com")
	public String user_cart() {
		return "ozocart_zinc";
	}
	@RequestMapping(value = "/category.com")
	public String user_category() {
		return "ozocategory_zinc";
	}
	
	@RequestMapping(value = "/login.com")
	public String user_login() {
		return "ozoLogin_zinc";
	}
	//회원가입 페이지
	@RequestMapping(value = "/signUp.com")
	public String user_signUp() {
		return "SignUp";
	}
	
	@RequestMapping(value = "/shop.com")
	public String user_shop() {
		return "ozoshop_main";
	}
	@RequestMapping(value = "/todaydeal.com")
	public String user_todaydeal() {
		return "ozotodaydeal_zinc";
	}
	@RequestMapping(value = "/productPage.com")
	public String user_product() {
		return "ProductDetail";
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
	// my_shopping (status) 이거 두개라서 설정 고민해야함
	
	//마이페이지
	@RequestMapping(value = "/myPage.com")
	public String user_mypage() {
		return "myPage";
	}
	//나의 쇼핑
	@RequestMapping(value = "/myshopping.com")
	public String user_myShopping() {
		return "my_shopping_status";
	}
	//나의리뷰
	@RequestMapping(value = "/myreview.com")
	public String user_myReview_view() {
		return "myReview-view";
	}
	
	//설정
	//-	비밀번호 변경
	
	@RequestMapping(value = "/password_m.com")
	public String user_P_M() {
		return "ozopasswordModi_zinc";
	}
	//-회원정보 변경
	@RequestMapping(value = "/edit.com")
	public String user_edit() {
		return "ozoedit_zinc";
	}
	//리뷰쓰는 페이지 
	@RequestMapping(value = "/myreview_write.com")
	public String user_myReview_write() {
		return "myReview-write";
	}
	//입점신청
	@RequestMapping(value = "/shopApply.com")
	public String user_shopApply() {
		return "ShopApply";
	}
	//로그인 화면에서 비밀번호 재설정
	@RequestMapping(value = "/passwordReset.com")
	public String user_passwordReset() {
		return "passwordReset";
	}
}
