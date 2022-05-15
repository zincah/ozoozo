package ozo.spring.house.user.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.dao.UserDAO.cart_Allload;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
public class UserCartController {
	@Autowired
	UserService userservice;
	
	List<UserProductVO> pro_li = new ArrayList<UserProductVO>();
	List<CartVO> cart_li = new ArrayList<CartVO>();
	@RequestMapping(value = "/cart.com")
	public String user_cart(HttpSession session, Model model) {
		if(session.getAttribute("UserMail")!=null) {
			int userID = (Integer)session.getAttribute("User_Num");
			CartVO cvo = new CartVO();
			cvo.setCart_user(userID);
			//클래스 선언
			cart_Allload cart_class = userservice.get_cart_class(cvo);
			//클래스에서 장바구니, 상품ID 리스트 받아오기
			this.cart_li = cart_class.getCart_li();
			this.pro_li =  cart_class.getPro_li();
			model.addAttribute("cart_li", cart_li);
			model.addAttribute("pro_li", pro_li);
			List<UserProductVO> seller_filter_li = cart_class.getSeller_filter(cvo);
			model.addAttribute("seller_li", seller_filter_li);
			List<UserProductVO> post_filter_li = cart_class.getPost_filter(cvo);
			model.addAttribute("post_li", post_filter_li);
			return "ozocart_zinc";
		}else {
			return "ozoLogin_zinc";	
		}
	}
	
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
}
