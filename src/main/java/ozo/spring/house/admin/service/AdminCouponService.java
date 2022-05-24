package ozo.spring.house.admin.service;

import ozo.spring.house.admin.vo.AdminCouponVO;

import java.util.List;

public interface AdminCouponService {

    public List<AdminCouponVO> couponListView(AdminCouponVO vo);
    public void couponSearching(AdminCouponVO vo);
    public void couponInserting(AdminCouponVO vo);
    public void counponViewData(AdminCouponVO vo);

    public AdminCouponVO couponViewData(AdminCouponVO vo);


}
