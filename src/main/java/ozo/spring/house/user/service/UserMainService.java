package ozo.spring.house.user.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

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
	public List<Map<String, String>> getDealEndTime();
	
	public List<UserProductVO> todayDealList(); // today deal
	public List<UserProductVO> bestlist(); // best
	public List<Map<String, String>> getDealEndTimeAtDealPage(); // deal timer
	
	// brand page
	public List<UserProductVO> shopItemList(UserProductVO vo);
	public SellerVO sellerInfo(UserProductVO vo);
	public List<List<UserCategoryVO>> printCateList(UserProductVO vo);
	public List<UserCategoryVO> printTop(UserProductVO vo);
	public int shopItemListCount(UserProductVO vo);

}
