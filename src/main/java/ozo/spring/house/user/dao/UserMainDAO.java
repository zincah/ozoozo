package ozo.spring.house.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;

@Repository
public class UserMainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserProductVO> mainProductList(UserProductVO vo){
		System.out.println("mybatis in usermaindao mainproductlist");
		return sqlSessionTemplate.selectList("UserMainDAO.mainProductList", vo);
	}
	
	public List<UserProductVO> mainDealProductList(UserProductVO vo){
		System.out.println("mybatis in usermaindao maindealproductlist");
		return sqlSessionTemplate.selectList("UserMainDAO.mainDealProductList", vo);
	}
	
	public List<UserProductVO> plusProductList(UserPagingVO pvo){
		System.out.println("mybatis in usermaindao maindealproductlist");
		System.out.println(pvo.getThispage());
		return sqlSessionTemplate.selectList("UserMainDAO.plusProductList", pvo);
	}
	
	


}
