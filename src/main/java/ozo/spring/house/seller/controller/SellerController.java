package ozo.spring.house.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerController {
	@RequestMapping(value = "/index.seller")
	public String sellerIndex() {
		return "index";
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
}
