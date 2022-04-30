package ozo.spring.house.seller.controller;


import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class JsonController {
	
	@Autowired
	ProductService productService;
	
	private int postingCode;
	
	@ResponseBody
	@RequestMapping(value="/getJson.seller", method=RequestMethod.POST)
	public String getJson(@RequestBody String jsondata) {
		System.out.println(jsondata);
		return jsondata;
	}
	
	@ResponseBody
	@RequestMapping(value="/getJsonArray.seller", method=RequestMethod.POST)
	public Map<String, List<Map<String, String>>> getJsonArray(@RequestBody Map<String, List<Map<String, String>>> jsondata) {
		System.out.println(jsondata);
		return jsondata;
	}
	
	// 제품게시글 등록시 제품 먼저 등록해주는 json
	// posting code를 만들기
	
	@ResponseBody
	@RequestMapping(value="/insertProduct.seller", method=RequestMethod.POST)
	public List<Map<String, String>> insertProduct(@RequestBody List<Map<String, String>> jsondata, ProductVO vo) {
		System.out.println(jsondata);
		
		//
				
		for(Map<String, String> jmap : jsondata) {
			vo.setPro_catecode(Integer.parseInt(jmap.get("pro_catecode")));
			vo.setPro_subcatecode(Integer.parseInt(jmap.get("pro_subcatecode")));
			vo.setOption1_name(jmap.get("option1_name"));
			vo.setOption2_name(jmap.get("option2_name"));
			vo.setSeller_id(Integer.parseInt(jmap.get("seller_id")));
			vo.setProduct_title(jmap.get("product_title"));
			vo.setOption1(jmap.get("option1"));
			vo.setOption2(jmap.get("option2"));
			vo.setProduct_price(Integer.parseInt(jmap.get("product_price")));
			vo.setProduct_quantity(Integer.parseInt(jmap.get("product_quantity")));

			productService.insertProduct(vo);
		}


		return jsondata;
	}
	


}
