package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.vo.UserVO;

public interface userMyPageService {

	public UserVO mypageinfo(UserVO vo);
	public void user_edit(UserVO vo);
	public void user_urlnone(UserVO vo);
	public void user_stop(UserVO vo);
	
	// 고객 장바구니 상품 수
	public int checkCartSu(UserVO vo);
}
