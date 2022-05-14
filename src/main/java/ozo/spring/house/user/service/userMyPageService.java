package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.vo.UserVO;

public interface userMyPageService {

	public List<UserVO> User_Info(UserVO vo);
	public List<UserVO> user_edit(UserVO vo);
	
}
