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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import ozo.spring.house.user.dao.U_DAO.payment_class;
import ozo.spring.house.user.service.U_Service;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.CouponVO;
import ozo.spring.house.user.vo.ImportVO;
import ozo.spring.house.user.vo.UserAddressVO;
import ozo.spring.house.user.vo.UserProductVO;

@Controller
public class U_PaymentController {
	@Autowired
	U_Service userservice;
	
	List<CartVO> cart_li = new ArrayList<CartVO>();
	List<UserProductVO> pro_li = new ArrayList<UserProductVO>();
	List<UserProductVO> post_li = new ArrayList<UserProductVO>();
	List<UserAddressVO> address_li = new ArrayList<UserAddressVO>();
	UserAddressVO choice_addr = new UserAddressVO();
	payment_class pay_cls;
	Integer userID;
	CartVO cvo = new CartVO();
	List<CouponVO> coupon_li = new ArrayList<CouponVO>();
	
	//주소값으로 입력시 오류 메세지
	@RequestMapping(value = "/calculation.com")
	public void user_calculation(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.err.println("[Log] --- Payment Controller >>>>> user_calculation Method");
		PrintWriter out = response.getWriter();

		out.println("<script>alert('잘못된 접근 입니다.'); self.close();</script>");

		out.flush();
	}
	
	//결제창 띄우기전 메소드
	@RequestMapping(value = {"/cart_payment.com","/ProductPage.com"}, method=RequestMethod.POST)
	public String load_payment(HttpSession session,Model model, HttpServletRequest request) {
		System.err.println("[Log] --- Payment Controller >>>>> load_payment Method");
		userID = (Integer)session.getAttribute("User_Num");
		if(request.getParameter("cart_param") != null) {
			model.addAttribute("cart_bln", false);
		}else {
			model.addAttribute("cart_bln", true);
		}
		if(request.getParameter("Product_ID") == null) {
			//System.out.println(request.getParameter("Product_ID"));
			return null;
		}
		System.out.println(request.getParameter("Product_ID"));
		String[] param_li = request.getParameter("Product_ID").split("%");
		//String[] param_li = {"50003", "50011"};
		List<CartVO> cvo_li = new ArrayList<CartVO>();
		this.pay_cls = userservice.get_payment_class();
		for(int i = 0; i < param_li.length; i++) {
			this.cvo.setCart_post(Integer.parseInt(param_li[i]));
			this.cvo.setCart_user(userID);
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
		return "oZo_PaymentPage";
	}
	
	//결제 창에 필요한 js에 쓰일 List
	@ResponseBody
	@RequestMapping(value = "/pro_js.com", method=RequestMethod.POST)
	public List<UserProductVO> get_pro_li(){
		System.err.println("[Log] --- Payment Controller >>>>> get_pro_li Method");
		return pro_li;
	}
	@ResponseBody
	@RequestMapping(value = "/cart_js.com", method=RequestMethod.POST)
	public List<CartVO> get_cart_li(){
		System.err.println("[Log] --- Payment Controller >>>>> get_cart_li Method");
		return cart_li;
	}
	
	//결제 후 DB 처리
	@ResponseBody
	@RequestMapping(value = "/payment/ajax.com", method=RequestMethod.POST)
	public String payment_json(@RequestBody HashMap<String,Object> ivo ) {
		System.err.println("[Log] --- Payment Controller >>>>> payment_json Method");
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
			int final_price = price - point; //할인된만큼 뺴기
			add_vo.setPayment(final_price);
			add_vo.setProduct_id(cart_li.get(i).getCart_product()); 	
			add_vo.setUID(cart_li.get(i).getCart_user());
			add_vo.setQuantity(pro_li.get(i).getCart_quantity());
			int shipfee = pro_li.get(i).getProduct_shipfee() * pro_li.get(i).getCart_quantity();
			add_vo.setShipping_fee(shipfee);
			add_vo.setOrder_status("결제완료");
			add_vo.setPost_id(cart_li.get(i).getCart_post());
			this.choice_addr = pay_cls.get_addr_true(cvo);
			add_vo.setAddress_id(this.choice_addr.getAddress_id());
			//add_vo.setRefund_id(0);
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
		int m_point = (Integer)ivo.get("point_num");
		int p_point = (int)(paid_amount * 0.003);
		ImportVO exvo = new ImportVO();
		exvo.setUID(userID);
		exvo.setEmpty_int(m_point);
		exvo.setEmpty_int2(p_point);
		pay_cls.point_update(exvo);
		return "success";
	}
	
	//결제후 DB 삭제
	@ResponseBody
	@RequestMapping(value = "/cart_delete.com", method=RequestMethod.POST)
	public boolean cart_delete() {
		System.err.println("[Log] --- Payment Controller >>>>> cart_delete Method");
		pay_cls.cart_del(cart_li);
		return true;
	}
	
	//결제전 주소 DB 추가
	@ResponseBody
	@RequestMapping(value = "/addr_insert.com", method=RequestMethod.POST)
	public String addr_insert(@RequestBody String[] addr_li) {
		System.err.println("[Log] --- Payment Controller >>>>> addr_insert Method");
		UserAddressVO uavo = new UserAddressVO();
		uavo.setAddress_name(addr_li[0]);
		uavo.setReceiver(addr_li[1]);
		uavo.setAddress1("[" + addr_li[2] + "] " + addr_li[3] );
		uavo.setAddress2(addr_li[4]);
		uavo.setUser_num(this.userID);
		uavo.setAddr_default(true);
		uavo.setPhone_num(addr_li[5]);
		pay_cls.addr_insert(uavo);
		this.choice_addr = pay_cls.get_addr_true(cvo);
		return "success";
	}
	
	//주소추가 form
	@ResponseBody
	@RequestMapping(value = "/addr_add_insert.com", method=RequestMethod.POST)
	public String addr_add_insert(@RequestBody HashMap<String,String> db_param) {
		System.err.println("[Log] --- Payment Controller >>>>> addr_add_insert Method");
		UserAddressVO uvo = new UserAddressVO();
		uvo.setAddress_name(db_param.get("addr_name"));
		uvo.setReceiver(db_param.get("name"));
		uvo.setPhone_num(db_param.get("phone"));
		uvo.setAddress1(db_param.get("addr1"));
		uvo.setAddress2(db_param.get("addr2"));
		uvo.setUser_num(this.userID);
		if(db_param.get("bln") == "true") {
			uvo.setAddr_default(true);
			pay_cls.addr_default_change(uvo);
		}else {
			uvo.setAddr_default(false);
		}
		System.out.println(db_param);
		
		if(db_param.get("index").equals("0")) {
			pay_cls.addr_insert(uvo);
		}else {
			uvo.setAddress_id(Integer.parseInt(db_param.get("index")));
			pay_cls.addr_update(uvo);
		}
		return "1";
	}
	
	//주소 DB 삭제
	@ResponseBody
	@RequestMapping(value = "/addr_delete.com", method=RequestMethod.POST)
	public String addr_delete(@RequestBody int addr_id) {
		System.err.println("[Log] --- Payment Controller >>>>> addr_delete Method");
		pay_cls.addr_delete(addr_id);
		return "success";
	}
	
	//주소 DB 업데이트
	@ResponseBody
	@RequestMapping(value = "/addr_change.com", method=RequestMethod.POST)
	public String addr_change(@RequestBody int addr_id) throws JsonProcessingException {
		System.err.println("[Log] --- Payment Controller >>>>> addr_change Method");
		this.choice_addr = pay_cls.get_address(addr_id);
		String jsonmap = new ObjectMapper().writeValueAsString(this.choice_addr);
		return jsonmap;
	}
}
