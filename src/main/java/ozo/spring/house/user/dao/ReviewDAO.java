package ozo.spring.house.user.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;
import java.util.Map;

import ozo.spring.house.user.vo.ReviewVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;

@Repository("reviewDAO")
public class ReviewDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    /*
    public List<ReviewVO> selectReviewList(ReviewVO vo){
        System.out.println("--> mybatis in reviewdao selectReviewList");
        return sqlSessionTemplate.selectList("ReviewDAO.selectReviewList", vo);
    }

    public List<ReviewVO> topReviewList(ReviewVO vo){
        System.out.println("--> mybatis in reviewdao topReviewList");
        return sqlSessionTemplate.selectList("ReviewDAO.topReviewList", vo);
    }

    public List<ReviewVO> myReviewList(ReviewVO vo){
        System.out.println("--> mybatis in reviewdao myReviewList");
        return sqlSessionTemplate.selectList("ReviewDAO.myReviewList", vo);
    }

    public List<Object> deleteReview(ReviewVO vo){
        System.out.println("r u sure?");
        return sqlSessionTemplate.selectList("ReviewDAO.deleteReview", vo);
    }

    public void insertreview(ReviewVO vo){
        System.out.println("ok");
        sqlSessionTemplate.insert("ReviewDAO.insertreview", vo);
    }*/
    
    public List<Map<String, String>> listofobject(UserPaymentLogVO vo) {
    	System.out.println("--> mybatis list of object");
    	return sqlSessionTemplate.selectList("ReviewDAO.listofobject", vo);
    }
    
    public Map<String, String> getReviewInfo(UserPaymentLogVO vo) {
    	System.out.println("--> mybatis list of object");
    	return sqlSessionTemplate.selectOne("ReviewDAO.getReviewInfo", vo);
    }
    
    public void insertReview(ReviewVO vo) {
    	System.out.println("--> mybatis list of object");
    	sqlSessionTemplate.insert("ReviewDAO.insertReview", vo);
    	sqlSessionTemplate.update("ReviewDAO.changeReviewStatus", vo);
    	sqlSessionTemplate.update("ReviewDAO.changeUserPoint", vo);
    	
    }
    
    public List<Map<String, String>> selectMyReview(ReviewVO vo){
    	System.out.println("--> mybatis select my review");
    	return sqlSessionTemplate.selectList("ReviewDAO.selectMyReview", vo);
    }
    
    public Map<String, String> selectMyReviewOne(ReviewVO vo){
    	System.out.println("--> mybatis select my review one");
    	return sqlSessionTemplate.selectOne("ReviewDAO.selectMyReviewOne", vo);
    }
    
    public void updateReview(ReviewVO vo) {
    	System.out.println("--> mybatis update review");
    	sqlSessionTemplate.update("ReviewDAO.updateMyReview", vo);
    }
    
    // 상세페이지 리뷰
    public List<ReviewVO> getReviewTODetailPage(int pro){
    	System.out.println("--> mybatis review to detail page");
    	return sqlSessionTemplate.selectList("ReviewDAO.getReviewTODetailPage", pro);
    }
    
    public int updateLiked(ReviewVO vo){
    	System.out.println("--> mybatis liked update");
    	sqlSessionTemplate.update("ReviewDAO.updateLiked", vo);
    	return sqlSessionTemplate.selectOne("ReviewDAO.getLikedSu", vo);
    }
}
