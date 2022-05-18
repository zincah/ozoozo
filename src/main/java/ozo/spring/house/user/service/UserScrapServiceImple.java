package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.UserScrapDAO;
import ozo.spring.house.user.vo.UserScrapVO;

@Service("userScrapService")
public class UserScrapServiceImple implements UserScrapService {

	
	@Autowired
	UserScrapDAO userscrapdao;
	
	
	
	public void getUserscrapdao(UserScrapDAO userscrapdao ) {
		
			this.userscrapdao = userscrapdao;
	}

	
	@Override
	public List<UserScrapVO> u_scrap(UserScrapVO vo) {
	
		
		return userscrapdao.u_scrap(vo);
	}

	
	@Override
	public void u_cancle(UserScrapVO vo) {
		
		userscrapdao.u_cancle(vo);
	}

	
	
}
