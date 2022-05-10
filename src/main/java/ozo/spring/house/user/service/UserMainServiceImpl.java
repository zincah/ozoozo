package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.UserMainDAO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;

@Service("userMainService")
public class UserMainServiceImpl implements UserMainService {
	
	@Autowired
	UserMainDAO userMainDAO;

	@Override
	public List<UserProductVO> mainProductList(UserProductVO vo) {
		return userMainDAO.mainProductList(vo);
	}

	@Override
	public List<UserProductVO> mainDealProductList(UserProductVO vo) {
		return userMainDAO.mainDealProductList(vo);
	}

	@Override
	public List<UserProductVO> plusProductList(UserPagingVO pvo) {
		return userMainDAO.plusProductList(pvo);
	}

}
