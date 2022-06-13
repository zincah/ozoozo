package ozo.spring.house.seller.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductVO;

@Repository("sellerPostingDAO")
public class S_PostingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProductVO> selectPostingList(ProductVO vo) {
		System.err.println("[Log] --- S_Posting 	DAO >>>>> selectPostingList 	Method");
		return sqlSessionTemplate.selectList("SellerPostingDAO.selectPostingList", vo);
	}
	
	public List<ProductVO> selectSearchPosting(ProductVO vo) {
		System.err.println("[Log] --- S_Posting 	DAO >>>>> selectSearchPosting 	Method");
		return sqlSessionTemplate.selectList("SellerPostingDAO.selectSearchPosting", vo);
	}
	
	public void updatePostingStatus(ProductVO vo) {
		System.err.println("[Log] --- S_Posting 	DAO >>>>> updatePostingStatus 	Method");
		sqlSessionTemplate.update("SellerPostingDAO.updatePostingStatus", vo);
	}
	
	public ProductVO selectSelectPosting(ProductVO vo) {
		System.err.println("[Log] --- S_Posting 	DAO >>>>> selectSelectPosting 	Method");
		return sqlSessionTemplate.selectOne("SellerPostingDAO.selectSelectPosting", vo);
	}
	
	public void insertPostingDealApp(ProductVO vo) {
		System.err.println("[Log] --- S_Posting 	DAO >>>>> insertPostingDealApp 	Method");
		sqlSessionTemplate.insert("SellerPostingDAO.insertPostingDealApp", vo);
	}

	public int selectDealId(ProductVO vo) {
		System.err.println("[Log] --- S_Posting 	DAO >>>>> selectDealId 	Method");
		return sqlSessionTemplate.selectOne("SellerPostingDAO.selectDealId", vo);
	}
	
	public void updateDealId(ProductVO vo) {
		System.err.println("[Log] --- S_Posting 	DAO >>>>> updateDealId 	Method");
		sqlSessionTemplate.update("SellerPostingDAO.updateDealId", vo);
	}
}
