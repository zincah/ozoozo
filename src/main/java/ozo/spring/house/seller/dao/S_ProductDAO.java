package ozo.spring.house.seller.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductVO;

@Repository("productDAO")
public class S_ProductDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertPostIdAndGet(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> insertPostIdAndGet 	Method");
		sqlSessionTemplate.insert("ProductDAO.insertPostId", vo);
		
		return sqlSessionTemplate.selectOne("ProductDAO.selectPostIdOne", vo);
	}
	
	public void insertProduct(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> insertProduct 	Method");
		sqlSessionTemplate.insert("ProductDAO.insertProduct", vo);
		
		sqlSessionTemplate.insert("ProductDAO.insertOption", vo);
		
		sqlSessionTemplate.insert("ProductDAO.insertProductStatus", vo);
	}
	
	public void updatePost(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> updatePost 	Method");
		sqlSessionTemplate.update("ProductDAO.updatePost", vo);
	}
	
	public void insertDetail(ProductVO vo) {
		vo.setProdetail_postid(sqlSessionTemplate.selectOne("ProductDAO.selectPostIdOne", vo));
		System.err.println("[Log] --- S_Product 	DAO >>>>> insertDetail 	Method");
		sqlSessionTemplate.insert("ProductDAO.insertDetail", vo);
	}
	
	public void insertPhoto(ProductVO vo) {
		vo.setPhoto_postid(sqlSessionTemplate.selectOne("ProductDAO.selectPostIdOne", vo));
		System.err.println("[Log] --- S_Product 	DAO >>>>> insertPhoto 	Method");
		sqlSessionTemplate.insert("ProductDAO.insertPhoto", vo);
	}
	
	public List<ProductVO> selectProduct(int vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> selectProduct 	Method");
		return sqlSessionTemplate.selectList("ProductDAO.selectProduct", vo);
	}
	
	public List<ProductVO> selectProductView(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> selectProductView 	Method");
		return sqlSessionTemplate.selectList("ProductDAO.selectProductView", vo);
	}

	public int selectListCount(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> selectListCount 	Method");
		return sqlSessionTemplate.selectOne("ProductDAO.selectListCount", vo);
	}
	
	public void updateProductStatus(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> updateProductStatus 	Method");
		sqlSessionTemplate.update("ProductDAO.updateProductStatus", vo);
	}
	
	public void updateProductUpdated(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> updateProductUpdated 	Method");
		sqlSessionTemplate.update("ProductDAO.updateProductUpdated", vo);
	}

	public ProductVO selectSelectProduct(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> selectSelectProduct 	Method");
		return sqlSessionTemplate.selectOne("ProductDAO.selectSelectProduct", vo);
	}

	public void deleteSelectProduct(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> deleteSelectProduct 	Method");
		sqlSessionTemplate.update("ProductDAO.deleteSelectProduct", vo);
	}
	
	public List<ProductVO> selectSearchProduct(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> selectSearchProduct 	Method");
		return sqlSessionTemplate.selectList("ProductDAO.selectSearchProduct", vo);
	}
	
	public int selectSearchProductCount(ProductVO vo) {
		System.err.println("[Log] --- S_Product 	DAO >>>>> selectSearchProductCount 	Method");
		return sqlSessionTemplate.selectOne("ProductDAO.selectSearchProductCount", vo);
	}
}
