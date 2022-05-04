package ozo.spring.house.seller.service;

import ozo.spring.house.seller.vo.ProductDetailVO;

public interface SellerProductDetailService {
	
	public void insertTables(ProductDetailVO vo);
	public void selectFilter(ProductDetailVO vo);

}
