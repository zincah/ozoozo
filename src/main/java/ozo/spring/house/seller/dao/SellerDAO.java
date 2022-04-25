package ozo.spring.house.seller.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.SellerVO;

@Repository("sellerDAO")
public class SellerDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	public SellerVO checkSeller(SellerVO vo) {
		System.out.println("--> mybatis in memberdao checkadmin");
		SellerVO seller = (SellerVO) sqlSessionTemplate.selectOne("SellerDAO.checkAdmin", vo);

		if(passwordEncoder.matches(vo.getSeller_password(), seller.getSeller_password())) {
			return seller;
		}else {
			return null; 
			// 예외처리
		}
	}
	
	public void insertSeller(SellerVO vo) {
		System.out.println("--> mybatis in memberdao insertseller");
		sqlSessionTemplate.insert("SellerDAO.insertSeller", vo);
		//sqlSessionTemplate.commit();
		System.out.println("--> insert success");
	}
}
