package ozo.spring.house.seller.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductVO;

@Repository("productDAO")
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertPostIdAndGet(ProductVO vo) {
		System.out.println("--> mybatis in productDAO postId insert");
		sqlSessionTemplate.insert("ProductDAO.insertPostId", vo);
		
		System.out.println("--> mybatis in productDAO postId selectone");
		return sqlSessionTemplate.selectOne("ProductDAO.selectPostIdOne", vo);
	}
	
	public void insertProduct(ProductVO vo) {
		System.out.println("--> mybatis in productDAO product insert");
		sqlSessionTemplate.insert("ProductDAO.insertProduct", vo);
		
		System.out.println("--> mybatis in productDAO option insert");
		sqlSessionTemplate.insert("ProductDAO.insertOption", vo);
	}
	
	public void updatePost(ProductVO vo) {
		System.out.println("--> mybatis in productDAO post update");
		sqlSessionTemplate.update("ProductDAO.updatePost", vo);
	}


}
