package ozo.spring.house.user.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;
import java.util.List;

import ozo.spring.house.user.vo.ReviewVO;

@Repository("reviewDAO")
public class ReviewDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public List<ReviewVO> getReviewList(ReviewVO vo){
        System.out.println("--> mybatis in reviewdao getreviewlist");
        return sqlSessionTemplate.selectList("ReviewDAO.getReviewList", vo);
    }

    


}
