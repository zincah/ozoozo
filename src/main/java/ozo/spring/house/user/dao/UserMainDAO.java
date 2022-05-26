package ozo.spring.house.user.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.BannerVO;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserVO;

@Repository
public class UserMainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// header 장바구니 카운트
	public int checkCartSu(UserVO vo) {
		System.out.println("--> mybatis in usermaindao checkcartsu");
		return sqlSessionTemplate.selectOne("UserMainDAO.checkCartSu", vo);
	}
	
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
	
	public List<Map<String, String>> getDealEndTime(){
		System.out.println("mybatis in usermaindao getdealendtime");
		return sqlSessionTemplate.selectList("UserMainDAO.getDealEndTime");
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
	
	// deal 시간 추가
	public List<Map<String, String>> getDealEndTimeAtDealPage(){
		System.out.println("mybatis in usermaindao getdealendtime at deal page");
		return sqlSessionTemplate.selectList("UserMainDAO.getDealEndTimeAtDealPage");
	}

	// brand 관련 잠깐 추가
	public List<UserProductVO> shopItemList(UserProductVO vo){
		System.out.println("mybatis in usermaindao shopitemlist");
		
		System.out.println("mid값" + vo.getInt());
		List<UserProductVO> list = sqlSessionTemplate.selectList("UserMainDAO.shopItemList", vo);
		System.out.println(list.size());
		return list;
	}
	
	public SellerVO sellerInfo(UserProductVO vo) {
		System.out.println("--> mybatis in usermaindao sellerinfo");
		return sqlSessionTemplate.selectOne("UserMainDAO.sellerInfo", vo);
	}
	
	public List<UserCategoryVO> printTop(UserProductVO vo){
		System.out.println("--> mybatis in usermaindao printtop");
		return sqlSessionTemplate.selectList("UserMainDAO.printTopCate", vo);
	}

	public List<List<UserCategoryVO>> printCateList(UserProductVO vo){
		System.out.println("--> mybatis in usermaindao printcatelist");
		
		List<UserCategoryVO> mid = sqlSessionTemplate.selectList("UserMainDAO.printMidCate", vo);
		List<UserCategoryVO> sm = sqlSessionTemplate.selectList("UserMainDAO.printSmCate", vo);
		System.out.println(mid.size());
		System.out.println(sm.size());

		List<List<UserCategoryVO>> wholelist = new ArrayList<List<UserCategoryVO>>();

		for(int i=0; i<mid.size(); i++) {
			List<UserCategoryVO> catelist = new ArrayList<UserCategoryVO>();
			UserCategoryVO m = mid.get(i);
			catelist.add(m);
			
			for(int j=0; j<sm.size(); j++) {
				
				UserCategoryVO s = sm.get(j);
				
				if(m.getSubcate_code() == s.getSubcate_code()/100*100) {
					catelist.add(s);
				}
			}

			
			wholelist.add(catelist);
		}

		return wholelist;
	}
	
	public int shopItemListCount(UserProductVO vo) {
		System.out.println("--> mybatis in usermaindao shop item list count");
		return sqlSessionTemplate.selectOne("UserMainDAO.shopItemListCount", vo);
	}

	public List<UserProductVO> bestlist(){
		System.out.println("mybatis in usermaindao todaydeallist");
		
		List<UserProductVO> b_list = sqlSessionTemplate.selectList("UserMainDAO.bestlist");
		System.out.println(b_list.size());

		return b_list;
	}
		


}
