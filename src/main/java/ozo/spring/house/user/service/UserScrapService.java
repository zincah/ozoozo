package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.vo.ScrapVO;
import ozo.spring.house.user.vo.UserScrapVO;

public interface UserScrapService {

	
	
	public List<ScrapVO> s_scrap(ScrapVO vo);
	public void s_cancle(UserScrapVO vo);
	public void s_insert(UserScrapVO vo);
	public List<UserScrapVO> us_list(UserScrapVO vo);
	
	public List<UserScrapVO> userScrapList(UserScrapVO vo);
}

