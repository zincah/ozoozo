package ozo.spring.house.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.UserDAO;
import ozo.spring.house.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	// set method
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}

}