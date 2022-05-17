package ozo.spring.house.seller.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;


@Repository("categoryDAO")
public class CategoryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CategoryVO> getCategoryList(CategoryVO vo) {
		System.out.println("--> mybatis in categorydao getcategorylist");
		return sqlSessionTemplate.selectList("CategoryDAO.getCategoryList", vo);
	}
	
	public List<CategoryVO> getMidCategoryList(CategoryVO vo) {
		System.out.println("--> mybatis in categorydao getmidcategorylist");
		return sqlSessionTemplate.selectList("CategoryDAO.getMidCategoryList", vo);
	}
	
	public List<CategoryVO> getBotCategoryList(CategoryVO vo) {
		System.out.println("--> mybatis in categorydao getbotcategorylist");
		return sqlSessionTemplate.selectList("CategoryDAO.getBotCategoryList", vo);
	}
	
	public List<List<FilterVO>> getFilterOption(CategoryVO vo) {
		System.out.println("--> mybatis in categorydao getfilteroption");
		int count = 7;
		
		List<List<FilterVO>> wholeList = new ArrayList<List<FilterVO>>();
		List<FilterVO> perList = new ArrayList<FilterVO>();
		
		int su = (vo.getCate_code()*100 + 1);
		
		for(int i=0; i<count; i++) {
			vo.setCheckfid(su);
			perList = sqlSessionTemplate.selectList("CategoryDAO.getFilterOption", vo);
			if(perList.size() != 0) {
				wholeList.add(perList);
			}
			su++;
		}
		
		System.out.println(wholeList.size());
		
		return wholeList;
	}
	
	
	
	

}
