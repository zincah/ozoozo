package ozo.spring.house.user.service;

import ozo.spring.house.user.vo.ReviewVO;

import java.util.List;

public interface ReviewService {

    public List<ReviewVO> selectReviewList(ReviewVO vo);
    public List<ReviewVO> topReviewList(ReviewVO vo);
    public List<ReviewVO> myReviewList(ReviewVO vo);

    public void insertview(ReviewVO vo);
}
