package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.vo.UserCategoryVO;

public interface UserCategoryService {
	
	public List<List<UserCategoryVO>> selectCategoryList(UserCategoryVO vo);
	public List<UserCategoryVO> printTitle();


}
