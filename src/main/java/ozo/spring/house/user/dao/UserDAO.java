package ozo.spring.house.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

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
	
	
}
