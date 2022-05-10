package ozo.spring.house.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.UserProductVO;

@Repository
public class UserMainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserProductVO> mainProductList(UserProductVO vo){
		System.out.println("mybatis in usermaindao mainproductlist");
		return sqlSessionTemplate.selectList("UserMainDAO.mainProductList", vo);
	}

}
