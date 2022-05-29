package ozo.spring.house.admin.service;

import java.util.List;
import java.util.Map;

import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

public interface AdminUserManageService {
	
	/* 회원 관리 */
	public List<UserVO> selectUser(UserVO vo);
	public void updateUserStatus(UserVO vo);
	public List<UserVO> getUserList(UserVO vo);
	
	/* 첫 페이지 (왜 여깃뉴) */
	public int noticeCount();
	public int sellerCount();
	public List<UserVO> floatingPopulation();
	public List<Map<String, Integer>> bestProductOfIndex();
	
	/* 업체 관리 */
	public List<SellerVO> selectSellerList(SellerVO vo);
	public SellerVO getSellerInfo(SellerVO vo);
	public void sellerStatusUpdate(SellerVO vo);
	public int getUserListCount(UserVO vo);
	
	
}

