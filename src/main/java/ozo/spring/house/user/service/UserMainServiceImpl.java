package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.admin.vo.BannerVO;
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
	public List<UserProductVO> shopItemList() {
		return userMainDAO.shopItemList();
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



  

}
