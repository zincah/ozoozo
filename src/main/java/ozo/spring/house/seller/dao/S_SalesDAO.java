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
		System.out.println("--> mybatis in sellerSalesDAO salesList select");
		return sqlSessionTemplate.selectOne("SellerSalesDAO.selectSalesList", vo);
	}

	public List<ProductVO> selectBarChartTotalList(ProductVO vo) {
		System.out.println("--> mybatis in sellerSalesDAO barChartTotalList select");
		return sqlSessionTemplate.selectList("SellerSalesDAO.selectBarChartTotalList", vo);
	}

	public List<ProductVO> selectSalesDetailList(ProductVO vo) {
		System.out.println("--> mybatis in sellerSalesDAO salesDetailList select");
		return sqlSessionTemplate.selectList("SellerSalesDAO.selectSalesDetailList", vo);
	}
}
