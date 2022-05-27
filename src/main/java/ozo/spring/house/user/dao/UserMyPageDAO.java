package ozo.spring.house.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.UserScrapVO;
import ozo.spring.house.user.vo.UserVO;

@Repository("userMyPageDAO")
public class UserMyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	

	//ȸ������ ����
	public UserVO mypageinfo(UserVO vo) {
		System.out.println("--> this is mybatis");
		System.out.println(vo.getUser_num());
		return sqlsessiontemplate.selectOne("UserMyPageDAO.selectUser",vo);
	}
	
	public void user_edit(UserVO vo) {
		
		sqlsessiontemplate.update("UserMyPageDAO.user_edit",vo);
	}
	public void user_urlnone(UserVO vo) {
		
		sqlsessiontemplate.update("UserMyPageDAO.user_urlnone",vo);
	}
	public void user_stop(UserVO vo) {
		
		sqlsessiontemplate.update("UserMyPageDAO.user_stop",vo);
	}
	
	// �� ��ٱ��� ��ǰ �� ���̰� �ϱ�
	public int checkCartSu(UserVO vo) {
		try {
			return sqlsessiontemplate.selectOne("UserMyPageDAO.checkCartSu", vo);
		}catch(Exception e) {
			return 0; // cart su �� 0���� return
		}
		
	}
	
	
	
}
