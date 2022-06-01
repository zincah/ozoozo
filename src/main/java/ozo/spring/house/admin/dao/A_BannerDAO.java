package ozo.spring.house.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.AdminCouponVO;
import ozo.spring.house.admin.vo.BannerVO;

@Repository
public class A_BannerDAO {
	
	@Autowired
	private SqlSessionTemplate sessiontemplate;
	
	public List<BannerVO> b_select(BannerVO vo){
		
		return sessiontemplate.selectList("BannerDAO.b_select",vo);
		 
		
	}
	
	public void b_insert(BannerVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> b_insert 	Method");
		sessiontemplate.insert("BannerDAO.b_insert", vo);
		
	}
	
	public void b_delete(BannerVO vo){
		System.err.println("[Log] --- Admin 	Controller >>>>> b_delete 	Method");
		sessiontemplate.delete("BannerDAO.b_delete", vo);
	}
	
	public void b_boolean(BannerVO vo){
		System.err.println("[Log] --- Admin 	Controller >>>>> b_boolean 	Method");
		sessiontemplate.update("BannerDAO.b_boolean",vo);
		
	}

	public List<BannerVO> b_selectone(BannerVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> b_selectone 	Method");
		return sessiontemplate.selectList("BannerDAO.b_selectone",vo);
		 
	}

	
	/*
	// admin coupon
	 */
	public List<AdminCouponVO> couponListView(AdminCouponVO vo){
		System.err.println("[Log] --- Admin 	Controller >>>>> couponListView 	Method");
		return sessiontemplate.selectList("BannerDAO.couponListView", vo);
	}

	public void couponInserting(AdminCouponVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> couponInserting 	Method");
		sessiontemplate.insert("BannerDAO.couponInserting", vo);
	}

	public void couponSearching(AdminCouponVO vo){
		System.err.println("[Log] --- Admin 	Controller >>>>> couponSearching 	Method");
		sessiontemplate.selectList("BannerDAO.couponSearching", vo);
	}

	public AdminCouponVO couponViewData(AdminCouponVO vo){
		System.err.println("[Log] --- Admin 	Controller >>>>> couponViewData 	Method");
		return sessiontemplate.selectOne("BannerDAO.couponViewData", vo);
	}

	public AdminCouponVO couponUpdate(AdminCouponVO vo){
		System.err.println("[Log] --- Admin 	Controller >>>>> couponUpdate 	Method");
		return sessiontemplate.selectOne("BannerDAO.couponUpdate", vo);
	}

	public AdminCouponVO updateCouponStatus(AdminCouponVO vo){
		System.err.println("[Log] --- Admin 	Controller >>>>> updateCouponStatus 	Method");
		return sessiontemplate.selectOne("BannerDAO.updateCouponStatus",vo);
	}
}
