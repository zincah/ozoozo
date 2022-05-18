package ozo.spring.house.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.UserScrapVO;

@Repository
public class UserScrapDAO {

	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	
	public List<UserScrapVO> u_scrap(UserScrapVO vo) {
		
		sqlsessiontemplate.selectList("UserScrapDAO.u_scrap",vo);
		return null;
	}
	
	public String u_cancle(UserScrapVO vo) {
		
		sqlsessiontemplate.delete("UserScrapDAO.u_cancle",vo);
		return null;
	}
}
