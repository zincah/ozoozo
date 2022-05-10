package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.UserMainDAO;
import ozo.spring.house.user.vo.UserProductVO;

@Service("userMainService")
public class UserMainServiceImpl implements UserMainService {
	
	@Autowired
	UserMainDAO userMainDAO;

	@Override
	public List<UserProductVO> mainProductList(UserProductVO vo) {
		return userMainDAO.mainProductList(vo);
	}

}
