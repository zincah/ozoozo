package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.user.dao.U_CategoryDAO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserProductVO;

@Service("userCategoryService")
public class U_CategoryServiceImpl implements U_CategoryService{
	
	@Autowired
	U_CategoryDAO userCategoryDAO;
	
	//setter
	public void setUserCategoryDAO(U_CategoryDAO userCategoryDAO) {
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
	
	@Override
	public int filterCount(UserCategoryVO vo) {
		return userCategoryDAO.filteringCount(vo);
	}
	
	@Override
	public int getCategoryCount(UserCategoryVO vo) {
		return userCategoryDAO.getCategoryCount(vo);
	}

	@Override
	public List<List<FilterVO>> getFilterOption(UserCategoryVO vo) {
		return userCategoryDAO.getFilterOption(vo);
	}




}
