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
	
	public void insertPostingDealApp(ProductVO vo) {
		System.out.println("--> mybatis in sellerPostingDAO postingDealApp insert");
		sqlSessionTemplate.insert("SellerPostingDAO.insertPostingDealApp", vo);
	}

	public int selectDealId(ProductVO vo) {
		System.out.println("--> mybatis in sellerPostingDAO dealId select");
		return sqlSessionTemplate.selectOne("SellerPostingDAO.selectDealId", vo);
	}
	
	public void updateDealId(ProductVO vo) {
		System.out.println("--> mybatis in sellerPostingDAO dealId update");
		sqlSessionTemplate.update("SellerPostingDAO.updateDealId", vo);
	}
}
