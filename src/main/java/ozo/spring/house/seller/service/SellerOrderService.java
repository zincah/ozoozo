package ozo.spring.house.seller.service;

import java.util.List;

import ozo.spring.house.seller.vo.ProductVO;

public interface SellerOrderService {
	public List<ProductVO> selectOrderList(ProductVO vo);
	public List<ProductVO> selectSearchOrder(ProductVO vo);
	public List<ProductVO> selectOrderDetailData(ProductVO vo);
	public ProductVO selectOrderDetailPayment(ProductVO vo);
}
