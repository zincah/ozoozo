package ozo.spring.house.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonController {
	
	@ResponseBody
	@RequestMapping("/getJson.seller")
	public String getJson(Object object) {
		System.out.println(object);
		return "index";
	}

}
