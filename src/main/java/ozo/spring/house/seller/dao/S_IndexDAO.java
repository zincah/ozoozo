package ozo.spring.house.seller.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductVO;

@Repository("sellerIndexDAO")
public class S_IndexDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ProductVO selectViewData(ProductVO vo) {
		System.err.println("[Log] --- S_Index 	DAO >>>>> selectViewData 	Method");
		return sqlSessionTemplate.selectOne("SellerIndexDAO.selectViewData", vo);
	}
}
