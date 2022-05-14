package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserProductVO;

public interface UserCategoryService {
	
	public List<List<UserCategoryVO>> selectCategoryList(UserCategoryVO vo);
	public List<UserCategoryVO> printTitle();
	public List<UserProductVO> selectProductByCate(UserCategoryVO vo);
	public List<UserCategoryVO> getCateName(UserCategoryVO vo);
	public List<UserProductVO> getPostList(UserCategoryVO vo);

}
