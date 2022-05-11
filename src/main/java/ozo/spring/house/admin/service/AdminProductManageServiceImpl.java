package ozo.spring.house.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.admin.dao.AdminManageDAO;
import ozo.spring.house.admin.vo.AdminProductVO;

@Service("adminProductManageService")
public class AdminProductManageServiceImpl implements AdminProductManageService {
	
	@Autowired
	AdminManageDAO adminManageDAO;

	@Override
	public List<AdminProductVO> selectPosting(AdminProductVO pvo) {
		return adminManageDAO.selectPosting(pvo);
	}

}
