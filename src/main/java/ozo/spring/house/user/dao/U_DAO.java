package ozo.spring.house.user.dao;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.CouponVO;
import ozo.spring.house.user.vo.ImportVO;
import ozo.spring.house.user.vo.UserAddressVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserProduct_tableVO;
import ozo.spring.house.user.vo.UserVO;

@Repository("userDAO")
public class U_DAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	public List<UserProductVO> product_Get(UserProductVO vo) {
		System.out.println("[LOGO] : Mybatis in UserDAO product_Get");
		List<UserProductVO> posting = sqlSessionTemplate.selectList("UserProduct.product_get",vo);
		return posting;
	}
	//product_detail
	public List<UserProductVO> product_Get_option(UserProductVO vo){
		System.out.println("[LOGO] : Mybatis in UserDAO product_Get_option2");
		List<UserProductVO> option_list = sqlSessionTemplate.selectList("UserProduct.product_option2_get", vo);
		return option_list;
	}
	public List<UserProductVO> product_Get_img(UserProductVO vo){
		System.out.println("[LOGO] : Mybatis in UserDAO product_Get_img");
		List<UserProductVO> img_list = sqlSessionTemplate.selectList("UserProduct.product_Get_img", vo);
		return img_list;
	}
	public UserProduct_tableVO product_Get_table(UserProduct_tableVO tvo){
		System.out.println("[LOGO] : Mybatis in UserDAO product_Get_table");
		UserProduct_tableVO table_list = sqlSessionTemplate.selectOne("UserProduct.product_Get_table", tvo);
		return table_list;
	}
	public boolean basket_add(List<UserProductVO> vo, UserVO uvo) {
		System.out.println("[LOGO] : Mybatis in UserDAO basket_add");
		List<CartVO> cart_li = sqlSessionTemplate.selectList("UserProduct.basket_info", uvo); // 저장되어 있는 장바구니 체크
		List<CartVO> test = new ArrayList<CartVO>(); // 방금 불러온 장바구니 (ID, EA) 리스트
		
		if(vo.get(0).getOption2() == null) {
			for(UserProductVO i : vo) {
				i.setOption2("");
			}
		}
		for(int i = 0; i < vo.size(); i++) {
			System.out.println("check : " + vo.get(i));
			test.add(sqlSessionTemplate.selectOne("UserProduct.product_Get_id",vo.get(i)));
		}
		System.out.println("test 사이즈 : " + test.size());
		for(int i = 0; i < vo.size(); i++) {
			System.out.println("테스트 : " + test.get(i));
			test.get(i).setCart_post(vo.get(i).getPost_id());
			test.get(i).setEA(vo.get(i).getProduct_EA());
			test.get(i).setCart_user(uvo.getUser_num());
			test.get(i).setCart_payment(test.get(i).getProduct_price()*test.get(i).getEA());
		}
		for(int i = 0 ; i < cart_li.size(); i++) {
			System.out.println("실행 횟수" + i);
			for(int j = 0 ; j < test.size(); j++) {
				if(test.get(j).getProduct_id()== cart_li.get(i).getCart_product()){
					cart_li.get(i).setCart_quantity(cart_li.get(i).getCart_quantity() + test.get(j).getEA());
					cart_li.get(i).setCart_payment(test.get(j).getProduct_price()*cart_li.get(i).getCart_quantity());
					System.out.println(test.get(j));
					sqlSessionTemplate.update("UserProduct.cart_upload",cart_li.get(i));
					test.remove(j);
					break;
				}
			}
		}
		for(CartVO i : test) {
			System.out.println("테스트2 : " + i);
		}
		for(CartVO i : test) {
			sqlSessionTemplate.insert("UserProduct.cart_add", i);
		}
		return true;
	}
	public product_cls get_productDetail_class() {
		return new product_cls();
	}
	public class product_cls{
		public product_cls() {
		}
		
		public CouponVO get_coupon(UserProductVO pvo) {
			return sqlSessionTemplate.selectOne("UserProduct.get_coupon", pvo);
		}
		public boolean user_coupon_bln(CouponVO cvo) {
			CouponVO exvo = sqlSessionTemplate.selectOne("UserProduct.user_coupon", cvo);
			System.out.println("불린 값 : " + exvo != null);
			if(exvo != null) {
				return true;
			}else {
				return false;
			}
		}
		public void coupon_insert(CouponVO cvo) {
			sqlSessionTemplate.insert("UserProduct.coupon_insert", cvo);
			System.out.println("쿠폰 다운 성공");
		}
		
	}
	
	
	// 장바구니 DAO
	public cart_Allload get_cart_class(CartVO cvo) {
		return new cart_Allload(cvo);
	}
	
	public class cart_Allload{
		List<CartVO> cart_li = new ArrayList<CartVO>();
		List<UserProductVO> product_li = new ArrayList<UserProductVO>();
		public cart_Allload() {
		}
		public cart_Allload(CartVO cvo) {
			this.cart_li = sqlSessionTemplate.selectList("UserProduct.cart_Get", cvo);
		}
		public List<CartVO> getCart_li() {
			return cart_li;
		}
		public void getCart_li(CartVO cvo){
			this.cart_li = sqlSessionTemplate.selectList("UserProduct.cart_Get", cvo);
		}
		public List<UserProductVO> getPro_li(){
			for(int i = 0; i < cart_li.size(); i++) {
				this.product_li.addAll(sqlSessionTemplate.selectList("UserProduct.pro_Get", cart_li.get(i)));
			}
			return product_li;
		}
		public List<UserProductVO> getSeller_filter(CartVO cvo){
			List<UserProductVO> seller_li = sqlSessionTemplate.selectList("UserProduct.seller_filter", cvo);
			return seller_li;
		}
		public List<UserProductVO> getPost_filter(CartVO cvo){
			List<UserProductVO> product_list = sqlSessionTemplate.selectList("UserProduct.post_filter_name", cvo);
			return product_list;
		}
		public void update_cart(CartVO cvo) {
			sqlSessionTemplate.update("UserProduct.cart_update", cvo);
		}
		public void delete_cart_post(CartVO cvo) {
			sqlSessionTemplate.delete("UserProduct.cart_delete_post", cvo);
			
		}
		public void delete_cart_pro(CartVO cvo) {
			sqlSessionTemplate.delete("UserProduct.cart_delete_pro", cvo);
		}
	}
	// 결제 페이지
	public payment_class get_payment_class() {
		return new payment_class();
	}
	public class payment_class{
		List<CartVO> cart_li = new ArrayList<CartVO>();
		List<UserProductVO> pro_li = new ArrayList<UserProductVO>();
		List<UserProductVO> post_li = new ArrayList<UserProductVO>();
		List<CouponVO> coupon_li = new ArrayList<CouponVO>();
		public payment_class() {
			
		}
		public void set_payment_list(CartVO cvo) {
			this.cart_li.addAll(sqlSessionTemplate.selectList("UserProduct.payment_cart_get", cvo));
		}
		public List<CartVO> get_payment_list() {
			return cart_li;
		}
		public void set_product_list(CartVO cvo) {
			this.pro_li.add(sqlSessionTemplate.selectOne("UserProduct.payment_pro_get", cvo));
		}
		public List<UserProductVO> get_product_list(){
			//System.out.println("수량 : " + pro_li.size());
			//System.out.println(this.pro_li.get(0));
			return pro_li;
		}
		public void set_post_list(CartVO cvo) {
			this.post_li.add(sqlSessionTemplate.selectOne("UserProduct.get_post", cvo));
		}
		public List<UserProductVO> get_post_list() {
			DecimalFormat decFormat = new DecimalFormat("###,###"); //소수점 함수
			for(int i = 0; i < post_li.size(); i++) {
				try {
				post_li.get(i).setExStr(decFormat.format(post_li.get(i).getPost_shipfee()));
				}catch(NullPointerException np) {
				}
			}	
			return post_li;
		}
		public List<UserAddressVO> address_check(CartVO cvo){
			List<UserAddressVO> address_li= new ArrayList<UserAddressVO>();
			if(null == sqlSessionTemplate.selectList("UserProduct.address_check", cvo)) {
				return null;
			}else {
				address_li = sqlSessionTemplate.selectList("UserProduct.address_check", cvo);
				//System.out.println(address_li);	
				return address_li;
			}
		}
		public void payment_add(ImportVO ivo) {
			sqlSessionTemplate.insert("UserProduct.order_add",ivo);
			int order_id = sqlSessionTemplate.selectOne("UserProduct.order_select", ivo);
			System.out.println("order 값 : "  + order_id);
			ivo.setPy_orderid(order_id);
			sqlSessionTemplate.insert("UserProduct.payment_add",ivo);
			
		}
		public void cart_del(List<CartVO> cvo) {
			for(int i = 0; i < cvo.size(); i++) {
				sqlSessionTemplate.delete("UserProduct.cart_del", cvo.get(i));
			}
		}
		public void addr_insert(UserAddressVO uavo) {
			sqlSessionTemplate.insert("UserProduct.addr_add", uavo);
			System.out.println("주소 insert");
		}
		public UserAddressVO get_addr_true(CartVO cvo) {
			return sqlSessionTemplate.selectOne("UserProduct.address_true", cvo);
		}
		public int get_user_point(CartVO cvo) {
			return sqlSessionTemplate.selectOne("UserProduct.get_user_point", cvo);
		}
		public List<CouponVO> get_coupon_li(CartVO cvo) {
			return sqlSessionTemplate.selectList("UserProduct.get_user_coupon", cvo);
		}
		public void point_update(ImportVO ivo) {
			sqlSessionTemplate.update("UserProduct.user_point_update", ivo);
		}
		public List<CouponVO> get_coupon_text(List<CouponVO> cvo){
			for(int i = 0; i < cvo.size(); i++) {
				coupon_li.add(sqlSessionTemplate.selectOne("UserProduct.get_coupon_text",  cvo.get(i)));
			}
			return coupon_li;
		}
		public void update_coupon(int coupon_id) {
			sqlSessionTemplate.update("UserProduct.coupon_false", coupon_id);
		}
		public void addr_default_change(UserAddressVO avo) {
			System.out.println("check 2");
			sqlSessionTemplate.update("UserProduct.addr_default_change", avo);
		}
		public void addr_delete(int address_id) {
			sqlSessionTemplate.delete("UserProduct.addr_delete" , address_id);
		}
		public UserAddressVO get_address(int address_id) {
			UserAddressVO uvo = sqlSessionTemplate.selectOne("UserProduct.get_addr",address_id);
			return uvo;
		}
		public void addr_update(UserAddressVO uvo) {
			sqlSessionTemplate.update("UserProduct.addr_update", uvo);
		}
		
	}
	// 결제내역
	public paymentLog_cls get_paymentLog_class() {
		return new paymentLog_cls();
	}
	
	public class paymentLog_cls{
		List<UserPaymentLogVO> pl_li = new ArrayList<UserPaymentLogVO>();
		List<UserPaymentLogVO> date_filter = new ArrayList<UserPaymentLogVO>();
		List<UserProductVO> wide_li = new ArrayList<UserProductVO>();
		public paymentLog_cls() {
		}
		public void set_payment_li(UserPaymentLogVO upvo) {
			this.pl_li = sqlSessionTemplate.selectList("UserProduct.get_paymentLogVO", upvo);
			this.date_filter = sqlSessionTemplate.selectList("UserProduct.get_date_filter", upvo);
		}
		public List<UserPaymentLogVO> get_payment_li(){
			return pl_li;
		}
		public List<UserPaymentLogVO> get_date_filter(){
			return date_filter;
		}
		public void set_wide_li(List<UserPaymentLogVO> upvo) {
			for(int i=0; i < upvo.size(); i++) {
				UserProductVO exvo = sqlSessionTemplate.selectOne("UserProduct.get_wide_list", upvo.get(i));
				this.wide_li.add(exvo);
			}
		}
		public List<UserProductVO> get_wide_li(){
			return wide_li;
		}
		public void buy_check_update(String param) {
			int order_id = Integer.parseInt(param);
			sqlSessionTemplate.update("UserProduct.buy_check_update", order_id);
			System.out.println("구매확정 클릭함");
		}
		
		public void refund_DB(int merchant_UID) {
			List<UserPaymentLogVO> pvo = sqlSessionTemplate.selectList("UserProduct.get_refund", merchant_UID);
			for(UserPaymentLogVO i : pvo) {
				i.setOrder_status("환불처리");
				i.setPayment(0 - i.getPayment());
				i.setEmpty_int(0 - i.getOd_point());
				i.setMerchant_UID(merchant_UID);
				i.setQuantity(0 - i.getQuantity());
				sqlSessionTemplate.insert("UserProduct.userorder_refund_add", i);
				UserPaymentLogVO exvo = sqlSessionTemplate.selectOne("UserProduct.get2_refund", i);
				sqlSessionTemplate.update("UserProduct.userorder_refund_update", exvo);
				UserPaymentLogVO payvo = sqlSessionTemplate.selectOne("UserProduct.get_payvo",i);
				payvo.setPy_orderid(exvo.getOrder_id());
				payvo.setPayment_total(0 - payvo.getPayment_total());
				payvo.setPy_final(0 - payvo.getPy_final());
				sqlSessionTemplate.insert("UserProduct.payment_add2", payvo);
			}
			System.out.println("refund method success");
		}
		public List<UserPaymentLogVO> filter(int UID){
			List<UserPaymentLogVO> filter_order = sqlSessionTemplate.selectList("UserProduct.filter_order", UID);
			return filter_order;
		}
	}
}
