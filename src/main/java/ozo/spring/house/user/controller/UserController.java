package ozo.spring.house.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class UserController {
	@RequestMapping(value = "/main.com")
	public String sellerIndex() {
		return "ozomain_zinc";
	}
}
