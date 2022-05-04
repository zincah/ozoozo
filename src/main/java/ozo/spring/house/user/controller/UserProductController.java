package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class UserProductController {
	@Autowired
	UserService userservice;
	
	@RequestMapping(value = "/productPage.com")
	public String user_product(Model model, UserProductVO vo) {
		List<UserProductVO> product_list;
		
		
		DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
		
		product_list = userservice.productGet(vo);
		int price = product_list.get(0).getWhole_price();
		// 기본적인거 설정
		model.addAttribute("product", product_list);
		model.addAttribute("price",decFormat.format(price));
		model.addAttribute("price_sale", decFormat.format(price/100*70));
		model.addAttribute("price_first", decFormat.format(price/100*70-15000));
		return "ProductDetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/option_send.com", method=RequestMethod.POST)
	public List<UserProductVO> changePassword(@RequestBody String Option,UserProductVO vo, HttpSession session) {
		String option = Option.replace("\"", "");
		System.out.println("사용자가 보낸 옵션 값 : "+ option +"\n");
		vo.setOption1(option);
		List<UserProductVO> option_list = userservice.productGet_option(vo);
		System.out.println(option_list.get(0).getOption2());
		return option_list;
	}
}
