package ozo.spring.house.seller.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductVO;

@Repository("sellerOrderDAO")
public class SellerOrderDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProductVO> selectOrderList(ProductVO vo) {
		System.out.println("--> mybatis in sellerOrderDAO OrderList select");
		return sqlSessionTemplate.selectList("SellerOrderDAO.selectOrderList", vo);
	}
	
	public List<ProductVO> selectSearchOrder(ProductVO vo) {
		System.out.println("--> mybatis in sellerOrderDAO searchOrder select");
		return sqlSessionTemplate.selectList("SellerOrderDAO.selectSearchOrder", vo);
	}
	
	public List<ProductVO> selectOrderDetailData(ProductVO vo) {
		System.out.println("--> mybatis in sellerOrderDAO orderDetailData select");
		return sqlSessionTemplate.selectList("SellerOrderDAO.selectOrderDetailData", vo);
	}

	public ProductVO selectOrderDetailPayment(ProductVO vo) {
		System.out.println("--> mybatis in sellerOrderDAO orderDetailPayment select");
		return sqlSessionTemplate.selectOne("SellerOrderDAO.selectOrderDetailPayment", vo);
	}
}
