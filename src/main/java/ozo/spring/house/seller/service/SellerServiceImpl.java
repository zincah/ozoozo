package ozo.spring.house.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.SellerDAO;
import ozo.spring.house.seller.vo.SellerVO;

@Service("sellerService")
public class SellerServiceImpl implements SellerService{
	@Autowired
	SellerDAO sellerDAO;
	
	// set method
	public void setSellerDAO(SellerDAO sellerDAO) {
		this.sellerDAO = sellerDAO;
	}
	
	@Override
	public SellerVO checkSeller(SellerVO vo) {
		return sellerDAO.checkSeller(vo);
	}
	
	@Override
	public void insertSeller(SellerVO vo) {
		sellerDAO.insertSeller(vo);
	}
}
