package ozo.spring.house.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.SellerSalesDAO;
import ozo.spring.house.seller.vo.ProductVO;

@Service("sellerSalesService")
public class SellerSalesServiceImpl implements SellerSalesService {
	
	@Autowired
	SellerSalesDAO sellerSalesDAO;
	
	@Override
	public ProductVO selectSalesList(ProductVO vo) {
		return sellerSalesDAO.selectSalesList(vo);
	}
}
