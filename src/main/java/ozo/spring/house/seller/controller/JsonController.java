package ozo.spring.house.seller.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.seller.service.ProductService;
import ozo.spring.house.seller.service.SellerFilteringService;
import ozo.spring.house.seller.service.SellerProductDetailService;
import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.ProductDetailVO;
import ozo.spring.house.seller.vo.ProductVO;

@Controller
public class JsonController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	SellerFilteringService filter;
	
	@Autowired
	SellerProductDetailService productDetailService;
	
	private int postingCode;
	
	// detail 내용 전달받는 부분
	@ResponseBody
	@RequestMapping(value="/getJson.seller", method=RequestMethod.POST)
	public List<Map<String, Object>> getJson(@RequestBody List<Map<String, Object>> jsondata, ProductDetailVO dvo, HttpServletRequest request) {
		System.out.println(jsondata);
		// get 방식으로 카테고리 받기
		
		
		HttpSession session = request.getSession();
		int postingCode = (Integer)session.getAttribute("postingCode");
		System.out.println(postingCode);
		
		Map<String, Object> optionMap = jsondata.get(0);
		System.out.println(optionMap);
		
		filter.setFilter(optionMap, 1, postingCode);

		
		Map<String, Object> tableMap = jsondata.get(1);
		System.out.println(tableMap);

		
		dvo.setTable_title((String)tableMap.get("table_productTitle"));
		dvo.setTable_kc((String)tableMap.get("table_kc"));
		dvo.setTable_color((String)tableMap.get("table_color"));
		dvo.setTable_component((String)tableMap.get("table_component"));
		dvo.setTable_material((String)tableMap.get("table_material"));
		dvo.setTable_manufacturer((String)tableMap.get("table_manufacturer"));
		dvo.setTable_country((String)tableMap.get("table_country"));
		dvo.setTable_size((String)tableMap.get("table_size"));
		dvo.setTable_delivery((String)tableMap.get("table_delivery"));
		dvo.setTable_qa((String)tableMap.get("table_qa"));
		dvo.setTable_cstel((String)tableMap.get("table_cstel"));
		dvo.setProtable_postid(postingCode);
		dvo.setShiptable_info((String)tableMap.get("shiptable_info"));
		dvo.setShiptable_fee((String)tableMap.get("shiptable_fee"));
		dvo.setShiptable_plusfee((String)tableMap.get("shiptable_pulsfee"));
		dvo.setShiptable_unable((String)tableMap.get("shiptable_unable"));
		dvo.setShiptable_propotionalfee((String)tableMap.get("shiptable_propotionalfee"));
		dvo.setRefundtable_fee((String)tableMap.get("refundtable_fee"));
		dvo.setExchangetable_fee((String)tableMap.get("exchangetable_fee"));
		dvo.setRefundtable_address((String)tableMap.get("refundtable_address"));

		productDetailService.insertTables(dvo);
		
		
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
	public int insertProduct(@RequestBody List<Map<String, String>> jsondata, ProductVO vo, HttpServletRequest request) {
		System.out.println(jsondata);
		
		int postingCode = productService.insertPostIdAndGet(vo);
		HttpSession session = request.getSession();
		session.setAttribute("postingCode", postingCode);
		
		System.out.println(postingCode);
		
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
			vo.setProduct_postid(postingCode);

			productService.insertProduct(vo);
		}
		


		return postingCode;
	}
	
	@RequestMapping(value="/getFilterOption.seller", method=RequestMethod.POST)
	public String getFilterOption(@RequestBody CategoryVO vo) {
		
		
		
		return null;
		
	}
	


}
