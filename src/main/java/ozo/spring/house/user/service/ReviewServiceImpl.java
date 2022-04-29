package ozo.spring.house.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ozo.spring.house.user.dao.ReviewDAO;
import ozo.spring.house.user.vo.ReviewVO;

import java.util.List;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    ReviewDAO reviewDAO;

    @Override
    public List<ReviewVO> selectReviewList(ReviewVO vo) {
        return null;
    }

    @Override
    public List<ReviewVO> topReviewList(ReviewVO vo) {
        return null;
    }

    @Override
    public List<ReviewVO> myReviewList(ReviewVO vo) {
        return reviewDAO.myReviewList(vo);
    }




    @Override
    public void insertview(ReviewVO vo) {
        reviewDAO.insertreview(vo);

    }
}
