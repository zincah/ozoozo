package ozo.spring.house.user.service;

import ozo.spring.house.user.vo.ReviewVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	/*
    public List<ReviewVO> selectReviewList(ReviewVO vo);
    public List<ReviewVO> topReviewList(ReviewVO vo);
    public List<ReviewVO> myReviewList(ReviewVO vo);
    public void insertview(ReviewVO vo);*/
	
	public List<Map<String, String>> listofobject(UserPaymentLogVO vo);
	public Map<String, String> getReviewInfo(UserPaymentLogVO vo);
	public void insertReview(ReviewVO vo);
	public List<Map<String, String>> selectMyReview(ReviewVO vo);
	public Map<String, String> selectMyReviewOne(ReviewVO vo);
}
