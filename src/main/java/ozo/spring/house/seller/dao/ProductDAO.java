package ozo.spring.house.seller.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductVO;

@Repository("productDAO")
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertProduct(ProductVO vo) {
		System.out.println("--> mybatis in productDAO product insert");
		sqlSessionTemplate.insert("ProductDAO.insertProduct", vo);
		
		System.out.println("--> mybatis in productDAO get product id");
		sqlSessionTemplate.insert("ProductDAO.insertPostId", vo);
		
		System.out.println("--> mybatis in productDAO option insert");
		sqlSessionTemplate.insert("ProductDAO.insertOption", vo);
	}


}
