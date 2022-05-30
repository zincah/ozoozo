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

import ozo.spring.house.user.dao.U_DAO.cart_Allload;
import ozo.spring.house.user.service.U_Service;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
public class U_CartController {
	@Autowired
	U_Service userservice;
	
	List<UserProductVO> pro_li = new ArrayList<UserProductVO>();
	List<CartVO> cart_li = new ArrayList<CartVO>();
	CartVO cvo = new CartVO();
	cart_Allload cart_class;
	
	
	//장바구니 실행 전 메소드
	@RequestMapping(value = "/cart.com")
	public String user_cart(HttpSession session, Model model) {
		if(session.getAttribute("UserMail")!=null) {
			int userID = (Integer)session.getAttribute("User_Num");
			this.cvo.setCart_user(userID);
			//클래스 선언
			this.cart_class = userservice.get_cart_class(cvo);
			//클래스에서 장바구니, 상품ID 리스트 받아오기
			this.cart_li = cart_class.getCart_li();
			this.pro_li =  cart_class.getPro_li();
			model.addAttribute("cart_li", cart_li);
			model.addAttribute("pro_li", pro_li);
			List<UserProductVO> seller_filter_li = cart_class.getSeller_filter(cvo);
			model.addAttribute("seller_li", seller_filter_li);
			List<UserProductVO> post_filter_li = cart_class.getPost_filter(cvo);
			DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
			for(int i = 0; i < post_filter_li.size(); i++) {
				post_filter_li.get(i).setExStr(decFormat.format(post_filter_li.get(i).getPost_shipfee()));
			}
			model.addAttribute("post_li", post_filter_li);
			return "oZo_MyCart";
		}else {
			return "oZo_LoginPage";	
		}
	}
	
	//장바구니 js에 필요한 List
	@ResponseBody
	@RequestMapping(value = "/pro_first.com", method=RequestMethod.POST)
	public List<UserProductVO> get_pro_li(){
		return pro_li;
	}
	@ResponseBody
	@RequestMapping(value = "/cart_first.com", method=RequestMethod.POST)
	public List<CartVO> get_cart_li(){
		return cart_li;
	}
	
	//장바구니 갯수, 삭제 시 DB 업데이트
	@ResponseBody
	@RequestMapping(value = "/update_cart.com", method=RequestMethod.POST)
	public List<UserProductVO> update_cart(@RequestBody String Str){
		String[] param = Str.replace("\"","").split("/");
		CartVO update_cvo = new CartVO();
		update_cvo.setCart_product(Integer.parseInt(param[0]));
		update_cvo.setCart_quantity(Integer.parseInt(param[1]));
		this.cart_class.update_cart(update_cvo);
		this.cart_class.getCart_li(cvo);
		pro_li.clear();
		pro_li = cart_class.getPro_li();
		return pro_li;
	} 
	
	//장바구니 다 삭제
	@ResponseBody
	@RequestMapping(value = "/delete_cart.com", method=RequestMethod.POST)
	public List<UserProductVO> delete_cart(@RequestBody int num){
		CartVO cvo_2 = new CartVO();
		if(num >= 50000) {
			cvo_2.setCart_post(num);
			this.cart_class.delete_cart_post(cvo_2);
		}else {
			cvo_2.setCart_product(num);
			this.cart_class.delete_cart_pro(cvo_2);
		}
		this.cart_class.getCart_li(cvo);
		pro_li.clear();
		pro_li = cart_class.getPro_li();
		return pro_li;
	}
	
	//장바구니 체크 삭제
	@ResponseBody
	@RequestMapping(value = "/delete_cart_check.com", method=RequestMethod.POST)
	public List<UserProductVO> delete_cart(@RequestBody int[] num){
		CartVO cvo_2 = new CartVO();
		System.out.print(num);
		for(int i = 0; i < num.length; i++) {
			cvo_2.setCart_post(num[i]);
			this.cart_class.delete_cart_post(cvo_2);
		}
		this.cart_class.getCart_li(cvo);
		pro_li.clear();
		pro_li = cart_class.getPro_li();
		return pro_li;
	}
}
