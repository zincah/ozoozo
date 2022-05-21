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
    	
    }
}
