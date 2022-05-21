package ozo.spring.house.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ozo.spring.house.user.dao.ReviewDAO;
import ozo.spring.house.user.vo.ReviewVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;

import java.util.List;
import java.util.Map;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    ReviewDAO reviewDAO;

	@Override
	public List<Map<String, String>> listofobject(UserPaymentLogVO vo) {
		return reviewDAO.listofobject(vo);
	}

	@Override
	public Map<String, String> getReviewInfo(UserPaymentLogVO vo) {
		return reviewDAO.getReviewInfo(vo);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

	@Override
	public List<Map<String, String>> selectMyReview(ReviewVO vo) {
		return reviewDAO.selectMyReview(vo);
	}
  
  @Override
  public void insertview(ReviewVO vo) {
      reviewDAO.insertreview(vo);

  }

