package ozo.spring.house.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.CScenterVO;

@Repository
public class CScenterDAO {
		@Autowired
		private SqlSessionTemplate sqlsessiontemplate;
		
		
		public List<CScenterVO> csall(CScenterVO vo) {
			System.out.println("맞는데...11");
			return sqlsessiontemplate.selectList("CScenterDAO.csall",vo);
		}

		
		public List<CScenterVO> cskeyword(CScenterVO vo) {
			System.out.println("맞는데...1");
			return sqlsessiontemplate.selectList("CScenterDAO.cskeyword", vo);
		}
}
