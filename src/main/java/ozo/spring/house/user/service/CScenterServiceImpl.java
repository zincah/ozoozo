package ozo.spring.house.user.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.dao.CScenterDAO;
import ozo.spring.house.user.vo.CScenterVO;

@Repository
public class CScenterServiceImpl implements CScenterService{
	
	
	@Autowired
	CScenterDAO CScenterDAO;

	@Override
	public CScenterVO getCScustomer(CScenterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CScenterVO> getCSList(CScenterVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

	

	
	
	
}
