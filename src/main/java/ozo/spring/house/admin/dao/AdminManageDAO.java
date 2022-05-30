package ozo.spring.house.admin.dao;

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
public class AdminManageDAO {
	/* index, 회원관리, 상품관리, 업체관리, 매출관리, 상품게시글 한개*/
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* index page */
	public int registrationWait() { // 상품 등록 대기
		System.out.println("--> mybatis in adminmanagedao registration wait count");
		return sqlSessionTemplate.selectOne("AdminManageDAO.registrationWait");
	}

	public int registrationHold() { // 상품 등록 보류
		System.out.println("--> mybatis in adminmanagedao registration hold count");
		return sqlSessionTemplate.selectOne("AdminManageDAO.registrationHold");
	}
	
	public int noticeCount() { // index : 공지사항 개수
		System.out.println("--> mybatis in adminmanagedao noticecount");
		return sqlSessionTemplate.selectOne("AdminManageDAO.noticeCount");
	}
	
	public int sellerCount() { // index : 판매점 개수
		System.out.println("--> mybatis in adminmanagedao sellerCount");
		return sqlSessionTemplate.selectOne("AdminManageDAO.sellerCount");
	}
	
	public List<UserVO> floatingPopulation() { // index : 유동인구 line 그래프
		System.out.println("--> mybatis in adminmanagedao floating");
		return sqlSessionTemplate.selectList("AdminManageDAO.floatingPopulation");
	}
	
	public List<Map<String, Integer>> bestProductOfIndex() { // best 상품 bar 그래프
		System.out.println("--> mybatis in adminmanagedao best product ratio");
		return sqlSessionTemplate.selectList("AdminManageDAO.bestProductOfIndex");
	}
	
	public int userCount() {
		System.out.println("--> mybatis in adminmanagedao userCount");
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
		System.out.println("--> mybatis in adminmanagedao getuserlist");
		return sqlSessionTemplate.selectList("AdminManageDAO.getUserList", vo);
	}
	
	/* 회원관리 : 회원 상태 변경 */
	public void updateUserStatus(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao update user status");
		sqlSessionTemplate.update("AdminManageDAO.updateUserStatus", vo);
	}
	
	/* 회원관리 : 페이징 제외 회원 수 반환 */
	public int getUserListCount(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao update user status");
		List<UserVO> list = sqlSessionTemplate.selectList("AdminManageDAO.getUserListCount", vo);
		return list.size();
	}
	/**/

	/* 상품 관리 */
	public void updateProductStatus(AdminProductVO pvo) { // 상품 상태 변경
		System.out.println("--> mybatis in adminmanagedao updateproductstatus");
		sqlSessionTemplate.update("AdminManageDAO.updateProductStatus1", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateProductStatus2", pvo);
	}
	
	public List<AdminProductVO> selectCouponList(){ // 쿠폰 리스트 반환
		return sqlSessionTemplate.selectList("AdminManageDAO.selectCouponList");
	}
	
	public void updateCouponStatus(AdminProductVO pvo) { // 상품 쿠폰 상태 change
		System.out.println("--> mybatis in adminmanagedao updatecouponstatus");
		sqlSessionTemplate.update("AdminManageDAO.updateCouponStatus", pvo);
	}
	
	public void updateDealStatus(AdminProductVO pvo) { // 상품 오늘의딜 상태 change
		System.out.println("--> mybatis in adminmanagedao updatedealstatus");
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
		System.out.println("--> mybatis in adminmanagedao deletedeal");
		sqlSessionTemplate.delete("AdminManageDAO.deleteDeal", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatusOnPost", pvo);
	}
	
	public List<AdminProductVO> getProductList(AdminProductVO pvo){ // 판매 게시글 리스트
		System.out.println("--> mybatis in adminmanagedao getproductlist");
		return sqlSessionTemplate.selectList("AdminManageDAO.getProductList", pvo);
	}
	
	public int searchListCount(AdminProductVO pvo){ // 판매 게시글 검색된 총 개수 (not paging)
		System.out.println("--> mybatis in adminmanagedao getproductlist");
		//System.out.println("searchlistcount : " + pvo);
		//System.out.println("total : " + sqlSessionTemplate.selectOne("AdminManageDAO.searchListCount", pvo));
		return sqlSessionTemplate.selectOne("AdminManageDAO.searchListCount", pvo);
	}
	/**/

	/* 업체관리 : 업체 리스트 */
	public List<SellerVO> selectSellerList(SellerVO vo){
		System.out.println("--> mybatis in adminmanagedao selectseller");
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
		System.out.println("--> mybatis in adminmanagedao get seller info");
		return sqlSessionTemplate.selectOne("AdminManageDAO.getSellerInfo", vo);
	}
	
	/* 업체관리 : 업체 상태 변경 */
	public void sellerStatusUpdate(SellerVO vo) {
		System.out.println("--> mybatis in adminmanagedao update sellerstatus");
		sqlSessionTemplate.update("AdminManageDAO.sellerStatusUpdate", vo);
	}
	
	/* 매출 관리 */
	public List<AdminProductVO> todayDealSale(AdminProductVO vo){ // 오늘의 딜 매출
		System.out.println("--> mybatis in adminmanagedao get todaydealsale");
		return sqlSessionTemplate.selectList("AdminManageDAO.todayDealSale", vo);
	}
	
	public List<AdminProductVO> sellerSale(AdminProductVO vo){ // 판매자별 매출
		System.out.println("--> mybatis in adminmanagedao get sellerSale");
		return sqlSessionTemplate.selectList("AdminManageDAO.sellerSale", vo);
	}
	
	public List<AdminProductVO> bestSale(AdminProductVO vo){ // best 매출
		System.out.println("--> mybatis in adminmanagedao get bestSale");
		return sqlSessionTemplate.selectList("AdminManageDAO.bestSale", vo);
	}
	
	public int bestSaleCount(AdminProductVO vo) { // best 개수
		System.out.println("--> mybatis in adminmanagedao get bestSale");
		List<AdminProductVO> list = sqlSessionTemplate.selectList("AdminManageDAO.bestSaleCount", vo);
		return list.size();
	}
	
	public List<Map<String, String>> dailyStoreSales(AdminProductVO vo){ // 일별 매출
		System.out.println("--> mybatis in adminmanagedao get daily sales list");
		return sqlSessionTemplate.selectList("AdminManageDAO.dailyStoreSales", vo);
	}
	/**/

	
	/* post information */
	public PostingInfoVO postInfo(int postid){
		System.out.println("--> mybatis in adminmanagedao product detail information : " + postid);
		
		PostingInfoVO vo = new PostingInfoVO(); // posting 관련 정보 세팅 vo

		vo.setProductlist(sqlSessionTemplate.selectList("AdminManageDAO.postInfo1", postid));
		vo.setOptionnums(sqlSessionTemplate.selectList("AdminManageDAO.postInfo2", postid));
		vo.setDetail(sqlSessionTemplate.selectOne("AdminManageDAO.postInfo3", postid));
		vo.setPhotolist(sqlSessionTemplate.selectList("AdminManageDAO.postInfo4", postid));
		return vo;
	}
	

}
