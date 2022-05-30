package ozo.spring.house.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.U_MyPageDAO;
import ozo.spring.house.user.vo.ReviewVO;
import ozo.spring.house.user.vo.ScrapVO;
import ozo.spring.house.user.vo.UserPaymentLogVO;
import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;

@Service("userMyPageService")
public class U_MyPageServiceImple implements U_MyPageService {

	@Autowired
	U_MyPageDAO UserMyPageDAO;
	
	
	public void setUsermypageDAO(U_MyPageDAO usermypageDAO) {
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

	//review
	@Override
	public List<Map<String, String>> listofobject(UserPaymentLogVO vo) {
		return UserMyPageDAO.listofobject(vo);
	}

	@Override
	public Map<String, String> getReviewInfo(UserPaymentLogVO vo) {
		return UserMyPageDAO.getReviewInfo(vo);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		UserMyPageDAO.insertReview(vo);
	}

	@Override
	public List<Map<String, String>> selectMyReview(ReviewVO vo) {
		return UserMyPageDAO.selectMyReview(vo);
	}

	public Map<String, String> selectMyReviewOne(ReviewVO vo){
		return UserMyPageDAO.selectMyReviewOne(vo);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		UserMyPageDAO.updateReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewTODetailPage(int pro) {
		return UserMyPageDAO.getReviewTODetailPage(pro);
	}

	@Override
	public int updateLiked(ReviewVO vo) {
		return UserMyPageDAO.updateLiked(vo);
	}
	
	//scrap
	
	
	public void getUserscrapdao(U_MyPageDAO mypageDAO ) {
			this.UserMyPageDAO = mypageDAO;
	}
	
	@Override
	public List<ScrapVO> s_scrap(ScrapVO vo) {
		return UserMyPageDAO.s_scrap(vo);
	}
	
	@Override
	public void s_cancle(UserScrapVO vo) {
		UserMyPageDAO.s_cancle(vo);
	}

	@Override
	public void s_insert(UserScrapVO vo) {
		UserMyPageDAO.s_insert(vo);
	}

	@Override
	public List<UserScrapVO> us_list(UserScrapVO vo) {
		return UserMyPageDAO.us_list(vo);
	}

	@Override
	public List<UserScrapVO> userScrapList(UserScrapVO vo) { // scrap 얻어오기
		return UserMyPageDAO.userScrapList(vo);
	}

	@Override
	public UserScrapVO duplicate(UserScrapVO vo) {
		return UserMyPageDAO.duplicate(vo);
	}


}
