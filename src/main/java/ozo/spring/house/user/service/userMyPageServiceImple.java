package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.UserMyPageDAO;
import ozo.spring.house.user.vo.UserVO;

@Service("userMyPageService")
public class userMyPageServiceImple implements userMyPageService {

	@Autowired
	UserMyPageDAO usermypageDAO;
	
	
	
	public void setUsermypageDAO(UserMyPageDAO usermypageDAO) {
		this.usermypageDAO = usermypageDAO;
	}

	@Override
	public List<UserVO> User_Info(UserVO vo) {
		
		return usermypageDAO.User_Info(vo);
	}

	@Override
	public List<UserVO> user_edit(UserVO vo) {
		
		return null;
	}

}
