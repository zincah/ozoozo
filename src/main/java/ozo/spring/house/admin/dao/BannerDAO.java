package ozo.spring.house.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ozo.spring.house.admin.vo.BannerVO;

@Repository
public class BannerDAO {
	
	@Autowired
	private SqlSessionTemplate sessiontemplate;
	
	public List<BannerVO> b_select(BannerVO vo){
		
		return sessiontemplate.selectList("BannerDAO.b_select",vo);
		 
		
	}
	
	public void b_insert(BannerVO vo) {
		System.out.println("���ε� �ߴ� ");
		sessiontemplate.insert("BannerDAO.b_insert", vo);
		
	}
	public List<BannerVO> b_delete(BannerVO vo){
		
		
		return null;
		
	}
	
	public void b_boolean(BannerVO vo){
		System.out.println("�����߾�");
		sessiontemplate.update("BannerDAO.b_update",vo);
		
	}

	
}
