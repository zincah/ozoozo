package ozo.spring.house.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.AdminCouponVO;
import ozo.spring.house.admin.vo.BannerVO;

@Repository
public class BannerDAO {
	
	@Autowired
	private SqlSessionTemplate sessiontemplate;
	
	public List<BannerVO> b_select(BannerVO vo){
		
		return sessiontemplate.selectList("BannerDAO.b_select",vo);
		 
		
	}
	
	public void b_insert(BannerVO vo) {
		System.out.println("���ε� �ߴ� ");
		sessiontemplate.insert("BannerDAO.b_insert", vo);
		
	}
	
	public void b_delete(BannerVO vo){
		System.out.println("mybatis admin banner delete");
		sessiontemplate.delete("BannerDAO.b_delete", vo);
	}
	
	public void b_boolean(BannerVO vo){
		System.out.println("�����߾�");
		sessiontemplate.update("BannerDAO.b_boolean",vo);
		
	}

	public List<BannerVO> b_selectone(BannerVO vo) {
		System.out.println("��ã�Ҿ�");
		return sessiontemplate.selectList("BannerDAO.b_selectone",vo);
		 
	}



	/*
	// admin coupon
	 */
	public List<AdminCouponVO> couponListView(AdminCouponVO vo){
		return sessiontemplate.selectList("BannerDAO.couponListView", vo);
	}

	public void couponInserting(AdminCouponVO vo) {
		System.out.println("mybatis admin coupon insert");
		sessiontemplate.insert("BannerDAO.couponInserting", vo);
	}

	public void couponSearching(AdminCouponVO vo){
		System.out.println("mybatis admin coupon search");
		sessiontemplate.selectList("BannerDAO.couponSearching", vo);
	}

	public AdminCouponVO couponViewData(AdminCouponVO vo){
		System.out.println("mybatis admin coupon viewdata");
		return sessiontemplate.selectOne("BannerDAO.couponViewData", vo);
	}
}
