package ozo.spring.house.server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.server.dao.ServerDAO;

@Service("serverService")
public class ServerServiceImpl implements ServerService{
	
	@Autowired
	ServerDAO serverDAO;
	
	@Override
	public void serverQuartz() {
		serverDAO.updateOrderSend();
		serverDAO.updatePostingDeal();
	}
}

