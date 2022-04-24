package ozo.spring.house.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberVO checkAdmin(MemberVO vo) {
		System.out.println("--> mybatis in memberdao checkadmin");
		return (MemberVO) sqlSessionTemplate.selectOne("MemberDAO.checkAdmin", vo);
	}
	
	
	
	

}
