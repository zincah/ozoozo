package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserVO;

public interface UserMainService {
	
	public List<UserProductVO> mainProductList(UserProductVO vo);
	public List<UserProductVO> mainDealProductList(UserProductVO vo);
	public List<UserProductVO> plusProductList(UserPagingVO pvo);
	public List<BannerVO> selectBannerList();
	public int getProductCount();
	
	public UserVO checkUserByNaver(UserVO vo); // ¿Å°Ü¾ßÇÔ
	public void lastLoginCheck(UserVO vo); // ¿Å°Ü¾ßÇÔ
	public List<UserProductVO> todayDealList();
	public List<UserProductVO> bestlist();
	// 
	public List<UserProductVO> shopItemList(UserProductVO vo);
	public SellerVO sellerInfo(UserProductVO vo);
	public List<List<UserCategoryVO>> printCateList(UserProductVO vo);
	public List<UserCategoryVO> printTop(UserProductVO vo);

}
