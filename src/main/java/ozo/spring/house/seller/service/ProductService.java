package ozo.spring.house.seller.service;

import ozo.spring.house.seller.vo.ProductVO;

public interface ProductService {
	
	public int insertPostIdAndGet(ProductVO vo);
	public void insertProduct(ProductVO vo);
	public void updatePost(ProductVO vo);
	public void insertDetail(ProductVO vo);
}
