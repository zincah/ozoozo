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
	/* index, ȸ������, ��ǰ����, ��ü����, �������, ��ǰ�Խñ� �Ѱ�*/
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* index page */
	public int registrationWait() { // ��ǰ ��� ���
		System.out.println("--> mybatis in adminmanagedao registration wait count");
		return sqlSessionTemplate.selectOne("AdminManageDAO.registrationWait");
	}

	public int registrationHold() { // ��ǰ ��� ����
		System.out.println("--> mybatis in adminmanagedao registration hold count");
		return sqlSessionTemplate.selectOne("AdminManageDAO.registrationHold");
	}
	
	public int noticeCount() { // index : �������� ����
		System.out.println("--> mybatis in adminmanagedao noticecount");
		return sqlSessionTemplate.selectOne("AdminManageDAO.noticeCount");
	}
	
	public int sellerCount() { // index : �Ǹ��� ����
		System.out.println("--> mybatis in adminmanagedao sellerCount");
		return sqlSessionTemplate.selectOne("AdminManageDAO.sellerCount");
	}
	
	public List<UserVO> floatingPopulation() { // index : �����α� line �׷���
		System.out.println("--> mybatis in adminmanagedao floating");
		return sqlSessionTemplate.selectList("AdminManageDAO.floatingPopulation");
	}
	
	public List<Map<String, Integer>> bestProductOfIndex() { // best ��ǰ bar �׷���
		System.out.println("--> mybatis in adminmanagedao best product ratio");
		return sqlSessionTemplate.selectList("AdminManageDAO.bestProductOfIndex");
	}
	
	public int userCount() {
		System.out.println("--> mybatis in adminmanagedao userCount");
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
		System.out.println("--> mybatis in adminmanagedao getuserlist");
		return sqlSessionTemplate.selectList("AdminManageDAO.getUserList", vo);
	}
	
	/* ȸ������ : ȸ�� ���� ���� */
	public void updateUserStatus(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao update user status");
		sqlSessionTemplate.update("AdminManageDAO.updateUserStatus", vo);
	}
	
	/* ȸ������ : ����¡ ���� ȸ�� �� ��ȯ */
	public int getUserListCount(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao update user status");
		List<UserVO> list = sqlSessionTemplate.selectList("AdminManageDAO.getUserListCount", vo);
		return list.size();
	}
	/**/

	/* ��ǰ ���� */
	public void updateProductStatus(AdminProductVO pvo) { // ��ǰ ���� ����
		System.out.println("--> mybatis in adminmanagedao updateproductstatus");
		sqlSessionTemplate.update("AdminManageDAO.updateProductStatus1", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateProductStatus2", pvo);
	}
	
	public List<AdminProductVO> selectCouponList(){ // ���� ����Ʈ ��ȯ
		return sqlSessionTemplate.selectList("AdminManageDAO.selectCouponList");
	}
	
	public void updateCouponStatus(AdminProductVO pvo) { // ��ǰ ���� ���� change
		System.out.println("--> mybatis in adminmanagedao updatecouponstatus");
		sqlSessionTemplate.update("AdminManageDAO.updateCouponStatus", pvo);
	}
	
	public void updateDealStatus(AdminProductVO pvo) { // ��ǰ �����ǵ� ���� change
		System.out.println("--> mybatis in adminmanagedao updatedealstatus");
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
		System.out.println("--> mybatis in adminmanagedao deletedeal");
		sqlSessionTemplate.delete("AdminManageDAO.deleteDeal", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatusOnPost", pvo);
	}
	
	public List<AdminProductVO> getProductList(AdminProductVO pvo){ // �Ǹ� �Խñ� ����Ʈ
		System.out.println("--> mybatis in adminmanagedao getproductlist");
		return sqlSessionTemplate.selectList("AdminManageDAO.getProductList", pvo);
	}
	
	public int searchListCount(AdminProductVO pvo){ // �Ǹ� �Խñ� �˻��� �� ���� (not paging)
		System.out.println("--> mybatis in adminmanagedao getproductlist");
		//System.out.println("searchlistcount : " + pvo);
		//System.out.println("total : " + sqlSessionTemplate.selectOne("AdminManageDAO.searchListCount", pvo));
		return sqlSessionTemplate.selectOne("AdminManageDAO.searchListCount", pvo);
	}
	/**/

	/* ��ü���� : ��ü ����Ʈ */
	public List<SellerVO> selectSellerList(SellerVO vo){
		System.out.println("--> mybatis in adminmanagedao selectseller");
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
		System.out.println("--> mybatis in adminmanagedao get seller info");
		return sqlSessionTemplate.selectOne("AdminManageDAO.getSellerInfo", vo);
	}
	
	/* ��ü���� : ��ü ���� ���� */
	public void sellerStatusUpdate(SellerVO vo) {
		System.out.println("--> mybatis in adminmanagedao update sellerstatus");
		sqlSessionTemplate.update("AdminManageDAO.sellerStatusUpdate", vo);
	}
	
	/* ���� ���� */
	public List<AdminProductVO> todayDealSale(AdminProductVO vo){ // ������ �� ����
		System.out.println("--> mybatis in adminmanagedao get todaydealsale");
		return sqlSessionTemplate.selectList("AdminManageDAO.todayDealSale", vo);
	}
	
	public List<AdminProductVO> sellerSale(AdminProductVO vo){ // �Ǹ��ں� ����
		System.out.println("--> mybatis in adminmanagedao get sellerSale");
		return sqlSessionTemplate.selectList("AdminManageDAO.sellerSale", vo);
	}
	
	public List<AdminProductVO> bestSale(AdminProductVO vo){ // best ����
		System.out.println("--> mybatis in adminmanagedao get bestSale");
		return sqlSessionTemplate.selectList("AdminManageDAO.bestSale", vo);
	}
	
	public int bestSaleCount(AdminProductVO vo) { // best ����
		System.out.println("--> mybatis in adminmanagedao get bestSale");
		List<AdminProductVO> list = sqlSessionTemplate.selectList("AdminManageDAO.bestSaleCount", vo);
		return list.size();
	}
	
	public List<Map<String, String>> dailyStoreSales(AdminProductVO vo){ // �Ϻ� ����
		System.out.println("--> mybatis in adminmanagedao get daily sales list");
		return sqlSessionTemplate.selectList("AdminManageDAO.dailyStoreSales", vo);
	}
	/**/

	
	/* post information */
	public PostingInfoVO postInfo(int postid){
		System.out.println("--> mybatis in adminmanagedao product detail information : " + postid);
		
		PostingInfoVO vo = new PostingInfoVO(); // posting ���� ���� ���� vo

		vo.setProductlist(sqlSessionTemplate.selectList("AdminManageDAO.postInfo1", postid));
		vo.setOptionnums(sqlSessionTemplate.selectList("AdminManageDAO.postInfo2", postid));
		vo.setDetail(sqlSessionTemplate.selectOne("AdminManageDAO.postInfo3", postid));
		vo.setPhotolist(sqlSessionTemplate.selectList("AdminManageDAO.postInfo4", postid));
		return vo;
	}
	

}
