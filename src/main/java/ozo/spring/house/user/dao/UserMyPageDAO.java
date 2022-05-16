package ozo.spring.house.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.UserVO;

@Repository
public class UserMyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	
	
	public UserVO mypageinfo(UserVO vo) {
		System.out.println("왜안되는거니..");
		return sqlsessiontemplate.selectOne("UserMyPageDAO.mypageinfo",vo);
	}
	
	public void user_edit() {
		
		sqlsessiontemplate.update("UserMyPageDAO.user_edit");
	}

	
}
