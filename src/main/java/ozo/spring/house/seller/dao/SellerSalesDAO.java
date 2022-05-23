package ozo.spring.house.seller.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductVO;

@Repository("sellerSalesDAO")
public class SellerSalesDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ProductVO selectSalesList(ProductVO vo) {
		System.out.println("--> mybatis in sellerSalesDAO salesList select");
		return sqlSessionTemplate.selectOne("SellerSalesDAO.selectSalesList", vo);
	}
}
