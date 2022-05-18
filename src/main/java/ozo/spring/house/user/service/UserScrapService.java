package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.vo.UserScrapVO;

public interface UserScrapService {

	

	public List<UserScrapVO> u_scrap(UserScrapVO vo);
	public void u_cancle(UserScrapVO vo);
}
