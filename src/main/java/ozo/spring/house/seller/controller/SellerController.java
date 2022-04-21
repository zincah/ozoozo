package ozo.spring.house.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerController {
	@RequestMapping(value = "/index.seller")
	public String sellerIndex() {
		return "inhatest";
	}
}
