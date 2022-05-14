package ozo.spring.house.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.admin.dao.AdminManageDAO;
import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.common.Criteria;

@Service("adminProductManageService")
public class AdminProductManageServiceImpl implements AdminProductManageService {
	
	@Autowired
	AdminManageDAO adminManageDAO;

	@Override
	public List<AdminProductVO> selectPosting(Criteria cri) {
		return adminManageDAO.selectPosting(cri);
	}

	@Override
	public int selectPostCount() {
		return adminManageDAO.selectPostCount();
	}

	@Override
	public void updateProductStatus(AdminProductVO pvo) {
		adminManageDAO.updateProductStatus(pvo);
	}

	@Override
	public List<AdminProductVO> selectCouponList() {
		return adminManageDAO.selectCouponList();
	}

	@Override
	public void updateCouponStatus(AdminProductVO pvo) {
		adminManageDAO.updateCouponStatus(pvo);
	}

	@Override
	public void updateDealStatus(AdminProductVO pvo) {
		adminManageDAO.updateDealStatus(pvo);
	}

	@Override
	public void deleteDeal(AdminProductVO pvo) {
		adminManageDAO.deleteDeal(pvo);
	}

	@Override
	public List<AdminProductVO> getProductList(AdminProductVO pvo) {
		return adminManageDAO.getProductList(pvo);
	}

	@Override
	public int searchListCount(AdminProductVO pvo) {
		return adminManageDAO.searchListCount(pvo);
	}

	
}
