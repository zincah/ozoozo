package ozo.spring.house.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.S_ProductDAO;
import ozo.spring.house.seller.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	S_ProductDAO productDAO;

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
	public List<ProductVO> selectProductView(ProductVO vo) {
		return productDAO.selectProductView(vo);
	}

	@Override
	public int selectListCount(ProductVO vo) {
		return productDAO.selectListCount(vo);
	}
	
	@Override
	public void updateProductStatus(ProductVO vo) {
		productDAO.updateProductStatus(vo);
	}
	
	@Override
	public void updateProductUpdated(ProductVO vo) {
		productDAO.updateProductUpdated(vo);
	}

	@Override
	public ProductVO selectSelectProduct(ProductVO vo) {
		return productDAO.selectSelectProduct(vo);
	}

	@Override
	public void deleteSelectProduct(ProductVO vo) {
		productDAO.deleteSelectProduct(vo);
	}
	
	@Override
	public List<ProductVO> selectSearchProduct(ProductVO vo) {
		return productDAO.selectSearchProduct(vo);
	}
	
	@Override
	public int selectSearchProductCount(ProductVO vo) {
		return productDAO.selectSearchProductCount(vo);
	}

}
