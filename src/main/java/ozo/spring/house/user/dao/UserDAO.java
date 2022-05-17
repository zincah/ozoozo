package ozo.spring.house.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.UserAddressVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserProduct_tableVO;
import ozo.spring.house.user.vo.UserVO;

@Repository("userDAO")
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private String encodePass;
	
	public void insertUser(UserVO vo) {
		System.out.println("[LOGO] : mybatis in userdao insertuser");
		
		encodePass = passwordEncoder.encode(vo.getUser_pw());
		vo.setUser_pw(encodePass);
		sqlSessionTemplate.insert("UserDAO.insertUser", vo);
		
		System.out.println("[LOGO] : insert success");
	}
	
	public UserVO checkUser(UserVO vo) {
		System.out.println("[LOGO] : mybatis in UserDAO checkUser");
		UserVO user = (UserVO) sqlSessionTemplate.selectOne("UserDAO.checkUser", vo);
		if(passwordEncoder.matches(vo.getUser_pw(), user.getUser_pw())) {
			return user;
		}else {
			return null; 
			// 예외처리
		}
	}
	public Boolean Duplicate_Check_Email(UserVO vo) {
		System.out.println("[LOGO] : mybatis in UserDAO Duplicate_Check_Email");
		UserVO user = (UserVO) sqlSessionTemplate.selectOne("UserDAO.Duplicate_Check_Email",vo);
		//System.out.println(user);
		if (user == null) {
			return true;
		}else{
			return false;
		}
	}
	public Boolean Duplicate_Check_Nickname(UserVO vo) {
		System.out.println("[LOGO] : mybatis in UserDAO Duplicate_Check_Nickname");
		UserVO user = (UserVO) sqlSessionTemplate.selectOne("UserDAO.Duplicate_Check_Nickname",vo);
		//System.out.println("select 검색 결과 " + user);
		if (user == null) {
			return true;
		}else{
			return false;
		}
	}
	public void change_pass(UserVO vo) {
		System.out.println("[LOGO] : Mybatis in UserDAO change_pass");
		encodePass = passwordEncoder.encode(vo.getUser_pw());
		vo.setUser_pw(encodePass);
		sqlSessionTemplate.update("UserDAO.change_pass", vo);
		System.out.println("비밀번호 변경 성공");
	}
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
			test.add(sqlSessionTemplate.selectOne("UserProduct.product_Get_id",vo.get(i)));
			test.get(i).setEA(vo.get(i).getProduct_EA());
			test.get(i).setCart_user(uvo.getUser_num());
			test.get(i).setCart_payment(test.get(i).getProduct_price()*test.get(i).getEA());
		}
		for(CartVO i : test) {
			System.out.println("테스트 : " + i);
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
		List<UserProductVO> seller_li = new ArrayList<UserProductVO>();
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
			System.out.println("수량 : " + pro_li.size());
			System.out.println(this.pro_li.get(0));
			return pro_li;
		}
		public void set_post_list(CartVO cvo) {
			this.seller_li.add(sqlSessionTemplate.selectOne("UserProduct.get_post", cvo));
		}
		public List<UserProductVO> get_post_list() {
			return seller_li;
		}
		public List<UserAddressVO> address_check(CartVO cvo){
			if(null == sqlSessionTemplate.selectList("UserProduct.address_check", cvo)) {
				return null;
			}else {
				List<UserAddressVO> address_li = sqlSessionTemplate.selectList("UserProduct.address_check", cvo);
				return address_li;
			}
		}
	}
	
}
