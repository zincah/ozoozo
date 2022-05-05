package ozo.spring.house.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserCategoryVO;

@Repository
public class UserCategoryDAO {
	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	
	
	public List<UserCategoryVO> firstpage(UserCategoryVO vo) {
		
		System.out.println("첫페이징 목록 ");
		return sqlsessiontemplate.selectList("UserCategoryDAO.",vo);
	}

}
