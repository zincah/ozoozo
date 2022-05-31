package ozo.spring.house.seller.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductDetailVO;
import ozo.spring.house.seller.vo.ProductVO;

@Repository("productDetailDAO")
public class S_ProductDetailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertTables(ProductDetailVO vo) {
		System.out.println("--> mybatis in productDetailDAO tables insert");
		sqlSessionTemplate.insert("ProductDetailDAO.insertTables", vo);
	}
	
	public List<ProductDetailVO> selectFilter(ProductDetailVO vo){
		System.out.println("--> mybatis in productDetailDAO filter select");
		return sqlSessionTemplate.selectList("ProductDetailDAO.selectFilter", vo);
	}
	
	public void insertDetails(ProductDetailVO vo) {
		System.out.println("--> mybatis in productDetailDAO detail insert");
		sqlSessionTemplate.insert("ProductDetailDAO.insertDetails", vo);
	}
	
	
	
}
