package ozo.spring.house.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.SellerOrderDAO;
import ozo.spring.house.seller.vo.ProductVO;

@Service("sellerOrderService")
public class SellerOrderServiceImpl implements SellerOrderService{
	
	@Autowired
	SellerOrderDAO sellerOrderDAO;
	
	@Override
	public List<ProductVO> selectOrderList(ProductVO vo) {
		return sellerOrderDAO.selectOrderList(vo);
	}

	@Override
	public List<ProductVO> selectSearchOrder(ProductVO vo) {
		return sellerOrderDAO.selectSearchOrder(vo);
	}
	
	@Override
	public List<ProductVO> selectOrderDetailData(ProductVO vo) {
		return sellerOrderDAO.selectOrderDetailData(vo);
	}
	
	@Override
	public ProductVO selectOrderDetailPayment(ProductVO vo) {
		return sellerOrderDAO.selectOrderDetailPayment(vo);
	}
	
	@Override
	public ProductVO selectOrderListModal(ProductVO vo) {
		return sellerOrderDAO.selectOrderListModal(vo);
	}
	
	@Override
	public void updateOrderCheck(ProductVO vo) {
		sellerOrderDAO.updateOrderCheck(vo);
	}

	@Override
	public void updateOrderSend(ProductVO vo) {
		sellerOrderDAO.updateOrderSend(vo);
	}
}
