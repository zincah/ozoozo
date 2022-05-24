package ozo.spring.house.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ozo.spring.house.user.dao.UserDAO.payment_class;
import ozo.spring.house.user.service.UserService;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.CouponVO;
import ozo.spring.house.user.vo.ImportVO;
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
	UserAddressVO choice_addr = new UserAddressVO();
	payment_class pay_cls;
	Integer userID;
	CartVO cvo = new CartVO();
	List<CouponVO> coupon_li = new ArrayList<CouponVO>();
	
	@RequestMapping(value = "/calculation.com")
	public void user_calculation(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();

		out.println("<script>alert('잘못된 접근 입니다.'); self.close();</script>");

		out.flush();
	}
	@RequestMapping(value = "/cart_payment.com", method=RequestMethod.POST)
	public String load_payment(HttpSession session,Model model, HttpServletRequest request) {
		userID = (Integer)session.getAttribute("User_Num");
		String[] param_li = request.getParameter("Product_ID").split("%");
		//String[] param_li = {"50003", "50011"};
		List<CartVO> cvo_li = new ArrayList<CartVO>();
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
		this.choice_addr = pay_cls.get_addr_true(cvo);
		model.addAttribute("address_true", choice_addr);
		
		if(address_li.size() == 0 ) {
			model.addAttribute("addr_boolean", false);
		}else {
			model.addAttribute("addr_boolean", true);
		}
		//point, coupon
		int point = pay_cls.get_user_point(cvo);
		model.addAttribute("point", point);
		coupon_li = pay_cls.get_coupon_li(cvo);
		// post 값과 쿠폰 포스트 값 검사기
		for(int i = 0; i < coupon_li.size(); i++) {
			boolean remove = true;
			for(int j = 0; j < post_li.size(); j++) {
				if(post_li.get(j).getPost_couponid() == coupon_li.get(i).getUser_couponid()) {
					if(coupon_li.get(i).isUser_couponstatus()) {
						remove = false;
					}
				}
			}
			if(remove) {
				coupon_li.remove(i);
			}
		}
		model.addAttribute("coupon", coupon_li);
		//System.out.println(cvo + "\n");
		//System.out.println(coupon_li + "\n");
		//coupon get text 
		List<CouponVO> coupon_text = pay_cls.get_coupon_text(coupon_li);
		model.addAttribute("coupon_text", coupon_text);
		/*
		 * for(int i = 0; i< cart_li.size(); i++) { System.out.println(cart_li.get(i));
		 * System.out.println(pro_li.get(i)); System.out.println("                  ");
		 * }
		 */
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
	@ResponseBody
	@RequestMapping(value = "/payment/ajax.com", method=RequestMethod.POST)
	public String payment_json(@RequestBody HashMap<String,Object> ivo ) {
		int merchant_uid = (Integer)ivo.get("merchant_uid");
		int paid_amount = (Integer)ivo.get("paid_amount");
		String pay_method = (String)ivo.get("pay_method");
		int time = (Integer)ivo.get("paid_at");
		int point = (Integer)ivo.get("point_num");
		
		//List<ImportVO> payment_li = new ArrayList<ImportVO>();
		for(int i = 0; i < cart_li.size(); i++) {
			ImportVO add_vo = new ImportVO();
			add_vo.setMerchant_uid(merchant_uid);
			add_vo.setPaid_amount(paid_amount + point);
			add_vo.setPay_method(pay_method);
			//add_vo.setPaid_at(time);
			add_vo.setSeller_id(cart_li.get(i).getCart_seller());
			int price = pro_li.get(i).getProduct_price() * pro_li.get(i).getCart_quantity();
			add_vo.setPrice(price);
			int final_price = price; //할인된만큼 뺴기
			add_vo.setFinal_price(final_price);
			add_vo.setProduct_id(cart_li.get(i).getCart_product()); 	
			add_vo.setUID(cart_li.get(i).getCart_user());
			add_vo.setQuantity(pro_li.get(i).getCart_quantity());
			int shipfee = pro_li.get(i).getProduct_shipfee() * pro_li.get(i).getCart_quantity();
			add_vo.setShipfee(shipfee);
			add_vo.setOrder_status("결제완료");
			add_vo.setPost_id(cart_li.get(i).getCart_post());
			this.choice_addr = pay_cls.get_addr_true(cvo);
			add_vo.setAddress_id(choice_addr.getAddress_id());
			if((Integer)ivo.get("coupon_code") != null) {
				int coupon_code = (Integer)ivo.get("coupon_code");
				add_vo.setCoupon_id(coupon_code);
				for(CouponVO k : coupon_li) {
					if(k.getCoupon_id() == coupon_code) {
						add_vo.setDiscount(k.getCoupon_discount());
					}
				}
			}
			add_vo.setEmpty_int(point);
			pay_cls.payment_add(add_vo);
		}
		
		//coupont payment_after
		if(ivo.get("coupon_code") != null) {
			int coupon_code = (Integer)ivo.get("coupon_code");
			pay_cls.update_coupon(coupon_code);
		}
		//point payment_after
		int final_point = (Integer)ivo.get("point_num") - (int)(paid_amount * 0.003);
		ImportVO exvo = new ImportVO();
		exvo.setUID(userID);
		exvo.setEmpty_int(final_point);
		pay_cls.point_update(exvo);
		return "success";
	}
	@ResponseBody
	@RequestMapping(value = "/cart_delete.com", method=RequestMethod.POST)
	public boolean cart_delete() {
		System.out.println("calcul check potin");
		pay_cls.cart_del(cart_li);
		return true;
	}
	@ResponseBody
	@RequestMapping(value = "/addr_insert.com", method=RequestMethod.POST)
	public void addr_insert(@RequestBody String[] addr_li) {
		UserAddressVO uavo = new UserAddressVO();
		for(int i = 0; i < addr_li.length; i++) {
			System.out.println(addr_li[i]);
		}
		uavo.setAddress_name(addr_li[0]);
		uavo.setReceiver(addr_li[1]);
		uavo.setAddress1("[" + addr_li[2] + "] " + addr_li[3] );
		uavo.setAddress2(addr_li[4]);
		uavo.setUser_num(userID);
		uavo.setAddr_default(true);
		System.out.println(uavo.isAddr_default());
		uavo.setPhone_num(addr_li[5]);
		pay_cls.addr_insert(uavo);
		
		this.choice_addr = pay_cls.get_addr_true(cvo);

	}
}
