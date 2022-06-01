package ozo.spring.house.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.admin.dao.A_ManageDAO;
import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.admin.vo.PostingInfoVO;
import ozo.spring.house.common.Criteria;

@Service("adminProductManageService")
public class AdminProductManageServiceImpl implements AdminProductManageService {
	
	@Autowired
	A_ManageDAO adminManageDAO;

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

	@Override
	public List<AdminProductVO> todayDealSale(AdminProductVO vo) {
		return adminManageDAO.todayDealSale(vo);
	}

	@Override
	public List<AdminProductVO> sellerSale(AdminProductVO vo) {
		return adminManageDAO.sellerSale(vo);
	}

	@Override
	public List<AdminProductVO> bestSale(AdminProductVO vo) {
		return adminManageDAO.bestSale(vo);
	}

	@Override
	public int registrationWait() {
		return adminManageDAO.registrationWait();
	}

	@Override
	public int registrationHold() {
		return adminManageDAO.registrationHold();
	}

	@Override
	public PostingInfoVO postInfo(int postid) {
		return adminManageDAO.postInfo(postid);
	}

	@Override
	public int bestSaleCount(AdminProductVO vo) {
		return adminManageDAO.bestSaleCount(vo);
	}

	@Override
	public List<List<Map<String,String>>> dailyStoreSales(AdminProductVO vo) {
		return adminManageDAO.dailyStoreSales(vo);
	}



	
}
