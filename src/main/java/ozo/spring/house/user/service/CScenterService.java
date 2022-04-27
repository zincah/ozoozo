package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.vo.CScenterVO;


public interface CScenterService {
	
	
	public List<CScenterVO> csall(CScenterVO vo);
	public List<CScenterVO> cskeyword(CScenterVO vo);
	
}

