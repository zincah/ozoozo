package ozo.spring.house.seller.service;

import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

public interface SellerService {
	public SellerVO checkSeller(UserVO vo);
	public UserVO checkSellerUser(UserVO vo);
	public void insertSeller(SellerVO vo);
	public UserVO userDataSeller(int user_id);
}
