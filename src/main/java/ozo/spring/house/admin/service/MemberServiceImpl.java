package ozo.spring.house.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.admin.dao.A_MemberDAO;
import ozo.spring.house.admin.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	A_MemberDAO memberDAO;

	// set method
	public void setMemberDAO(A_MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public MemberVO checkAdmin(MemberVO vo) {
		return memberDAO.checkAdmin(vo);
	}

	@Override
	public void insertAdmin(MemberVO vo) {
		memberDAO.insertAdmin(vo);
	}

}
