package ozo.spring.house.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.UserVO;

@Repository
public class UserMyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	
	
	public List<UserVO> User_Info(UserVO vo) {
		
		return sqlsessiontemplate.selectList("UserMyPageDAO.User_Info",vo);
	}
	
	public void user_edit() {
		
	}

	
}
