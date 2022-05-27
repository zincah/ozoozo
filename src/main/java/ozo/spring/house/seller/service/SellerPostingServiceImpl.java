package ozo.spring.house.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.SellerPostingDAO;
import ozo.spring.house.seller.vo.ProductVO;

@Service("sellerPostingService")
public class SellerPostingServiceImpl implements SellerPostingService {
	
	@Autowired
	SellerPostingDAO sellerPostingDAO;
	
	@Override
	public List<ProductVO> selectPostingList(ProductVO vo) {
		return sellerPostingDAO.selectPostingList(vo);
	}
	
	@Override
	public List<ProductVO> selectSearchPosting(ProductVO vo) {
		return sellerPostingDAO.selectSearchPosting(vo);
	}
	
	@Override
	public void updatePostingStatus(ProductVO vo) {
		sellerPostingDAO.updatePostingStatus(vo);
	}
	
	@Override
	public ProductVO selectSelectPosting(ProductVO vo) {
		return sellerPostingDAO.selectSelectPosting(vo);
	}
	
	@Override
	public void insertPostingDealApp(ProductVO vo) {
		sellerPostingDAO.insertPostingDealApp(vo);
	}
	
	@Override
	public ProductVO selectDealId(ProductVO vo) {
		return sellerPostingDAO.selectDealId(vo);
	}
	
	@Override
	public void updateDealId(ProductVO vo) {
		sellerPostingDAO.updateDealId(vo);
	}
}
