package ozo.spring.house.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ozo.spring.house.admin.dao.A_BannerDAO;
import ozo.spring.house.admin.vo.AdminCouponVO;

import java.util.List;

@Service
public class AdminCouponServiceImpl implements AdminCouponService {

    @Autowired
    A_BannerDAO bannerDAO;

    @Override
    public List<AdminCouponVO> couponListView(AdminCouponVO vo){
        return bannerDAO.couponListView(vo);
    }

    @Override
    public void couponSearching(AdminCouponVO vo) {
        bannerDAO.couponSearching(vo);
    }

    @Override
    public void couponInserting(AdminCouponVO vo){
        bannerDAO.couponInserting(vo);
    }

    @Override
    public void counponViewData(AdminCouponVO vo) {
        bannerDAO.couponViewData(vo);
    }


    @Override
    public AdminCouponVO couponViewData(AdminCouponVO vo) {
       return bannerDAO.couponViewData(vo);
    }

    @Override
    public AdminCouponVO couponUpdate(AdminCouponVO vo) {
        return bannerDAO.couponUpdate(vo);
    }

    @Override
    public AdminCouponVO updateCouponStatus(AdminCouponVO vo) {
        return bannerDAO.couponUpdate(vo);
    }

}
