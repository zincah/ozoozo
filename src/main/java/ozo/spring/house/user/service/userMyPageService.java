package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.vo.UserVO;

public interface userMyPageService {

	public UserVO mypageinfo(UserVO vo);
	public void user_edit(UserVO vo);
	public void user_urlnone(UserVO vo);
	public void user_stop(UserVO vo);
}
