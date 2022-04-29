package ozo.spring.house.user.service;

import ozo.spring.house.user.vo.UserVO;

public interface UserService {
	public Boolean Duplicate_Check_Nickname(UserVO vo);
	public Boolean Duplicate_Check_Email(UserVO vo);
	public void insertUser(UserVO vo);
	public UserVO checkUser(UserVO vo);
}
