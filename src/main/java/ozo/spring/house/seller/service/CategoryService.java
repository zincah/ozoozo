package ozo.spring.house.seller.service;

import java.util.List;

import ozo.spring.house.seller.vo.CategoryVO;

public interface CategoryService {
	
	public List<CategoryVO> getCategoryList(CategoryVO vo);

}
