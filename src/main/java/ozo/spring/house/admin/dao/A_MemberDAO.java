package ozo.spring.house.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.MemberVO;

@Repository("memberDAO")
public class A_MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public MemberVO checkAdmin(MemberVO vo) {
		System.err.println("[Log] --- Member 	Controller >>>>> checkAdmin 	Method");

		try {
			MemberVO member = (MemberVO) sqlSessionTemplate.selectOne("MemberDAO.checkAdmin", vo);
			if(passwordEncoder.matches(vo.getAdmin_password(), member.getAdmin_password())) {
				return member;
			}else {
				return null; 
				// 예외처리
			}
		}catch(Exception e) {
			return null;
		}
	}
	
	public void insertAdmin(MemberVO vo) {
		System.err.println("[Log] --- Member 	Controller >>>>> checkAdmin 	Method");
		sqlSessionTemplate.insert("MemberDAO.insertAdmin", vo);
	}
	
	
	
	

}
