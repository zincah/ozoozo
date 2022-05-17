package ozo.spring.house.admin.service;

import java.util.List;

import ozo.spring.house.user.vo.UserVO;

public interface AdminUserManageService {
	
	public List<UserVO> selectUser(UserVO vo);
	public void updateUserStatus(UserVO vo);
	public List<UserVO> getUserList(UserVO vo);
	public List<UserVO> floatingPopulation();
}
