package ozo.spring.house.seller.service;

import java.util.List;

import ozo.spring.house.seller.vo.ProductVO;

public interface SellerPostingService {
	public List<ProductVO> selectPostingList(ProductVO vo);
	public List<ProductVO> selectSearchPosting(ProductVO vo);
	public void updatePostingStatus(ProductVO vo);
	public ProductVO selectSelectPosting(ProductVO vo);
	public void insertPostingDealApp(ProductVO vo);
	public ProductVO selectDealId(ProductVO vo);
	public void updateDealId(ProductVO vo);
}
