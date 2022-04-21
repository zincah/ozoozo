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
	@RequestMapping(value = "/edit.com")
	public String user_edit() {
		return "ozoedit_zinc";
	}
	@RequestMapping(value = "/login.com")
	public String user_login() {
		return "ozoLogin_zinc";
	}
	@RequestMapping(value = "/password_m.com")
	public String user_P_M() {
		return "ozopasswordModi_zinc";
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
	@RequestMapping(value = "/myPage.com")
	public String user_mypage() {
		return "myPage";
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
}
