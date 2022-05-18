package ozo.spring.house.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.ScrapVO;
import ozo.spring.house.user.vo.UserScrapVO;

@Repository
public class UserScrapDAO {

	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	
	public List<ScrapVO> s_scrap(ScrapVO svo) {
		
		
		return sqlsessiontemplate.selectList("UserScrapDAO.s_scrap",svo);
	}
	
	public void s_cancle(UserScrapVO vo) {
		
		 sqlsessiontemplate.delete("UserScrapDAO.s_cancle",vo);
		 
	}
	
	//½ºÅ©·¦ 
	public void s_insert(UserScrapVO vo) {
			
		sqlsessiontemplate.insert("UserScrapDAO.s_insert",vo);
			
	}
}
