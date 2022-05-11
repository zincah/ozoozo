package ozo.spring.house.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.admin.dao.AdminManageDAO;
import ozo.spring.house.admin.vo.AdminProductVO;
import ozo.spring.house.common.Criteria;

@Service("adminProductManageService")
public class AdminProductManageServiceImpl implements AdminProductManageService {
	
	@Autowired
	AdminManageDAO adminManageDAO;

	@Override
	public List<AdminProductVO> selectPosting(Criteria cri) {
		return adminManageDAO.selectPosting(cri);
	}

	@Override
	public int selectPostCount() {
		return adminManageDAO.selectPostCount();
	}

}
