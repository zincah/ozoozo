package ozo.spring.house.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.admin.dao.AdminManageDAO;
import ozo.spring.house.user.vo.UserVO;

@Service("adminUserManageService")
public class AdminUserManageServiceImpl implements AdminUserManageService {
	
	@Autowired
	AdminManageDAO adminManageDAO;

	@Override
	public List<UserVO> selectUser(UserVO vo) {
		return adminManageDAO.selectUser(vo);
	}

	@Override
	public void updateUserStatus(UserVO vo) {
		adminManageDAO.updateUserStatus(vo);
	}
	
	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return adminManageDAO.getUserList(vo);
	}

	@Override
	public List<UserVO> floatingPopulation() {
		return adminManageDAO.floatingPopulation();
	}

}
