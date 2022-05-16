package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.UserCategoryDAO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserProductVO;

@Service("userCategoryService")
public class UserCategoryServiceImpl implements UserCategoryService{
	
	@Autowired
	UserCategoryDAO UserCategoryDAO;
	
	//setter
	public void setUserCategoryDAO(UserCategoryDAO userCategoryDAO) {
		UserCategoryDAO = userCategoryDAO;
	}

	@Override
	public List<UserCategoryVO> m_category(UserCategoryVO vo) {
		return UserCategoryDAO.m_category(vo);
		
	}

	@Override
	public List<UserCategoryVO> s_category(UserCategoryVO vo) {
		return UserCategoryDAO.s_category(vo);
		
	}

	@Override
	public List<UserCategoryVO> b_category(UserCategoryVO vo) {
		return UserCategoryDAO.b_category(vo);
		
	}

}
