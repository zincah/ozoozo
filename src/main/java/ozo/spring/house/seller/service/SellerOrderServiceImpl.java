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
}
