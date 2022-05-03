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

	@Override
	public void insertDetail(ProductVO vo) {
		productDAO.insertDetail(vo);
	}

	@Override
	public void insertPhoto(ProductVO vo) {
		productDAO.insertPhoto(vo);
	}
	
	@Override
	public List<ProductVO> selectProduct(int vo) {
		return productDAO.selectProduct(vo);
	}
	
	@Override
	public List<ProductVO> selectProductView(int vo) {
		return productDAO.selectProductView(vo);
	}

}
