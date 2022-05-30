package ozo.spring.house.user.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.ReviewVO;
import ozo.spring.house.user.vo.ScrapVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;
import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;

@Repository("userMyPageDAO")
public class U_MyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//ȸ������ ����
	public UserVO mypageinfo(UserVO vo) {
		System.err.println("[Log] --- MyPage DAO >>>>> mypageinfo Method");
		System.out.println(vo.getUser_num());
		return sqlSessionTemplate.selectOne("UserMyPageDAO.selectUser",vo);
	}
	
	public void user_edit(UserVO vo) {
		System.err.println("[Log] --- MyPage DAO >>>>> user_edit Method");
		sqlSessionTemplate.update("UserMyPageDAO.user_edit",vo);
	}
	public void user_urlnone(UserVO vo) {
		System.err.println("[Log] --- MyPage DAO >>>>> user_urlnone Method");
		sqlSessionTemplate.update("UserMyPageDAO.user_urlnone",vo);
	}
	public void user_stop(UserVO vo) {
		System.err.println("[Log] --- MyPage DAO >>>>> user_stop Method");
		sqlSessionTemplate.update("UserMyPageDAO.user_stop",vo);
	}
	
	//scrap
public List<ScrapVO> s_scrap(ScrapVO svo) {
	System.err.println("[Log] --- MyPage DAO >>>>> s_scrap Method");
		return sqlSessionTemplate.selectList("UserScrapDAO.s_scrap",svo);
	}
	
	public void s_cancle(UserScrapVO vo) {
		System.err.println("[Log] --- MyPage DAO >>>>> s_cancle Method");
		sqlSessionTemplate.delete("UserScrapDAO.s_cancle",vo);
	}
	
	//��ũ�� 
	public void s_insert(UserScrapVO vo) {
		System.err.println("[Log] --- MyPage DAO >>>>> s_insert Method");
		sqlSessionTemplate.insert("UserScrapDAO.s_insert",vo);
	}
	
	//��ũ�� �ߺ�Ȯ�ο� ���̺�
	public List<UserScrapVO> us_list(UserScrapVO vo) {
		System.err.println("[Log] --- MyPage DAO >>>>> us_list Method");
		return sqlSessionTemplate.selectList("UserScrapDAO.us_list",vo);
	}
	
	public List<UserScrapVO> userScrapList(UserScrapVO vo){
		System.err.println("[Log] --- MyPage DAO >>>>> userScrapList Method");
		return sqlSessionTemplate.selectList("UserScrapDAO.userScrapList", vo);
	}
	
	public UserScrapVO duplicate(UserScrapVO vo) {
		System.err.println("[Log] --- MyPage DAO >>>>> duplicate Method");
		return sqlSessionTemplate.selectOne("UserScrapDAO.duplicate", vo);
	}
	//review
	public List<Map<String, String>> listofobject(UserPaymentLogVO vo) {
		System.err.println("[Log] --- MyPage DAO >>>>> listofobject Method");
    	return sqlSessionTemplate.selectList("ReviewDAO.listofobject", vo);
    }
    
    public Map<String, String> getReviewInfo(UserPaymentLogVO vo) {
    	System.err.println("[Log] --- MyPage DAO >>>>> getReviewInfo Method");
    	return sqlSessionTemplate.selectOne("ReviewDAO.getReviewInfo", vo);
    }
    
    public void insertReview(ReviewVO vo) {
    	System.err.println("[Log] --- MyPage DAO >>>>> insertReview Method");
    	sqlSessionTemplate.insert("ReviewDAO.insertReview", vo); // ���� insert
    	sqlSessionTemplate.update("ReviewDAO.changeReviewStatus", vo); // ���� ���� ���� change
    	sqlSessionTemplate.update("ReviewDAO.changeUserPoint", vo); // ���� ����Ʈ +500
    	sqlSessionTemplate.update("ReviewDAO.changeStarRatio", vo); // posting ���� change
    }
    
    public List<Map<String, String>> selectMyReview(ReviewVO vo){
    	System.err.println("[Log] --- MyPage DAO >>>>> selectMyReview Method");
    	return sqlSessionTemplate.selectList("ReviewDAO.selectMyReview", vo);
    }
    
    public Map<String, String> selectMyReviewOne(ReviewVO vo){
    	System.err.println("[Log] --- MyPage DAO >>>>> selectMyReviewOne Method");
    	return sqlSessionTemplate.selectOne("ReviewDAO.selectMyReviewOne", vo);
    }
    
    public void updateReview(ReviewVO vo) {
    	System.err.println("[Log] --- MyPage DAO >>>>> updateReview Method");
    	sqlSessionTemplate.update("ReviewDAO.updateMyReview", vo);
    }
    
    // �������� ����
    public List<ReviewVO> getReviewTODetailPage(int pro){
    	System.err.println("[Log] --- MyPage DAO >>>>> getReviewTODetailPage Method");
    	return sqlSessionTemplate.selectList("ReviewDAO.getReviewTODetailPage", pro);
    }
    
    public int updateLiked(ReviewVO vo){
    	System.err.println("[Log] --- MyPage DAO >>>>> updateLiked Method");
    	sqlSessionTemplate.update("ReviewDAO.updateLiked", vo);
    	return sqlSessionTemplate.selectOne("ReviewDAO.getLikedSu", vo);
    }
}
