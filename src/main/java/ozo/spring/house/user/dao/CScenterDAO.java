package ozo.spring.house.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.CScenterVO;

@Repository("CScenterDAO")
public class CScenterDAO {
		@Autowired
		private SqlSessionTemplate sqlsessiontemplate;
		
		
		public List<CScenterVO> getCScustomer(CScenterVO vo) {
			
		
			return sqlsessiontemplate.selectList("CScenterDAO.csall",vo);
		}

		
		public List<CScenterVO> getCSList(CScenterVO vo) {
			
			return sqlsessiontemplate.selectList("CScenterDAO.cskeyword", vo);
		}
}
