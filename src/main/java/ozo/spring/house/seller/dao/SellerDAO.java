package ozo.spring.house.seller.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.service.SellerService;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@Repository("sellerDAO")
public class SellerDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	SellerService sellerService;

	public SellerVO checkSeller(UserVO vo) {
		System.out.println("--> mybatis in sellerdao checkseller");
		try {
			SellerVO seller = (SellerVO) sqlSessionTemplate.selectOne("SellerDAO.checkSeller", vo);
			UserVO user = checkSellerUser(vo);
			if(passwordEncoder.matches(vo.getUser_pw(), user.getUser_pw())) {
				return seller;
			}else {
				return null; 
				// ����ó��
			}
		} catch (Exception e) {
			return null;
		}
	}

	public UserVO checkSellerUser(UserVO vo) {
		System.out.println("--> mybatis in sellerdao checkselleruser");
		UserVO user = (UserVO) sqlSessionTemplate.selectOne("SellerDAO.checkSellerUser", vo);
		return user;
	}

	public void insertSeller(SellerVO vo) {
		System.out.println("--> mybatis in sellerdao insertseller");
		sqlSessionTemplate.insert("SellerDAO.insertSeller", vo);
		//sqlSessionTemplate.commit();
		System.out.println("--> insert success");
	}

	public UserVO userDataSeller(int user_id) {
		System.out.println("--> mybatis in sellerdao userdataseller");
		UserVO user = (UserVO) sqlSessionTemplate.selectOne("SellerDAO.userDataSeller", user_id);
		return user;
	}
}
