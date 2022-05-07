package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.vo.UserCategoryVO;

public interface UserCategoryService {
	
	public List<UserCategoryVO> m_category(UserCategoryVO vo);
	public List<UserCategoryVO> s_category(UserCategoryVO vo);
	public List<UserCategoryVO> b_category(UserCategoryVO vo);
	
	

}
