package ozo.spring.house.seller.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.seller.vo.ProductVO;

@Repository("sellerOrderDAO")
public class S_OrderDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProductVO> selectOrderList(ProductVO vo) {
		System.err.println("[Log] --- S_Order 	DAO >>>>> selectOrderList 	Method");
		return sqlSessionTemplate.selectList("SellerOrderDAO.selectOrderList", vo);
	}
	
	public List<ProductVO> selectSearchOrder(ProductVO vo) {
		System.err.println("[Log] --- S_Order 	DAO >>>>> selectSearchOrder 	Method");
		return sqlSessionTemplate.selectList("SellerOrderDAO.selectSearchOrder", vo);
	}
	
	public List<ProductVO> selectOrderDetailData(ProductVO vo) {
		System.err.println("[Log] --- S_Order 	DAO >>>>> selectOrderDetailData 	Method");
		return sqlSessionTemplate.selectList("SellerOrderDAO.selectOrderDetailData", vo);
	}

	public ProductVO selectOrderDetailPayment(ProductVO vo) {
		System.err.println("[Log] --- S_Order 	DAO >>>>> selectOrderDetailPayment 	Method");
		return sqlSessionTemplate.selectOne("SellerOrderDAO.selectOrderDetailPayment", vo);
	}

	public ProductVO selectOrderListModal(ProductVO vo) {
		System.err.println("[Log] --- S_Order 	DAO >>>>> selectOrderListModal 	Method");
		return sqlSessionTemplate.selectOne("SellerOrderDAO.selectOrderListModal", vo);
	}

	public void updateOrderCheck(ProductVO vo) {
		System.err.println("[Log] --- S_Order 	DAO >>>>> updateOrderCheck 	Method");
		sqlSessionTemplate.update("SellerOrderDAO.updateOrderCheck", vo);
	}

	public void updateOrderSend(ProductVO vo) {
		System.err.println("[Log] --- S_Order 	DAO >>>>> updateOrderSend 	Method");
		sqlSessionTemplate.update("SellerOrderDAO.updateOrderSend", vo);
	}
}
