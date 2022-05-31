package ozo.spring.house.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.S_DAO;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@Service("sellerService")
public class SellerServiceImpl implements SellerService{
	@Autowired
	S_DAO sellerDAO;
	
	// set method
	public void setSellerDAO(S_DAO sellerDAO) {
		this.sellerDAO = sellerDAO;
	}
	
	@Override
	public SellerVO checkSeller(UserVO vo) {
		return sellerDAO.checkSeller(vo);
	}
	
	@Override
	public UserVO checkSellerUser(UserVO vo) {
		return sellerDAO.checkSellerUser(vo);
	}
	
	@Override
	public void insertSeller(SellerVO vo) {
		sellerDAO.insertSeller(vo);
	}
	
	@Override
	public UserVO userDataSeller(int user_id) {
		return sellerDAO.userDataSeller(user_id);
	}
}
