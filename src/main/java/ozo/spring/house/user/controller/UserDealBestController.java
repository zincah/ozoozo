package ozo.spring.house.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserDealBestController {
	
	@RequestMapping(value = "/todaydeal.com")
	public String user_todaydeal() {
		return "ozotodaydeal_zinc";
	}

}
