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
	@Override
	public UserVO checkUser(UserVO vo) {
		return userDAO.checkUser(vo);
	}

	@Override
	public Boolean Duplicate_Check_Email(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.Duplicate_Check_Email(vo);
	}

	@Override
	public Boolean Duplicate_Check_Nickname(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.Duplicate_Check_Nickname(vo);
	}

	@Override
	public UserVO change_pass(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
