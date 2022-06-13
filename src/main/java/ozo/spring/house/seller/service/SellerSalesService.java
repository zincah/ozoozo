package ozo.spring.house.seller.service;

import java.util.List;

import ozo.spring.house.seller.vo.ProductVO;

public interface SellerSalesService {
	public ProductVO selectSalesList(ProductVO vo);
	public List<ProductVO> selectBarChartTotalList(ProductVO vo);
	public List<ProductVO> selectSalesDetailList(ProductVO vo);
}
