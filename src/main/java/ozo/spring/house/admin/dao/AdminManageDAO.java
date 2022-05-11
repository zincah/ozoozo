package ozo.spring.house.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.admin.vo.MemberVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.user.vo.UserVO;

@Repository
public class AdminManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserVO> selectUser(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao select user");
		return sqlSessionTemplate.selectList("AdminManageDAO.selectUser", vo);
	}
	
	public List<UserVO> getUserList(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao getuselist");
		return sqlSessionTemplate.selectList("AdminManageDAO.getUserList", vo);
	}
	
	public void updateUserStatus(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao update user status");
		sqlSessionTemplate.update("AdminManageDAO.updateUserStatus", vo);
	}
	
	public List<AdminProductVO> selectPosting(Criteria cri) {
		System.out.println("--> mybatis in adminmanagedao selectposting");
		return sqlSessionTemplate.selectList("AdminManageDAO.selectPosting", cri);
	}
	
	public int selectPostCount() {
		System.out.println("--> mybatis in adminmanagedao selectpostCount");
		return sqlSessionTemplate.selectOne("AdminManageDAO.selectPostCount");
	}
	


}
