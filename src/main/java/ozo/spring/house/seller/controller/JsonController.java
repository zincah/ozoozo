package ozo.spring.house.seller.controller;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonController {
	
	@ResponseBody
	@RequestMapping(value="/getJson.seller", method=RequestMethod.POST)
	public Map<String, Map<String, String>> getJson(@RequestBody Map<String, Map<String, String>> jsondata) {
		System.out.println(jsondata);
		return jsondata;
	}
	
	@ResponseBody
	@RequestMapping(value="/getJsonArray.seller", method=RequestMethod.POST)
	public Map<String, List<Map<String, String>>> getJsonArray(@RequestBody Map<String, List<Map<String, String>>> jsondata) {
		System.out.println(jsondata);
		return jsondata;
	}


}
