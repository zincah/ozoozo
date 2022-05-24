package ozo.spring.house.user.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.dao.UserMainDAO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserVO;

@Service("userMainService")
public class UserMainServiceImpl implements UserMainService {
	
	@Autowired
	UserMainDAO userMainDAO;

	@Override
	public List<UserProductVO> mainProductList(UserProductVO vo) {
		return userMainDAO.mainProductList(vo);
	}

	@Override
	public List<UserProductVO> mainDealProductList(UserProductVO vo) {
		return userMainDAO.mainDealProductList(vo);
	}

	@Override
	public List<UserProductVO> plusProductList(UserPagingVO pvo) {
		return userMainDAO.plusProductList(pvo);
	}
	
	@Override
	public int getProductCount() {
		return userMainDAO.getProductCount();
	}

	@Override
	public List<BannerVO> selectBannerList() {
		return userMainDAO.selectBannerList();
	}

	@Override
  	public List<UserProductVO> todayDealList() {
		return userMainDAO.todayDealList();
	}

	@Override
	public List<UserProductVO> shopItemList(UserProductVO vo) {
		return userMainDAO.shopItemList(vo);
	}
  
	@Override
  	public UserVO checkUserByNaver(UserVO vo) {
		return userMainDAO.checkUserByNaver(vo); // ¿Å°Ü¾ßÇÔ
	}

	@Override
	public void lastLoginCheck(UserVO vo) { 
		userMainDAO.lastLoginCheck(vo); // ¿Å°Ü¾ßÇÔ
	}

	@Override
	public List<List<UserCategoryVO>> printCateList(UserProductVO vo) {
		return userMainDAO.printCateList(vo);
	}

	@Override
	public List<UserCategoryVO> printTop(UserProductVO vo) {
		return userMainDAO.printTop(vo);
	}

	@Override
	public SellerVO sellerInfo(UserProductVO vo) {
		return userMainDAO.sellerInfo(vo);
	}
	
	@Override
	public int shopItemListCount(UserProductVO vo) {
		return userMainDAO.shopItemListCount(vo);
	}

	@Override
	public List<UserProductVO> bestlist() {
		return userMainDAO.bestlist();
	}

	@Override
	public List<Map<String, String>> getDealEndTime() {
		return userMainDAO.getDealEndTime();
	}




  

}
