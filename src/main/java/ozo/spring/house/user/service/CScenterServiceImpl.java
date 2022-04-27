package ozo.spring.house.user.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.CScenterDAO;
import ozo.spring.house.user.vo.CScenterVO;

@Service("CScenterService")
public class CScenterServiceImpl implements CScenterService{
	
	
	@Autowired
	CScenterDAO CScenterDAO;
	
	//swtter
	public void setCScenterDAO(CScenterDAO CScenterDAO) {
		this.CScenterDAO = CScenterDAO;
	}

	@Override
	public List<CScenterVO> csall(CScenterVO vo) {
		return CScenterDAO.csall(vo);
		
	}

	@Override
	public List<CScenterVO> cskeyword(CScenterVO vo) {
		return CScenterDAO.cskeyword(vo);
		 
	}

	
	
	

	

	
	
	
}
