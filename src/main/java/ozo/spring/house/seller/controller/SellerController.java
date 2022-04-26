package ozo.spring.house.seller.controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerController {
	@RequestMapping(value = "/index.seller")
	public String sellerIndex(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("sellerid")!=null) {
			return "index";
		}else {
			return "seller-login";
		}
	}
	@RequestMapping(value = "/insertProduct.seller")
	public String sellerInsertProduct() {
		return "seller-insertProduct";
	}
	@RequestMapping(value = "/productManagement.seller")
	public String sellerProductManagement() {
		return "seller-productManagement";
	}
	@RequestMapping(value = "/order.seller")
	public String sellerOrder() {
		return "seller-order";
	}
	@RequestMapping(value = "/salesManagement.seller")
	public String sellerSalesManagement() {
		return "seller-salesManagement";
	}
	@RequestMapping(value = "/review.seller")
	public String sellerReview() {
		return "seller-review";
	}
	@RequestMapping(value = "/notice.seller")
	public String sellerNotice() {
		return "seller-notice";
	}
	@RequestMapping(value = "/login.seller")
	public String sellerLogin() {
		return "seller-login";
	}
}
