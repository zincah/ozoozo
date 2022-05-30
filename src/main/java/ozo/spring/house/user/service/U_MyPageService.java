package ozo.spring.house.user.service;

import java.util.List;
import java.util.Map;

import ozo.spring.house.user.vo.ReviewVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;
import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;

public interface U_MyPageService {

	public UserVO mypageinfo(UserVO vo);
	public void user_edit(UserVO vo);
	public void user_urlnone(UserVO vo);
	public void user_stop(UserVO vo);
	
	// 고객 장바구니 상품 수
	public int checkCartSu(UserVO vo);
	
	//Reivew
	public List<Map<String, String>> listofobject(UserPaymentLogVO vo);
	public Map<String, String> getReviewInfo(UserPaymentLogVO vo);
	public void insertReview(ReviewVO vo);
	public List<Map<String, String>> selectMyReview(ReviewVO vo);
	public Map<String, String> selectMyReviewOne(ReviewVO vo);
	public void updateReview(ReviewVO vo);
	
	public List<ReviewVO> getReviewTODetailPage(int pro);
	public int updateLiked(ReviewVO vo);
}
