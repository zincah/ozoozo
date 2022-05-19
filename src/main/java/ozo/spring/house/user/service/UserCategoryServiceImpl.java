package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.user.dao.UserCategoryDAO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserProductVO;

@Service("userCategoryService")
public class UserCategoryServiceImpl implements UserCategoryService{
	
	@Autowired
	UserCategoryDAO userCategoryDAO;
	
	//setter
	public void setUserCategoryDAO(UserCategoryDAO userCategoryDAO) {
		userCategoryDAO = userCategoryDAO;
	}

	@Override
	public List<List<UserCategoryVO>> selectCategoryList(UserCategoryVO vo) {
		return userCategoryDAO.selectCategoryList(vo);
	}

	@Override
	public List<UserCategoryVO> printTitle() {
		return userCategoryDAO.printTitle();
	}

	@Override
	public List<UserProductVO> selectProductByCate(UserCategoryVO vo) {
		return userCategoryDAO.selectProductByCate(vo);
	}
  
  @Override
	public List<UserCategoryVO> getCateName(UserCategoryVO vo) {
		return userCategoryDAO.getCateName(vo);
	}

	@Override
	public List<UserProductVO> getPostList(UserCategoryVO vo) {
		return userCategoryDAO.getPostList(vo);
	}
	/*
	@Override
	public int getCategoryCount(UserCategoryVO vo) {
		return userCategoryDAO.getCategoryCount(vo);
	}*/

	@Override
	public List<List<FilterVO>> getFilterOption(UserCategoryVO vo) {
		return userCategoryDAO.getFilterOption(vo);
	}


}
