package ozo.spring.house.admin.service;

import java.util.List;
import java.util.Map;

import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.admin.vo.PostingInfoVO;
import ozo.spring.house.common.Criteria;

public interface AdminProductManageService {
	
	// ��ǰ ���� 
	public void updateProductStatus(AdminProductVO pvo);
	public List<AdminProductVO> selectCouponList();
	public void updateCouponStatus(AdminProductVO pvo);
	public void updateDealStatus(AdminProductVO pvo);
	public void deleteDeal(AdminProductVO pvo);
	public List<AdminProductVO> getProductList(AdminProductVO pvo);
	public int searchListCount(AdminProductVO pvo);
	
	// ���� ����
	public List<AdminProductVO> todayDealSale(AdminProductVO vo);
	public List<AdminProductVO> sellerSale(AdminProductVO vo);
	public List<AdminProductVO> bestSale(AdminProductVO vo);
	public int bestSaleCount(AdminProductVO vo);
	public List<Map<String, String>> dailyStoreSales(AdminProductVO vo);
	
	// index
	public int registrationWait();
	public int registrationHold();
	
	// posting ����
	public PostingInfoVO postInfo(int postid);

}
