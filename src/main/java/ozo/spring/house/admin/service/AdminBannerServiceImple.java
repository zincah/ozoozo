package ozo.spring.house.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.admin.dao.BannerDAO;
import ozo.spring.house.admin.vo.BannerVO;

@Service("adminBannerService")
public class AdminBannerServiceImple implements AdminBannerService  {

	@Autowired
	BannerDAO bannerDAO;
	
	@Override
	public void b_insert(BannerVO vo) {
		
		bannerDAO.b_insert(vo);
	}

	@Override
	public List<BannerVO> b_delete(BannerVO vo) {
		
		return null;
	}

	@Override
	public List<BannerVO> b_select(BannerVO vo) {
		return bannerDAO.b_select(vo);
	
	}

	@Override
	public void b_boolean(BannerVO vo) {
		
		bannerDAO.b_boolean(vo);
	}

	
	
	
	

}
