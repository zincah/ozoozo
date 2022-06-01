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
	/* index, 회원관리, 상품관리, 업체관리, 매출관리, 상품게시글 한개*/
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* index page */
	public int registrationWait() { // 상품 등록 대기
		System.err.println("[Log] --- Admin 	Controller >>>>> registrationWait 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.registrationWait");
	}

	public int registrationHold() { // 상품 등록 보류
		System.err.println("[Log] --- Admin 	Controller >>>>> registrationHold 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.registrationHold");
	}
	
	public int noticeCount() { // index : 공지사항 개수
		System.err.println("[Log] --- Admin 	Controller >>>>> noticeCount 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.noticeCount");
	}
	
	public int sellerCount() { // index : 판매점 개수
		System.err.println("[Log] --- Admin 	Controller >>>>> sellerCount 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.sellerCount");
	}
	
	public List<UserVO> floatingPopulation() { // index : 유동인구 line 그래프
		System.err.println("[Log] --- Admin 	Controller >>>>> floatingPopulation 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.floatingPopulation");
	}
	
	public List<Map<String, Integer>> bestProductOfIndex() { // best 상품 bar 그래프
		System.err.println("[Log] --- Admin 	Controller >>>>> bestProductOfIndex 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.bestProductOfIndex");
	}
	
	public int userCount() {
		System.err.println("[Log] --- Admin 	Controller >>>>> userCount 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.userCount");
	}
	/**/
	
	/* 회원관리 */
	/*
	public List<UserVO> selectUser(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao select user");
		return sqlSessionTemplate.selectList("AdminManageDAO.selectUser", vo);
	}*/
	
	/* 회원관리 : get 회원 리스트 */
	public List<UserVO> getUserList(UserVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> getUserList 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.getUserList", vo);
	}
	
	/* 회원관리 : 회원 상태 변경 */
	public void updateUserStatus(UserVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> updateUserStatus 	Method");
		sqlSessionTemplate.update("AdminManageDAO.updateUserStatus", vo);
	}
	
	/* 회원관리 : 페이징 제외 회원 수 반환 */
	public int getUserListCount(UserVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> getUserListCount 	Method");
		List<UserVO> list = sqlSessionTemplate.selectList("AdminManageDAO.getUserListCount", vo);
		return list.size();
	}
	/**/

	/* 상품 관리 */
	public void updateProductStatus(AdminProductVO pvo) { // 상품 상태 변경
		System.err.println("[Log] --- Admin 	Controller >>>>> updateProductStatus 	Method");
		sqlSessionTemplate.update("AdminManageDAO.updateProductStatus1", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateProductStatus2", pvo);
	}
	
	public List<AdminProductVO> selectCouponList(){ // 쿠폰 리스트 반환
		System.err.println("[Log] --- Admin 	Controller >>>>> selectCouponList 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.selectCouponList");
	}
	
	public void updateCouponStatus(AdminProductVO pvo) { // 상품 쿠폰 상태 change
		System.err.println("[Log] --- Admin 	Controller >>>>> updateCouponStatus 	Method");
		sqlSessionTemplate.update("AdminManageDAO.updateCouponStatus", pvo);
	}
	
	public void updateDealStatus(AdminProductVO pvo) { // 상품 오늘의딜 상태 change
		System.err.println("[Log] --- Admin 	Controller >>>>> updateDealStatus 	Method");
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatus", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatusOnPost", pvo);
		
		/*
		ProductDetailVO vo = new ProductDetailVO();
		vo.setDetail_name("오늘의딜"); // 'todaydeal'
		vo.setDetail_value(10001);
		vo.setDtop_catecode(1); // 이건 따로 넣어줘야함 vo부터 바꾸기
		vo.setDprodetails_postid(pvo.getPost_id());
		sqlSessionTemplate.insert("ProductDetailDAO.insertDetails", vo); */
	}
	
	public void deleteDeal(AdminProductVO pvo) {  // 오늘의딜 상태 중지, post table에서 dealstatus -> false
		System.err.println("[Log] --- Admin 	Controller >>>>> deleteDeal 	Method");
		sqlSessionTemplate.delete("AdminManageDAO.deleteDeal", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatusOnPost", pvo);
	}
	
	public List<AdminProductVO> getProductList(AdminProductVO pvo){ // 판매 게시글 리스트
		System.err.println("[Log] --- Admin 	Controller >>>>> getProductList 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.getProductList", pvo);
	}
	
	public int searchListCount(AdminProductVO pvo){ // 판매 게시글 검색된 총 개수 (not paging)
		System.err.println("[Log] --- Admin 	Controller >>>>> searchListCount 	Method");
		//System.out.println("searchlistcount : " + pvo);
		//System.out.println("total : " + sqlSessionTemplate.selectOne("AdminManageDAO.searchListCount", pvo));
		return sqlSessionTemplate.selectOne("AdminManageDAO.searchListCount", pvo);
	}
	/**/

	/* 업체관리 : 업체 리스트 */
	public List<SellerVO> selectSellerList(SellerVO vo){
		System.err.println("[Log] --- Admin 	Controller >>>>> selectSellerList 	Method");
		List<SellerVO> sellerList = sqlSessionTemplate.selectList("AdminManageDAO.selectSellerList", vo);
		
		for(int i=0; i<sellerList.size(); i++) { // 업체 별점 계산
			SellerVO seller = sellerList.get(i);
			double star = seller.getBrandstar();
			seller.setBrandstar(Math.round(star*10)/10.0);
		}
		
		return sellerList;
	}
	
	/* 업체관리 : 요청 받은 업체 정보 */
	public SellerVO getSellerInfo(SellerVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> getSellerInfo 	Method");
		return sqlSessionTemplate.selectOne("AdminManageDAO.getSellerInfo", vo);
	}
	
	/* 업체관리 : 업체 상태 변경 */
	public void sellerStatusUpdate(SellerVO vo) {
		System.err.println("[Log] --- Admin 	Controller >>>>> sellerStatusUpdate 	Method");
		sqlSessionTemplate.update("AdminManageDAO.sellerStatusUpdate", vo);
	}
	
	/* 매출 관리 */
	public List<AdminProductVO> todayDealSale(AdminProductVO vo){ // 오늘의 딜 매출
		System.err.println("[Log] --- Admin 	Controller >>>>> todayDealSale 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.todayDealSale", vo);
	}
	
	public List<AdminProductVO> sellerSale(AdminProductVO vo){ // 판매자별 매출
		System.err.println("[Log] --- Admin 	Controller >>>>> sellerSale 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.sellerSale", vo);
	}
	
	public List<AdminProductVO> bestSale(AdminProductVO vo){ // best 매출
		System.err.println("[Log] --- Admin 	Controller >>>>> bestSale 	Method");
		return sqlSessionTemplate.selectList("AdminManageDAO.bestSale", vo);
	}
	
	public int bestSaleCount(AdminProductVO vo) { // best 개수
		System.err.println("[Log] --- Admin 	Controller >>>>> bestSaleCount 	Method");
		List<AdminProductVO> list = sqlSessionTemplate.selectList("AdminManageDAO.bestSaleCount", vo);
		return list.size();
	}
	
	public List<List<Map<String,String>>> dailyStoreSales(AdminProductVO vo){ // 일별 매출
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
		
		PostingInfoVO vo = new PostingInfoVO(); // posting 관련 정보 세팅 vo

		vo.setProductlist(sqlSessionTemplate.selectList("AdminManageDAO.postInfo1", postid));
		vo.setOptionnums(sqlSessionTemplate.selectList("AdminManageDAO.postInfo2", postid));
		vo.setDetail(sqlSessionTemplate.selectOne("AdminManageDAO.postInfo3", postid));
		vo.setPhotolist(sqlSessionTemplate.selectList("AdminManageDAO.postInfo4", postid));
		return vo;
	}
	

}
