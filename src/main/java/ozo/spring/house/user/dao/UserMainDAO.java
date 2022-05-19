package ozo.spring.house.user.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserVO;

@Repository
public class UserMainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserProductVO> mainProductList(UserProductVO vo){
		System.out.println("mybatis in usermaindao mainproductlist");
		return sqlSessionTemplate.selectList("UserMainDAO.mainProductList", vo);
	}
	
	public List<UserProductVO> mainDealProductList(UserProductVO vo){
		System.out.println("mybatis in usermaindao maindealproductlist");
		return sqlSessionTemplate.selectList("UserMainDAO.mainDealProductList", vo);
	}
	
	public List<UserProductVO> plusProductList(UserPagingVO pvo){
		System.out.println("mybatis in usermaindao maindealproductlist");
		System.out.println(pvo.getThispage());
		return sqlSessionTemplate.selectList("UserMainDAO.plusProductList", pvo);
	}
	
	public int getProductCount() {
		System.out.println("mybatis in usermaindao getproduct total count");
		return sqlSessionTemplate.selectOne("UserMainDAO.getProductCount");
	}
	
	public List<BannerVO> selectBannerList(){
		System.out.println("mybatis in usermaindao mainbannerlist");
		return sqlSessionTemplate.selectList("UserMainDAO.selectBannerList");
	}
	
	// 잠깐 추가
	public UserVO checkUserByNaver(UserVO vo) {
		System.out.println("mybatis in userdao naverlogin");
		return sqlSessionTemplate.selectOne("UserDAO.checkUserByNaver", vo);
	}
	
	// 여기도 잠깐 추가
	public void lastLoginCheck(UserVO vo) {
		System.out.println("mybatis in userdao lastlogintimecheck");
		sqlSessionTemplate.update("UserDAO.lastLoginCheck", vo);
		
		System.out.println("회원 넘버 : " + vo.getUser_num());
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    String formattedDate = simpleDateFormat.format(date);
	    
	    vo.setLogin_date(java.sql.Date.valueOf(formattedDate));
		UserVO user = sqlSessionTemplate.selectOne("UserDAO.selectLoginCount", vo);
		
		if(user == null) {
			System.out.println("insert");
			sqlSessionTemplate.insert("UserDAO.insertLoginCount", vo);
		}
	}

	public List<UserProductVO> todayDealList(){
		System.out.println("mybatis in usermaindao todaydeallist");
		
		List<UserProductVO> list = sqlSessionTemplate.selectList("UserMainDAO.todayDealList");
		System.out.println(list.size());

		return list;
	}

	public List<UserProductVO> shopItemList(){
		System.out.println("mybatis in usermaindao shopitemlist");
		List<UserProductVO> list = sqlSessionTemplate.selectList("UserMainDAO.shopItemList");
		System.out.println(list.size());
		return list;
	}


}
