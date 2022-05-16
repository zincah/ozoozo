package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.UserMyPageDAO;
import ozo.spring.house.user.vo.UserVO;

@Service("userMyPageService")
public class userMyPageServiceImple implements userMyPageService {

	@Autowired
	UserMyPageDAO UserMyPageDAO;
	
	
	
	public void setUsermypageDAO(UserMyPageDAO usermypageDAO) {
		this.UserMyPageDAO = usermypageDAO;
	}

	@Override
	public UserVO mypageinfo(UserVO vo) {
		
		return UserMyPageDAO.mypageinfo(vo);
	}

	@Override
	public void user_edit(UserVO vo) {
		
		UserMyPageDAO.mypageinfo(vo);
		
		
		
	}

}
