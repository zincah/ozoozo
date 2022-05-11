package ozo.spring.house.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.CartVO;
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
		List<CartVO> cart_li = sqlSessionTemplate.selectList("UserProduct.basket_info", vo);
		List<UserProductVO> test = new ArrayList<UserProductVO>();
		for(int i = 0; i < vo.size(); i++) {
			sqlSessionTemplate.insert("UserProduct.basket_test", vo.get(i));
		}
		return true;
	}
}
