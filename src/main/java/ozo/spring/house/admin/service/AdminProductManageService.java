package ozo.spring.house.admin.service;

import java.util.List;

import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.common.Criteria;

public interface AdminProductManageService {
	
	public List<AdminProductVO> selectPosting(Criteria cri);
	public int selectPostCount();
	public void updateProductStatus(AdminProductVO pvo);
	public List<AdminProductVO> selectCouponList();
	public void updateCouponStatus(AdminProductVO pvo);
	public void updateDealStatus(AdminProductVO pvo);
	public void deleteDeal(AdminProductVO pvo);
	

}
