package ozo.spring.house.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.seller.dao.CategoryDAO;
import ozo.spring.house.seller.vo.CategoryVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryDAO categoryDAO;

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

}
