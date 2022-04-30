package ozo.spring.house.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.ProductDAO;
import ozo.spring.house.seller.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO productDAO;

	@Override
	public void insertProduct(ProductVO vo) {
		productDAO.insertProduct(vo);
	}

	@Override
	public int insertPostIdAndGet(ProductVO vo) {
		return productDAO.insertPostIdAndGet(vo);
	}

	@Override
	public void updatePost(ProductVO vo) {
		productDAO.updatePost(vo);
	}

}
