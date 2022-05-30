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
import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserCategoryVO;
import ozo.spring.house.user.vo.UserPagingVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserVO;

@Repository
public class U_MainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserProductVO> mainProductList(UserProductVO vo){
		System.err.println("[Log] --- Main DAO >>>>> mainProductList Method");
		return sqlSessionTemplate.selectList("UserMainDAO.mainProductList", vo);
	}
	
	public List<UserProductVO> mainDealProductList(UserProductVO vo){
		System.err.println("[Log] --- Main DAO >>>>> mainDealProductList Method");
		return sqlSessionTemplate.selectList("UserMainDAO.mainDealProductList", vo);
	}
	
	public List<UserProductVO> plusProductList(UserPagingVO pvo){
		System.err.println("[Log] --- Main DAO >>>>> plusProductList Method");
		return sqlSessionTemplate.selectList("UserMainDAO.plusProductList", pvo);
	}
	
	public int getProductCount() {
		System.err.println("[Log] --- Main DAO >>>>> getProductCount Method");
		return sqlSessionTemplate.selectOne("UserMainDAO.getProductCount");
	}
	
	public List<BannerVO> selectBannerList(){
		System.err.println("[Log] --- Main DAO >>>>> selectBannerList Method");
		return sqlSessionTemplate.selectList("UserMainDAO.selectBannerList");
	}
	
	public List<Map<String, String>> getDealEndTime(){
		System.err.println("[Log] --- Main DAO >>>>> getDealEndTime Method");
		return sqlSessionTemplate.selectList("UserMainDAO.getDealEndTime");
	}

	public List<UserProductVO> todayDealList(){
		System.err.println("[Log] --- Main DAO >>>>> todayDealList Method");
		
		List<UserProductVO> list = sqlSessionTemplate.selectList("UserMainDAO.todayDealList");

		return list;
	}
	
	// deal 시간 추가
	public List<Map<String, String>> getDealEndTimeAtDealPage(){
		System.err.println("[Log] --- Main DAO >>>>> getDealEndTimeAtDealPage Method");
		return sqlSessionTemplate.selectList("UserMainDAO.getDealEndTimeAtDealPage");
	}

	// brand 관련 잠깐 추가
	public List<UserProductVO> shopItemList(UserProductVO vo){
		System.err.println("[Log] --- Main DAO >>>>> shopItemList Method");
		List<UserProductVO> list = sqlSessionTemplate.selectList("UserMainDAO.shopItemList", vo);
		return list;
	}
	
	public SellerVO sellerInfo(UserProductVO vo) {
		System.err.println("[Log] --- Main DAO >>>>> sellerInfo Method");
		return sqlSessionTemplate.selectOne("UserMainDAO.sellerInfo", vo);
	}
	
	public List<UserCategoryVO> printTop(UserProductVO vo){
		System.err.println("[Log] --- Main DAO >>>>> printTop Method");
		return sqlSessionTemplate.selectList("UserMainDAO.printTopCate", vo);
	}

	public List<List<UserCategoryVO>> printCateList(UserProductVO vo){
		System.err.println("[Log] --- Main DAO >>>>> printCateList Method");
		List<UserCategoryVO> mid = sqlSessionTemplate.selectList("UserMainDAO.printMidCate", vo);
		List<UserCategoryVO> sm = sqlSessionTemplate.selectList("UserMainDAO.printSmCate", vo);

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
		System.err.println("[Log] --- Main DAO >>>>> shopItemListCount Method");
		return sqlSessionTemplate.selectOne("UserMainDAO.shopItemListCount", vo);
	}
	
	public double setBrandStarRatio(UserProductVO vo) { // brand 별점 체크
		System.err.println("[Log] --- Main DAO >>>>> setBrandStarRatio Method");
		double star = sqlSessionTemplate.selectOne("UserMainDAO.setBrandStarRatio", vo);
		double star_ratio = Math.round(star*10)/10.0;
		return star_ratio;
	}

	public List<UserProductVO> bestlist(){
		System.err.println("[Log] --- Main DAO >>>>> bestlist Method");
		
		List<UserProductVO> b_list = sqlSessionTemplate.selectList("UserMainDAO.bestlist");

		return b_list;
	}
		
	public List<CScenterVO> csall(CScenterVO vo) {
		System.err.println("[Log] --- Main DAO >>>>> csall Method");
		return sqlSessionTemplate.selectList("CScenterDAO.csall",vo);
	}
	
	public List<CScenterVO> cskeyword(CScenterVO vo) {
		System.err.println("[Log] --- Main DAO >>>>> cskeyword Method");
		return sqlSessionTemplate.selectList("CScenterDAO.cskeyword", vo);
	}

}
