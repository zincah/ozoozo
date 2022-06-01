package ozo.spring.house.admin.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.admin.vo.MemberVO;
import ozo.spring.house.admin.vo.PostingInfoVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.seller.vo.ProductDetailVO;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@Repository
public class A_ManageDAO {
	/* index, ȸ������, ��ǰ����, ��ü����, �������, ��ǰ�Խñ� �Ѱ�*/
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* index page */
	public int registrationWait() { // ��ǰ ��� ���
		System.err.println("[Log] --- Admin 	Controller >>>>> registrationWait 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.registrationWait");
	}

	public int registrationHold() { // ��ǰ ��� ����
		System.err.println("[Log] --- Admin 	Controller >>>>> registrationHold 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.registrationHold");
	}
	
	public int noticeCount() { // index : �������� ����
		System.err.println("[Log] --- Admin 	Controller >>>>> noticeCount 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.noticeCount");
	}
	
	public int sellerCount() { // index : �Ǹ��� ����
		System.err.println("[Log] --- Admin 	Controller >>>>> sellerCount 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.sellerCount");
	}
	
	public List<UserVO> floatingPopulation() { // index : �����α� line �׷���
		System.err.println("[Log] --- Admin 	Controller >>>>> floatingPopulation 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.floatingPopulation");
	}
	
	public List<Map<String, Integer>> bestProductOfIndex() { // best ��ǰ bar �׷���
		System.err.println("[Log] --- Admin 	Controller >>>>> bestProductOfIndex 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.bestProductOfIndex");
	}
	
	public int userCount() {
		System.err.println("[Log] --- Admin 	Controller >>>>> userCount 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.userCount");
	}
	/**/
	
	/* ȸ������ */
	/*
	public List<UserVO> selectUser(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao select user");
		return sqlSessionTemplate.selectList("AdminManageDAO.selectUser", vo);
	}*/
	
	/* ȸ������ : get ȸ�� ����Ʈ */
	public List<UserVO> getUserList(UserVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> getUserList 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.getUserList", vo);
	}
	
	/* ȸ������ : ȸ�� ���� ���� */
	public void updateUserStatus(UserVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> updateUserStatus 	Method");
		sqlSessionTemplate.update("AdminManageDAO.updateUserStatus", vo);
	}
	
	/* ȸ������ : ����¡ ���� ȸ�� �� ��ȯ */
	public int getUserListCount(UserVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> getUserListCount 	Method");
		List<UserVO> list = sqlSessionTemplate.selectList("AdminManageDAO.getUserListCount", vo);
		return list.size();
	}
	/**/

	/* ��ǰ ���� */
	public void updateProductStatus(AdminProductVO pvo) { // ��ǰ ���� ����
		System.err.println("[Log] --- Admin 	Controller >>>>> updateProductStatus 	Method");
		sqlSessionTemplate.update("AdminManageDAO.updateProductStatus1", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateProductStatus2", pvo);
	}
	
	public List<AdminProductVO> selectCouponList(){ // ���� ����Ʈ ��ȯ
		System.err.println("[Log] --- Admin 	Controller >>>>> selectCouponList 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.selectCouponList");
	}
	
	public void updateCouponStatus(AdminProductVO pvo) { // ��ǰ ���� ���� change
		System.err.println("[Log] --- Admin 	Controller >>>>> updateCouponStatus 	Method");
		sqlSessionTemplate.update("AdminManageDAO.updateCouponStatus", pvo);
	}
	
	public void updateDealStatus(AdminProductVO pvo) { // ��ǰ �����ǵ� ���� change
		System.err.println("[Log] --- Admin 	Controller >>>>> updateDealStatus 	Method");
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatus", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatusOnPost", pvo);
		
		/*
		ProductDetailVO vo = new ProductDetailVO();
		vo.setDetail_name("�����ǵ�"); // 'todaydeal'
		vo.setDetail_value(10001);
		vo.setDtop_catecode(1); // �̰� ���� �־������ vo���� �ٲٱ�
		vo.setDprodetails_postid(pvo.getPost_id());
		sqlSessionTemplate.insert("ProductDetailDAO.insertDetails", vo); */
	}
	
	public void deleteDeal(AdminProductVO pvo) {  // �����ǵ� ���� ����, post table���� dealstatus -> false
		System.err.println("[Log] --- Admin 	Controller >>>>> deleteDeal 	Method");
		sqlSessionTemplate.delete("AdminManageDAO.deleteDeal", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatusOnPost", pvo);
	}
	
	public List<AdminProductVO> getProductList(AdminProductVO pvo){ // �Ǹ� �Խñ� ����Ʈ
		System.err.println("[Log] --- Admin 	Controller >>>>> getProductList 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.getProductList", pvo);
	}
	
	public int searchListCount(AdminProductVO pvo){ // �Ǹ� �Խñ� �˻��� �� ���� (not paging)
		System.err.println("[Log] --- Admin 	Controller >>>>> searchListCount 	Method");
		//System.out.println("searchlistcount : " + pvo);
		//System.out.println("total : " + sqlSessionTemplate.selectOne("AdminManageDAO.searchListCount", pvo));
		return sqlSessionTemplate.selectOne("AdminManageDAO.searchListCount", pvo);
	}
	/**/

	/* ��ü���� : ��ü ����Ʈ */
	public List<SellerVO> selectSellerList(SellerVO vo){
		System.err.println("[Log] --- Admin 	Controller >>>>> selectSellerList 	Method");
		List<SellerVO> sellerList = sqlSessionTemplate.selectList("AdminManageDAO.selectSellerList", vo);
		
		for(int i=0; i<sellerList.size(); i++) { // ��ü ���� ���
			SellerVO seller = sellerList.get(i);
			double star = seller.getBrandstar();
			seller.setBrandstar(Math.round(star*10)/10.0);
		}
		
		return sellerList;
	}
	
	/* ��ü���� : ��û ���� ��ü ���� */
	public SellerVO getSellerInfo(SellerVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> getSellerInfo 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.getSellerInfo", vo);
	}
	
	/* ��ü���� : ��ü ���� ���� */
	public void sellerStatusUpdate(SellerVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> sellerStatusUpdate 	Method");
		sqlSessionTemplate.update("AdminManageDAO.sellerStatusUpdate", vo);
	}
	
	/* ���� ���� */
	public List<AdminProductVO> todayDealSale(AdminProductVO vo){ // ������ �� ����
		System.err.println("[Log] --- Admin 	Controller >>>>> todayDealSale 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.todayDealSale", vo);
	}
	
	public List<AdminProductVO> sellerSale(AdminProductVO vo){ // �Ǹ��ں� ����
		System.err.println("[Log] --- Admin 	Controller >>>>> sellerSale 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.sellerSale", vo);
	}
	
	public List<AdminProductVO> bestSale(AdminProductVO vo){ // best ����
		System.err.println("[Log] --- Admin 	Controller >>>>> bestSale 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.bestSale", vo);
	}
	
	public int bestSaleCount(AdminProductVO vo) { // best ����
		System.err.println("[Log] --- Admin 	Controller >>>>> bestSaleCount 	Method");
		List<AdminProductVO> list = sqlSessionTemplate.selectList("AdminManageDAO.bestSaleCount", vo);
		return list.size();
	}
	
	public List<List<Map<String,String>>> dailyStoreSales(AdminProductVO vo){ // �Ϻ� ����
		System.err.println("[Log] --- Admin 	Controller >>>>> dailyStoreSales 	Method");
		List<Integer> slist = sqlSessionTemplate.selectList("AdminManageDAO.sellerListForStoreSales");
		List<List<Map<String,String>>> dailyStoreSalesList = new ArrayList<List<Map<String,String>>>();
		for (int i=0; i<slist.size(); i++) {
			vo.setSeller_id(slist.get(i));
			List<Map<String,String>> list = sqlSessionTemplate.selectList("AdminManageDAO.dailyStoreSales", vo);
			dailyStoreSalesList.add(list);
		}
		return dailyStoreSalesList;
	}
	/**/

	
	/* post information */
	public PostingInfoVO postInfo(int postid){
		System.err.println("[Log] --- Admin 	Controller >>>>> postInfo 	Method");
		
		PostingInfoVO vo = new PostingInfoVO(); // posting ���� ���� ���� vo

		vo.setProductlist(sqlSessionTemplate.selectList("AdminManageDAO.postInfo1", postid));
		vo.setOptionnums(sqlSessionTemplate.selectList("AdminManageDAO.postInfo2", postid));
		vo.setDetail(sqlSessionTemplate.selectOne("AdminManageDAO.postInfo3", postid));
		vo.setPhotolist(sqlSessionTemplate.selectList("AdminManageDAO.postInfo4", postid));
		return vo;
	}
	

}
