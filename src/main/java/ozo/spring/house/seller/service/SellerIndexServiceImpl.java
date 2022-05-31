package ozo.spring.house.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.S_IndexDAO;
import ozo.spring.house.seller.vo.ProductVO;

@Service("sellerIndexService")
public class SellerIndexServiceImpl implements SellerIndexService{
	@Autowired
	S_IndexDAO sellerIndexDAO;
	
	@Override
	public ProductVO selectViewData(ProductVO vo) {
		return sellerIndexDAO.selectViewData(vo);
	}
}
