package ozo.spring.house.seller.service;

import java.util.List;

import ozo.spring.house.seller.vo.ProductVO;

public interface ProductService {
	
	public int insertPostIdAndGet(ProductVO vo);
	public void insertProduct(ProductVO vo);
	public void updatePost(ProductVO vo);
	public void insertDetail(ProductVO vo);
	public void insertPhoto(ProductVO vo);
	public List<ProductVO> selectProduct(int vo);
	public List<ProductVO> selectProductView(ProductVO pvo);
	public int selectListCount(ProductVO pvo);
	public void updateProductStatus(ProductVO vo);
	public void updateProductUpdated(ProductVO vo);
	public ProductVO selectSelectProduct(ProductVO vo);
	public void deleteSelectProduct(ProductVO vo);
	public List<ProductVO> selectSearchProduct(ProductVO vo);
	public int selectSearchProductCount(ProductVO vo);
}
