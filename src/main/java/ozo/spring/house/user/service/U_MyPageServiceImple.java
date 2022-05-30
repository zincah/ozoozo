package ozo.spring.house.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.ReviewDAO;
import ozo.spring.house.user.dao.UserMyPageDAO;
import ozo.spring.house.user.vo.ReviewVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;
import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;

@Service("userMyPageService")
public class U_MyPageServiceImple implements U_MyPageService {

	@Autowired
	UserMyPageDAO UserMyPageDAO;
	
	
	
	public void setUsermypageDAO(UserMyPageDAO usermypageDAO) {
		this.UserMyPageDAO = usermypageDAO;
	}

	@Override
	public UserVO mypageinfo(UserVO vo) {
		return UserMyPageDAO.mypageinfo(vo);
	}

	@Override
	public void user_edit(UserVO vo) {
		System.out.println("걱정마 들어가고 있어 ");
		UserMyPageDAO.user_edit(vo);
	}

	@Override
	public void user_urlnone(UserVO vo) {
		System.out.println("응 url 제외하고 들어가고 있어 ");
		UserMyPageDAO.user_urlnone(vo);
		
	}

	@Override
	public void user_stop(UserVO vo) {
		UserMyPageDAO.user_stop(vo);
		
	}

	@Override
	public int checkCartSu(UserVO vo) {
		return UserMyPageDAO.checkCartSu(vo);
	}

	//review
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

	public Map<String, String> selectMyReviewOne(ReviewVO vo){
		return reviewDAO.selectMyReviewOne(vo);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewTODetailPage(int pro) {
		return reviewDAO.getReviewTODetailPage(pro);
	}

	@Override
	public int updateLiked(ReviewVO vo) {
		return reviewDAO.updateLiked(vo);
	}

}
