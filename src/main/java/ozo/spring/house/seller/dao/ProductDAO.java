package ozo.spring.house.seller.dao;


import java.util.List;

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
	
	public void insertDetail(ProductVO vo) {
		vo.setProdetail_postid(sqlSessionTemplate.selectOne("ProductDAO.selectPostIdOne", vo));
		System.out.println("--> mybatis in productDAO detail insert");
		sqlSessionTemplate.insert("ProductDAO.insertDetail", vo);
	}
	
	public void insertPhoto(ProductVO vo) {
		vo.setPhoto_postid(sqlSessionTemplate.selectOne("ProductDAO.selectPostIdOne", vo));
		System.out.println("--> mybatis in productDAO photo insert");
		sqlSessionTemplate.insert("ProductDAO.insertPhoto", vo);
	}
	
	public List<ProductVO> selectProduct(int vo) {
		System.out.println("--> mybatis in productDAO product select");
		return sqlSessionTemplate.selectList("ProductDAO.selectProduct", vo);
	}
	
	public List<ProductVO> selectProductView(int vo) {
		System.out.println("--> mybatis in productDAO productView select");
		return sqlSessionTemplate.selectList("ProductDAO.selectProductView", vo);
	}
	
	public void updateProductStatus(ProductVO vo) {
		System.out.println("--> mybatis in productDAO product status update");
		sqlSessionTemplate.update("ProductDAO.updateProductStatus", vo);
	}
	
	public void updateProductUpdated(ProductVO vo) {
		System.out.println("--> mybatis in productDAO product updated update");
		sqlSessionTemplate.update("ProductDAO.updateProductUpdated", vo);
	}

	public ProductVO selectSelectProduct(ProductVO vo) {
		System.out.println("--> mybatis in productDAO select product select");
		return sqlSessionTemplate.selectOne("ProductDAO.selectSelectProduct", vo);
	}

	public void deleteSelectProduct(ProductVO vo) {
		System.out.println("--> mybatis in productDAO delete product select");
		sqlSessionTemplate.update("ProductDAO.deleteSelectProduct", vo);
	}

}
