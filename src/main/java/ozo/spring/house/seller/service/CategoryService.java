package ozo.spring.house.seller.service;

import java.util.List;

import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;

public interface CategoryService {
	
	public List<CategoryVO> getCategoryList(CategoryVO vo);
	public List<CategoryVO> getMidCategoryList(CategoryVO vo);
	public List<CategoryVO> getBotCategoryList(CategoryVO vo);
	
	public List<List<FilterVO>> getFilterOption(CategoryVO vo);
}
