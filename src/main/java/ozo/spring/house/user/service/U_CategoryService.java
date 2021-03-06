package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.seller.vo.FilterVO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserProductVO;

public interface U_CategoryService {
	
	public List<List<UserCategoryVO>> selectCategoryList(UserCategoryVO vo);
	public List<UserCategoryVO> printTitle();
	public List<UserProductVO> selectProductByCate(UserCategoryVO vo);
	public List<UserCategoryVO> getCateName(UserCategoryVO vo);
	public List<UserProductVO> getPostList(UserCategoryVO vo);
	public int filterCount(UserCategoryVO vo);
	public int getCategoryCount(UserCategoryVO vo);
	public List<List<FilterVO>> getFilterOption(UserCategoryVO vo); 
	
}
