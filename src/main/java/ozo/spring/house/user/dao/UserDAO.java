package ozo.spring.house.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.UserProductVO;
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
	public UserProductVO product_Get(UserProductVO vo) {
		System.out.println("[LOGO] : Mybatis in UserDAO product_Get");
		UserProductVO posting = sqlSessionTemplate.selectOne("UserDAO.product_get");
		return posting;
	}
}
