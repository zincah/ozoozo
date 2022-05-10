package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
public class UserProductController {
	@Autowired
	UserService userservice;
	
	@RequestMapping(value = "/productPage.com")
	public String user_product(Model model, UserProductVO vo) {
		List<UserProductVO> product_list;
		List<UserProductVO> product_img_list;
		
		DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
		
		product_list = userservice.productGet(vo);
		
		int price = product_list.get(0).getWhole_price();
		// 기본적인거 설정
		int sale = product_list.get(0).getSale_ratio();
		model.addAttribute("product", product_list);
		model.addAttribute("int_price_sale", price/100*sale);
		model.addAttribute("price",decFormat.format(price));
		model.addAttribute("price_sale", decFormat.format(price/100*sale));
		model.addAttribute("price_first", decFormat.format(price/100*sale-15000));
		
		// img list model 등록
		product_img_list = userservice.productGet_img(vo);
		List<UserProductVO> img_true = new ArrayList<UserProductVO>();
		List<UserProductVO> img_false = new ArrayList<UserProductVO>();
		for(int i = 0; i < product_img_list.size(); i++) {
			if(product_img_list.get(i).isPhoto_separate()) {
				img_true.add(product_img_list.get(i));
			}else {
				img_false.add(product_img_list.get(i));
			}
		}
		model.addAttribute("img_true", img_true);
		model.addAttribute("img_false", img_false);
		
		// 테이블 값 넣기
		UserProductVO product_table;
		product_table = userservice.productGet_table(vo);
		model.addAttribute("table", product_table);
		return "ProductDetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/option_send.com", method=RequestMethod.POST)
	public List<UserProductVO> changePassword(@RequestBody String Option,UserProductVO vo, HttpSession session) {
		String option = Option.replace("\"", "");
		System.out.println("사용자가 보낸 옵션 값 : "+ option +"\n");
		vo.setOption1(option);
		List<UserProductVO> option_list = userservice.productGet_option(vo);
		return option_list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/option_toString.com", method=RequestMethod.POST)
	public String[] itemBuy(@RequestBody String option_String, Model model) {
		option_String = option_String.replace("\"", "");
		String[] option_toString = option_String.split(",");
		
		if(option_toString.length == 1) {
			option_toString[1] = null;
		}
		return option_toString;
	}
}
