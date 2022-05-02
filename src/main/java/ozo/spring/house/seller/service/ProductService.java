package ozo.spring.house.seller.service;

import java.util.List;

import ozo.spring.house.seller.vo.ProductVO;
import ozo.spring.house.seller.vo.SellerVO;

public interface ProductService {
	
	public int insertPostIdAndGet(ProductVO vo);
	public void insertProduct(ProductVO vo);
	public void updatePost(ProductVO vo);
	public void insertDetail(ProductVO vo);
	public void insertPhoto(ProductVO vo);
	public List<ProductVO> selectProduct(SellerVO vo);
}
