package ozo.spring.house.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ozo.spring.house.admin.vo.BannerVO;

public interface AdminBannerService {
	
	public List<BannerVO> b_select (BannerVO vo);
	public void b_insert(BannerVO vo);
	public HashMap<String, String> b_boolean(BannerVO vo);
	public List<BannerVO> b_selectone(BannerVO vo);
	public void b_delete(BannerVO vo);
}
