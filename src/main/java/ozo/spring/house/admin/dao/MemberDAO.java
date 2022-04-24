package ozo.spring.house.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
//	@Autowired
//	BCryptPasswordEncoder passwordEncoder;
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	public MemberVO checkAdmin(MemberVO vo) {
		System.out.println("--> mybatis in memberdao checkadmin");
		MemberVO member = (MemberVO) sqlSessionTemplate.selectOne("MemberDAO.checkAdmin", vo);
		
		if(passwordEncoder.matches(vo.getAdmin_password(), member.getAdmin_password())) {
			return member;
		}else {
			return null; 
			// 예외처리
		}
	}
	
	public void insertAdmin(MemberVO vo) {
		System.out.println("--> mybatis in memberdao insertadmin");
		sqlSessionTemplate.insert("MemberDAO.insertAdmin", vo);
		//sqlSessionTemplate.commit();
		System.out.println("--> insert success");
	}
	
	
	
	

}
