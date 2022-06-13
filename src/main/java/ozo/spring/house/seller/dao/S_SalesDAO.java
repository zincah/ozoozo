package ozo.spring.house.seller.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductVO;

@Repository("sellerSalesDAO")
public class S_SalesDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ProductVO selectSalesList(ProductVO vo) {
		System.err.println("[Log] --- S_ProductDetail 	DAO >>>>> insertDetails 	Method");
		return sqlSessionTemplate.selectOne("SellerSalesDAO.selectSalesList", vo);
	}

	public List<ProductVO> selectBarChartTotalList(ProductVO vo) {
		System.err.println("[Log] --- S_ProductDetail 	DAO >>>>> selectBarChartTotalList 	Method");
		return sqlSessionTemplate.selectList("SellerSalesDAO.selectBarChartTotalList", vo);
	}

	public List<ProductVO> selectSalesDetailList(ProductVO vo) {
		System.err.println("[Log] --- S_ProductDetail 	DAO >>>>> selectSalesDetailList 	Method");
		return sqlSessionTemplate.selectList("SellerSalesDAO.selectSalesDetailList", vo);
	}
}
