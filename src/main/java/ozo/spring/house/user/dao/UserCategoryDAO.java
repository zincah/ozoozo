package ozo.spring.house.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserProductVO;

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
	
	public List<UserProductVO> selectProductByCate(UserCategoryVO vo){
		System.out.println("--> mybatis select product by catecode");
		return sqlSessionTemplate.selectList("UserCategoryDAO.selectProductByCate", vo);
	}
	
	public List<UserCategoryVO> getCateName(UserCategoryVO vo){
		return sqlSessionTemplate.selectList("UserCategoryDAO.getCateName", vo);
	}
	
	public List<UserProductVO> getPostList(UserCategoryVO vo){
		System.out.println("--> mybatis getpostlist");
		List<UserCategoryVO> list = sqlSessionTemplate.selectList("UserCategoryDAO.getPostList", vo);
		List<Integer> postids = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++) {
			UserCategoryVO postid = list.get(i);
			int post = postid.getDprodetails_postid();
			postids.add(post);
		}
		
		vo.setPost_ids(postids);
		System.out.println("postids : " + postids.size());
		return sqlSessionTemplate.selectList("UserCategoryDAO.selectProductByFilter", vo);
	}
	/*
	public int getCategoryCount(UserCategoryVO vo) {
		return sqlSessionTemplate.selectOne("UserCategoryDAO.getCategoryCount", vo);
	}*/
	
	public List<List<FilterVO>> getFilterOption(UserCategoryVO vo) {
		System.out.println("--> mybatis in userCategorydao getfilteroption");
		
		
		List<List<FilterVO>> list = new ArrayList<List<FilterVO>>();
		List<FilterVO> perList = new ArrayList<FilterVO>();
		
		int su = (vo.getTop_catecode()*100);
		
		int total = 8;
		
		for(int i=0; i<total; i++) {
			vo.setChecksub(su);
			System.out.println(vo.getChecksub());
			perList = sqlSessionTemplate.selectList("UserCategoryDAO.getFilterOption", vo);
			if(perList.size() != 0) {
				list.add(perList);
			}
			su++;
		}

		return list;
	}
	

	
	
	


	



}
