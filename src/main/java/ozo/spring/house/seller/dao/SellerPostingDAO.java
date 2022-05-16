package ozo.spring.house.seller.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductVO;

@Repository("sellerPostingDAO")
public class SellerPostingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProductVO> selectPostingList(ProductVO vo) {
		System.out.println("--> mybatis in sellerPostingDAO PostingList select");
		return sqlSessionTemplate.selectList("SellerPostingDAO.selectPostingList", vo);
	}
	
	public List<ProductVO> selectSearchPosting(ProductVO vo) {
		System.out.println("--> mybatis in sellerPostingDAO searchPosting select");
		return sqlSessionTemplate.selectList("SellerPostingDAO.selectSearchPosting", vo);
	}
	
	public void updatePostingStatus(ProductVO vo) {
		System.out.println("--> mybatis in sellerPostingDAO updateStatus update");
		sqlSessionTemplate.update("SellerPostingDAO.updatePostingStatus", vo);
	}
	
	public ProductVO selectSelectPosting(ProductVO vo) {
		System.out.println("--> mybatis in sellerPostingDAO selectPosting select");
		return sqlSessionTemplate.selectOne("SellerPostingDAO.selectSelectPosting", vo);
	}
	
	public void updatePostingDealApp(ProductVO vo) {
		System.out.println("--> mybatis in sellerPostingDAO postingDealApp update");
		sqlSessionTemplate.update("SellerPostingDAO.updatePostingDealApp", vo);
	}
}
