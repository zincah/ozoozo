package ozo.spring.house.admin.service;

import java.util.List;

import ozo.spring.house.admin.vo.AdminProductVO;

public interface AdminProductManageService {
	
	public List<AdminProductVO> selectPosting(AdminProductVO pvo);
	

}
