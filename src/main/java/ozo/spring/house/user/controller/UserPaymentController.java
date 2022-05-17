package ozo.spring.house.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.dao.UserDAO.payment_class;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.UserAddressVO;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
public class UserPaymentController {
	@Autowired
	UserService userservice;
	
	List<CartVO> cart_li = new ArrayList<CartVO>();
	List<UserProductVO> pro_li = new ArrayList<UserProductVO>();
	List<UserProductVO> post_li = new ArrayList<UserProductVO>();
	List<UserAddressVO> address_li = new ArrayList<UserAddressVO>();
	payment_class pay_cls;
	
	@RequestMapping(value = "/calculation.com")
	public void user_calculation(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();

		out.println("<script>alert('잘못된 접근 입니다.'); self.close();</script>");

		out.flush();
	}
	@RequestMapping(value = "/cart_payment.com", method=RequestMethod.POST)
	public String load_payment(HttpSession session,Model model, HttpServletRequest request) {
		int userID = (Integer)session.getAttribute("User_Num");
		//String[] param_li = request.getParameter("Product_ID").split("%");
		String[] param_li = {"50003", "50011"};
		List<CartVO> cvo_li = new ArrayList<CartVO>();
		CartVO cvo = new CartVO();
		this.pay_cls = userservice.get_payment_class();
		for(int i = 0; i < param_li.length; i++) {
			cvo.setCart_post(Integer.parseInt(param_li[i]));
			cvo.setCart_user(userID);
			cvo_li.add(cvo);
			pay_cls.set_payment_list(cvo);
			pay_cls.set_post_list(cvo);
		}
		this.post_li = pay_cls.get_post_list();
		this.cart_li = pay_cls.get_payment_list();
		for(int i = 0; i < cart_li.size(); i++) {
			pay_cls.set_product_list(cart_li.get(i));
		}
		this.pro_li = pay_cls.get_product_list();
		model.addAttribute("post_li", post_li);
		model.addAttribute("cart_li", cart_li);
		model.addAttribute("pro_li", pro_li);
		this.address_li = pay_cls.address_check(cvo);
		model.addAttribute("address_li", address_li);
		System.out.println(address_li);
		return "calculation";
	}
	
	@ResponseBody
	@RequestMapping(value = "/pro_js.com", method=RequestMethod.POST)
	public List<UserProductVO> get_pro_li(){
		return pro_li;
	}
	@ResponseBody
	@RequestMapping(value = "/cart_js.com", method=RequestMethod.POST)
	public List<CartVO> get_cart_li(){
		return cart_li;
	}
}
