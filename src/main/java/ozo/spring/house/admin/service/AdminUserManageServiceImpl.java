package ozo.spring.house.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.admin.dao.A_ManageDAO;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@Service("adminUserManageService")
public class AdminUserManageServiceImpl implements AdminUserManageService {
	
	@Autowired
	A_ManageDAO adminManageDAO;

	/*
	@Override
	public List<UserVO> selectUser(UserVO vo) {
		return adminManageDAO.selectUser(vo);
	}*/

	@Override
	public void updateUserStatus(UserVO vo) {
		adminManageDAO.updateUserStatus(vo);
	}
	
	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return adminManageDAO.getUserList(vo);
	}

	@Override
	public List<UserVO> floatingPopulation() {
		return adminManageDAO.floatingPopulation();
	}

	@Override
	public List<SellerVO> selectSellerList(SellerVO vo) {
		return adminManageDAO.selectSellerList(vo);
	}

	@Override
	public SellerVO getSellerInfo(SellerVO vo) {
		return adminManageDAO.getSellerInfo(vo);
	}

	@Override
	public void sellerStatusUpdate(SellerVO vo) {
		adminManageDAO.sellerStatusUpdate(vo);
	}

	@Override
	public int getUserListCount(UserVO vo) {
		return adminManageDAO.getUserListCount(vo);
	}

	@Override
	public List<Map<String, Integer>> bestProductOfIndex() {
		return adminManageDAO.bestProductOfIndex();
	}

	@Override
	public int noticeCount() {
		return adminManageDAO.noticeCount();
	}

	@Override
	public int sellerCount() {
		return adminManageDAO.sellerCount();
	}

	@Override
	public int userCount() {
		return adminManageDAO.userCount();
	}

}
