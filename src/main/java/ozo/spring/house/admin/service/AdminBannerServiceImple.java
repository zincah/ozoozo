package ozo.spring.house.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<BannerVO> b_select(BannerVO vo) {
		return bannerDAO.b_select(vo);
	
	}

	@Override
	public HashMap<String, String> b_boolean(BannerVO vo) {
		bannerDAO.b_boolean(vo);
		return null;
	}

	@Override
	public List<BannerVO> b_selectone(BannerVO vo) {
		return bannerDAO.b_selectone(vo);
	}


	@Override
	public void b_delete(BannerVO vo) {
		bannerDAO.b_delete(vo);
	}

	
	
	
	

}
