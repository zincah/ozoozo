package ozo.spring.house.admin.service;

import java.util.List;

import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

public interface AdminUserManageService {
	
	public List<UserVO> selectUser(UserVO vo);
	public void updateUserStatus(UserVO vo);
	public List<UserVO> getUserList(UserVO vo);
	public List<UserVO> floatingPopulation();
	
	public List<SellerVO> selectSellerList();
	public SellerVO getSellerInfo(SellerVO vo);
	public void sellerStatusUpdate(SellerVO vo);
	public int getUserListCount(UserVO vo);
	
}

