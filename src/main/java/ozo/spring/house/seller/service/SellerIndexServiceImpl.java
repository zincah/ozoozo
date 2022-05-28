package ozo.spring.house.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.SellerIndexDAO;
import ozo.spring.house.seller.vo.ProductVO;

@Service("sellerIndexService")
public class SellerIndexServiceImpl implements SellerIndexService{
	@Autowired
	SellerIndexDAO sellerIndexDAO;
	
	@Override
	public ProductVO selectViewData(ProductVO vo) {
		return sellerIndexDAO.selectViewData(vo);
	}
}
