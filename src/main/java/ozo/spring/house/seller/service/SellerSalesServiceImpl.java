package ozo.spring.house.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.S_SalesDAO;
import ozo.spring.house.seller.vo.ProductVO;

@Service("sellerSalesService")
public class SellerSalesServiceImpl implements SellerSalesService {
	
	@Autowired
	S_SalesDAO sellerSalesDAO;
	
	@Override
	public ProductVO selectSalesList(ProductVO vo) {
		return sellerSalesDAO.selectSalesList(vo);
	}
	
	@Override
	public List<ProductVO> selectBarChartTotalList(ProductVO vo) {
		return sellerSalesDAO.selectBarChartTotalList(vo);
	}

	@Override
	public List<ProductVO> selectSalesDetailList(ProductVO vo) {
		return sellerSalesDAO.selectSalesDetailList(vo);
	}
}
