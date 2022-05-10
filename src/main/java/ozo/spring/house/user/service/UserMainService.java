package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.vo.UserProductVO;

public interface UserMainService {
	
	public List<UserProductVO> mainProductList(UserProductVO vo);

}
