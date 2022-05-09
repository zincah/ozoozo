package ozo.spring.house.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.UserCategoryVO;

@Repository
public class UserCategoryDAO {
	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	
	
   public List<UserCategoryVO> m_category(UserCategoryVO vo) {
      
      System.out.println("���� ");
      return sqlsessiontemplate.selectList("UserCategoryDAO.m_category",vo);
   }
   public List<UserCategoryVO> s_category(UserCategoryVO vo) {
      
      System.out.println("���� ");
      return sqlsessiontemplate.selectList("UserCategoryDAO.s_category",vo);
   }
   public List<UserCategoryVO> b_category(UserCategoryVO vo) {
      
      System.out.println("����  ");
      return sqlsessiontemplate.selectList("UserCategoryDAO.b_category",vo);
   }


}
