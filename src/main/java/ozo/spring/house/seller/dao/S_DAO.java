package ozo.spring.house.seller.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.service.SellerService;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@Repository("sellerDAO")
public class S_DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	SellerService sellerService;

	public SellerVO checkSeller(UserVO vo) {
		System.err.println("[Log] --- S 	DAO >>>>> checkSeller 	Method");
		try {
			SellerVO seller = (SellerVO) sqlSessionTemplate.selectOne("SellerDAO.checkSeller", vo);
			UserVO user = checkSellerUser(vo);
			if(passwordEncoder.matches(vo.getUser_pw(), user.getUser_pw())) {
				return seller;
			}else {
				return null; 
				// 예외처리
			}
		} catch (Exception e) {
			return null;
		}
	}

	public UserVO checkSellerUser(UserVO vo) {
		System.err.println("[Log] --- S 	DAO >>>>> checkSellerUser 	Method");
		UserVO user = (UserVO) sqlSessionTemplate.selectOne("SellerDAO.checkSellerUser", vo);
		return user;
	}

	public void insertSeller(SellerVO vo) {
		System.err.println("[Log] --- S 	DAO >>>>> insertSeller 	Method");
		sqlSessionTemplate.insert("SellerDAO.insertSeller", vo);
		//sqlSessionTemplate.commit();
		System.out.println("--> insert success");
	}

	public UserVO userDataSeller(int user_id) {
		System.err.println("[Log] --- S 	DAO >>>>> userDataSeller 	Method");
		UserVO user = (UserVO) sqlSessionTemplate.selectOne("SellerDAO.userDataSeller", user_id);
		return user;
	}
}
