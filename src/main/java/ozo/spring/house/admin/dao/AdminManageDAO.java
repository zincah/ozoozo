package ozo.spring.house.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.MemberVO;
import ozo.spring.house.user.vo.UserVO;

@Repository
public class AdminManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserVO> selectUser(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao select user");
		return sqlSessionTemplate.selectList("AdminManageDAO.selectUser", vo);
	}
	
	public List<UserVO> selectUserType(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao select user type");
		return sqlSessionTemplate.selectList("AdminManageDAO.selectUserType", vo);
	}
	
	

}
