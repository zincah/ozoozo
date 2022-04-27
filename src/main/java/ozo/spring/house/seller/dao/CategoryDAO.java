package ozo.spring.house.seller.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.CategoryVO;

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
	
	

}