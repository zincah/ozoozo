package ozo.spring.house.user.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ozo.spring.house.user.dao.UserDAO.cart_Allload;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
public class UserCartController {
	@Autowired
	UserService userservice;
	
	@RequestMapping(value = "/cart.com")
	public String user_cart(HttpSession session, Model model) {
		//if(session.getAttribute("UserMail")!=null) {
			int userID = (Integer)session.getAttribute("User_Num");
			CartVO cvo = new CartVO();
			cvo.setCart_user(userID);
			//클래스 선언
			cart_Allload cart_class = userservice.get_cart_class(cvo);
			//클래스에서 장바구니, 상품ID 리스트 받아오기
			List<CartVO> cart_li = cart_class.getCart_li();
			List<UserProductVO> pro_li =  cart_class.getPro_li();
			model.addAttribute("cart_li", cart_li);
			model.addAttribute("pro_li", pro_li);
			List<UserProductVO> seller_filter_li = cart_class.getSeller_filter(cvo);
			model.addAttribute("seller_li", seller_filter_li);
			List<UserProductVO> post_filter_li = cart_class.getPost_filter(cvo);
			model.addAttribute("post_li", post_filter_li);
			System.out.println(cart_li.size() +" : " + pro_li.size());
			return "ozocart_zinc";
//		}else {
//			return "ozoLogin_zinc";	
//		}
//		
	}
}
