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

import ozo.spring.house.user.dao.UserDAO.paymentLog_cls;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
public class UserOrderController {
	@Autowired
	UserService userservice;
	
	List<UserPaymentLogVO> pl_li = new ArrayList<UserPaymentLogVO>();
	List<UserPaymentLogVO> date_filter = new ArrayList<UserPaymentLogVO>();
	List<UserProductVO> wide_li = new ArrayList<UserProductVO>();
	
	paymentLog_cls log_cls;
	@RequestMapping(value = "/myshopping.com")
	public String user_myShopping(HttpSession session, Model model) {
		if(session.getAttribute("UserMail")!=null) {
			this.log_cls = userservice.get_Log_class();
			int userID = (Integer)session.getAttribute("User_Num");
			UserPaymentLogVO upvo = new UserPaymentLogVO();
			upvo.setUser_num(userID);
			log_cls.set_payment_li(upvo);
			
			this.pl_li = log_cls.get_payment_li();
			this.date_filter = log_cls.get_date_filter();
			log_cls.set_wide_li(pl_li);
			this.wide_li = log_cls.get_wide_li();
			model.addAttribute("pl_li", pl_li);
			model.addAttribute("date_filter", date_filter);
			model.addAttribute("wide_li", wide_li);
			System.out.println(date_filter);
			System.out.println();
			System.out.println(pl_li);
			System.out.println();
			System.out.println(wide_li);
			return "my_shopping_status";
		}else {
			return "ozoLogin_zinc";	
		}
	}
	@ResponseBody
	@RequestMapping(value = "/paymentLog_list.com", method=RequestMethod.POST)
	public List<UserPaymentLogVO> get_pl_li(){
		return pl_li;
	}
	@ResponseBody
	@RequestMapping(value = "/wide_list.com", method=RequestMethod.POST)
	public List<UserProductVO> get_wide_li(){
		return wide_li;
	}
	@ResponseBody
	@RequestMapping(value = "/date_filter.com", method=RequestMethod.POST)
	public List<UserPaymentLogVO> get_date_filter(){
		return date_filter;
	}
	@RequestMapping(value = "/orders.com")
	public String user_orders(HttpSession session, Model model) {
		if(session.getAttribute("UserMail")!=null) {
			this.log_cls = userservice.get_Log_class();
			int userID = (Integer)session.getAttribute("User_Num");
			return "orders";
		}else {
			return "ozoLogin_zinc";	
		}
	}
	
}
