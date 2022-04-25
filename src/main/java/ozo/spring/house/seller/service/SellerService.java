package ozo.spring.house.seller.service;

import ozo.spring.house.seller.vo.SellerVO;

public interface SellerService {
	public SellerVO checkSeller(SellerVO vo);
	public void insertSeller(SellerVO vo);
}
