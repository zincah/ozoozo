package ozo.spring.house.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.dao.UserDAO.product_cls;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.CouponVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserProduct_tableVO;
import ozo.spring.house.user.vo.UserVO;

@Controller
public class UserProductController {
	@Autowired
	UserService userservice;
	
	product_cls pro_cls;
	List<UserProductVO> product_list;
	int pro;
	CouponVO coupon = new CouponVO();
	
	@RequestMapping(value = "/productPage.com")
	public String user_product(Model model, UserProductVO vo, UserProduct_tableVO tvo, HttpServletRequest request) {
		// 상품 아이디
		this.pro = Integer.parseInt(request.getParameter("p"));
		//System.out.println(pro);  상품 아이디로 전달
		
		List<UserProductVO> product_img_list;
		UserProductVO uvo = new UserProductVO();
		uvo.setPost_id(pro);
		
		pro_cls = userservice.get_product_class();
		
		DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
		product_list = userservice.productGet(uvo);
		
		int price = product_list.get(0).getWhole_price();
		// 기본적인거 설정
		int sale = product_list.get(0).getSale_ratio();
		model.addAttribute("product", product_list);
		model.addAttribute("int_price_sale", price/100*sale);
		model.addAttribute("price",decFormat.format(price));
		model.addAttribute("price_sale", decFormat.format(price/100*sale));
		model.addAttribute("price_first", decFormat.format(price/100*sale-15000));
		// img list model 등록
		product_img_list = userservice.productGet_img(uvo);
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
		UserProduct_tableVO product_table = new UserProduct_tableVO();
		UserProduct_tableVO product_table2;
		product_table.setProtable_postid(pro);
		product_table2 = userservice.productGet_table(product_table);
		model.addAttribute("table", product_table2);
		
		//쿠폰
		if(product_list.get(0) != null) {
			this.coupon = pro_cls.get_coupon(product_list.get(0));
			model.addAttribute("coupon", coupon);
		}
		return "ProductDetail";
	}
	// get option 2
	@ResponseBody
	@RequestMapping(value = "/option_send.com", method=RequestMethod.POST)
	public List<UserProductVO> get_option2(@RequestBody String Option,UserProductVO vo, HttpSession session,HttpServletRequest request) {
		String option = Option.replace("\"", "");
		System.out.println("사용자가 보낸 옵션 값 : "+ option +"\n");
		vo.setOption1(option);
		vo.setPost_id(pro);
		List<UserProductVO> option_list = userservice.productGet_option(vo);
		return option_list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/option_toString.com", method=RequestMethod.POST)
	public String[] itemBuy(@RequestBody String option_String, Model model) {
		option_String = option_String.replace("\"", "");
		String[] option_toString = option_String.split(",");
		return option_toString;
	}
	
	// cart insert
	@ResponseBody
	@RequestMapping(value = "/basket_ajax.com", method=RequestMethod.POST)
	public String basket_add(@RequestBody String[] option_arr, HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("User_Num")==null) {
			return "123";
		}
		if(option_arr.length == 0) {
			return "error";
		}
		
		List<UserProductVO> option_li = new ArrayList<UserProductVO>();
		UserVO U_vo = new UserVO();
		System.out.println(option_arr[0]);
		for(int i = 0; i < option_arr.length; i++) {
			UserProductVO ex_li = new UserProductVO();
			String[] Num = option_arr[i].split(":");
			ex_li.setProduct_EA(Integer.parseInt(Num[1]));
			String[] param_arr = Num[0].split(",");
			if (param_arr.length == 2) {
				ex_li.setOption2(param_arr[1]);
			}
			ex_li.setOption1(param_arr[0]);
			ex_li.setPost_id(pro);
			option_li.add(ex_li);
		}
		System.out.println("option_li : "+ option_li);
		U_vo.setUser_num((Integer)session.getAttribute("User_Num"));
		userservice.basket_add(option_li, U_vo);
		System.out.println("장바구니 담기 성공!");
		return null;
	}
	//coupon download
	@ResponseBody
	@RequestMapping(value = "/coupon_down.com", method=RequestMethod.POST)
	public String coupon_down(HttpSession session) {
		if(session.getAttribute("User_Num") == null) {
			return "login_false";
		}
		this.coupon.setUser_usernum((Integer)session.getAttribute("User_Num"));
		this.coupon.setUser_couponstatus(true);
		this.coupon.setUser_copostid(pro);
		pro_cls.user_coupon_bln(coupon);
		System.out.println(coupon);
		pro_cls.coupon_insert(coupon);
		return "success";
	}
	
}
