package ozo.spring.house.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserCategoryVO;

@Repository
public class UserCategoryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<List<UserCategoryVO>> selectCategoryList(UserCategoryVO vo) {
		System.out.println("--> mybatis category checkcount");
		int count = sqlSessionTemplate.selectOne("UserCategoryDAO.checkCount", vo);
		
		System.out.println("--> mybatis category selectcatelist");
		
		List<List<UserCategoryVO>> wholeList = new ArrayList<List<UserCategoryVO>>();
		List<UserCategoryVO> perList = new ArrayList<UserCategoryVO>();
		
		int su = vo.getTop_catecode()*100;
		
		for(int i=0; i<count; i++) {
			vo.setChecksub(su);
			perList = sqlSessionTemplate.selectList("UserCategoryDAO.selectCategoryList", vo);
			wholeList.add(perList);
			su++;
		}
		
		return wholeList;
	}
	
	public List<UserCategoryVO> printTitle(){
		return sqlSessionTemplate.selectList("UserCategoryDAO.printTitle");
	}
	


	



}
