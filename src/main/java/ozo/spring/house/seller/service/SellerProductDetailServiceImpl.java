package ozo.spring.house.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.ProductDetailDAO;
import ozo.spring.house.seller.vo.ProductDetailVO;

@Service("sellerProductDetailService")
public class SellerProductDetailServiceImpl implements SellerProductDetailService {
	
	@Autowired
	ProductDetailDAO productDetailDAO;

	@Override
	public void insertTables(ProductDetailVO vo) {
		productDetailDAO.insertTables(vo);
	}

	@Override
	public void selectFilter(ProductDetailVO vo) {
		productDetailDAO.selectFilter(vo);
	}

	@Override
	public void insertDetails(ProductDetailVO vo) {
		productDetailDAO.insertDetails(vo);
	}

}
