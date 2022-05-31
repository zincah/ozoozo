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
		System.out.println("--> mybatis in sellerIndexDAO viewData select");
		return sqlSessionTemplate.selectOne("SellerIndexDAO.selectViewData", vo);
	}
}
