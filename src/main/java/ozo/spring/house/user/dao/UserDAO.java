package ozo.spring.house.user.dao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ozo.spring.house.admin.vo.MemberVO;
import ozo.spring.house.user.vo.UserVO;

@Repository("userDAO")
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private String encodePass;
	
	public void insertUser(UserVO vo) {
		System.out.println("--> mybatis in userdao insertuser");
		
		encodePass = passwordEncoder.encode(vo.getUser_pw());
		vo.setUser_pw(encodePass);
		sqlSessionTemplate.insert("UserDAO.insertUser", vo);
		
		System.out.println("--> insert success");
	}
	
	public UserVO checkUser(UserVO vo) {
		System.out.println("--> mybatis in UserDAO checkUser");
		UserVO user = (UserVO) sqlSessionTemplate.selectOne("UserDAO.checkUser", vo);
		
		if(passwordEncoder.matches(vo.getUser_pw(), user.getUser_pw())) {
			return user;
		}else {
			return null; 
			// 예외처리
		}
	}
	
	
}
