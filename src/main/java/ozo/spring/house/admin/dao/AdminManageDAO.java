package ozo.spring.house.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.admin.vo.MemberVO;
import ozo.spring.house.common.Criteria;
import ozo.spring.house.seller.vo.ProductDetailVO;
import ozo.spring.house.user.vo.UserVO;

@Repository
public class AdminManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserVO> selectUser(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao select user");
		return sqlSessionTemplate.selectList("AdminManageDAO.selectUser", vo);
	}
	
	public List<UserVO> getUserList(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao getuselist");
		return sqlSessionTemplate.selectList("AdminManageDAO.getUserList", vo);
	}
	
	public void updateUserStatus(UserVO vo) {
		System.out.println("--> mybatis in adminmanagedao update user status");
		sqlSessionTemplate.update("AdminManageDAO.updateUserStatus", vo);
	}
	/*
	public List<AdminProductVO> selectPosting(Criteria cri) {
		System.out.println("--> mybatis in adminmanagedao selectposting");
		return sqlSessionTemplate.selectList("AdminManageDAO.selectPosting", cri);
	}
	
	public int selectPostCount() {
		System.out.println("--> mybatis in adminmanagedao selectpostCount");
		return sqlSessionTemplate.selectOne("AdminManageDAO.selectPostCount");
	}*/
	
	public void updateProductStatus(AdminProductVO pvo) {
		System.out.println("--> mybatis in adminmanagedao updateproductstatus");
		sqlSessionTemplate.update("AdminManageDAO.updateProductStatus1", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateProductStatus2", pvo);
	}
	
	public List<AdminProductVO> selectCouponList(){
		return sqlSessionTemplate.selectList("AdminManageDAO.selectCouponList");
	}
	
	public void updateCouponStatus(AdminProductVO pvo) {
		System.out.println("--> mybatis in adminmanagedao updatecouponstatus");
		sqlSessionTemplate.update("AdminManageDAO.updateCouponStatus", pvo);
	}
	
	public void updateDealStatus(AdminProductVO pvo) {
		System.out.println("--> mybatis in adminmanagedao updatedealstatus");
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatus", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatusOnPost", pvo);
		
		ProductDetailVO vo = new ProductDetailVO();
		vo.setDetail_name("오늘의딜");
		vo.setDetail_value(10001);
		vo.setDtop_catecode(1); // 이건 따로 넣어줘야함 vo부터 바꾸기
		vo.setDprodetails_postid(pvo.getPost_id());
		sqlSessionTemplate.insert("ProductDetailDAO.insertDetails", vo);
	}
	
	public void deleteDeal(AdminProductVO pvo) {
		System.out.println("--> mybatis in adminmanagedao deletedeal");
		sqlSessionTemplate.delete("AdminManageDAO.deleteDeal", pvo);
		sqlSessionTemplate.update("AdminManageDAO.updateDealStatusOnPost", pvo);
	}
	
	public List<AdminProductVO> getProductList(AdminProductVO pvo){
		System.out.println("--> mybatis in adminmanagedao getproductlist");
		return sqlSessionTemplate.selectList("AdminManageDAO.getProductList", pvo);
	}
	
	public int searchListCount(AdminProductVO pvo){
		System.out.println("--> mybatis in adminmanagedao getproductlist");
		List<AdminProductVO> list = sqlSessionTemplate.selectList("AdminManageDAO.searchListCount", pvo);
		return list.size();
	}
	
	public List<UserVO> floatingPopulation() {
		System.out.println("--> mybatis in adminmanagedao floating");
		return sqlSessionTemplate.selectList("AdminManageDAO.floatingPopulation");
	}


}
