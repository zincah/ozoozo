package ozo.spring.house.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.S_CategoryDAO;
import ozo.spring.house.seller.vo.CategoryVO;
import ozo.spring.house.seller.vo.FilterVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	S_CategoryDAO categoryDAO;

	@Override
	public List<CategoryVO> getCategoryList(CategoryVO vo) {
		return categoryDAO.getCategoryList(vo);
	}

	@Override
	public List<CategoryVO> getMidCategoryList(CategoryVO vo) {
		return categoryDAO.getMidCategoryList(vo);
	}

	@Override
	public List<CategoryVO> getBotCategoryList(CategoryVO vo) {
		return categoryDAO.getBotCategoryList(vo);
	}

	@Override
	public List<List<FilterVO>> getFilterOption(CategoryVO vo) {
		return categoryDAO.getFilterOption(vo);
	}

}
