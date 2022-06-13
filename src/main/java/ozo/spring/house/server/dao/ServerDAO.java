package ozo.spring.house.server.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("serverDAO")
public class ServerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void updateOrderSend() {
		//System.out.println("--> mybatis in serverDAO shipping update ");
		sqlSessionTemplate.update("ServerStart.shippingUpdate");
	}

	public void updatePostingDeal() {
		//System.out.println("--> mybatis in serverDAO postingDeal update");
		sqlSessionTemplate.update("ServerStart.postingDealUpdate1");
		sqlSessionTemplate.update("ServerStart.postingDealUpdate2");
	}
}
