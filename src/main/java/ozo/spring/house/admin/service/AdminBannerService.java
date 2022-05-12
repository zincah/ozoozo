package ozo.spring.house.admin.service;

import java.util.List;

import ozo.spring.house.admin.vo.BannerVO;

public interface AdminBannerService {
	
	public List<BannerVO> b_select (BannerVO vo);
	public void b_insert(BannerVO vo);
	public List<BannerVO> b_delete(BannerVO vo);
	public void b_boolean(BannerVO vo);

}
