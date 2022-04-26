package ozo.spring.house.seller.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@Repository("sellerDAO")
public class SellerDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	public SellerVO checkSeller(SellerVO vo) {
//		System.out.println("--> mybatis in sellerdao checkseller");
//		SellerVO seller = (SellerVO) sqlSessionTemplate.selectOne("SellerDAO.checkSeller", vo);
//
//		if(passwordEncoder.matches(vo.getUser_password(), seller.getUser_password())) {
//			return seller;
//		}else {
//			return null; 
//			// 예외처리
//		}
		
		return null;
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
