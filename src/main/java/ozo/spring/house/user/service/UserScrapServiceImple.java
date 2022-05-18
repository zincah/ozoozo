package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.UserScrapDAO;
import ozo.spring.house.user.vo.ScrapVO;
import ozo.spring.house.user.vo.UserScrapVO;

@Service("userScrapService")
public class UserScrapServiceImple implements UserScrapService {

	
	@Autowired
	UserScrapDAO userscrapdao;
	
	
	
	public void getUserscrapdao(UserScrapDAO userscrapdao ) {
		
			this.userscrapdao = userscrapdao;
	}

	
	@Override
	public List<ScrapVO> s_scrap(ScrapVO vo) {
	
		
		return userscrapdao.s_scrap(vo);
	}

	
	@Override
	public void s_cancle(UserScrapVO vo) {
		
		userscrapdao.s_cancle(vo);
	}



	@Override
	public void s_insert(UserScrapVO vo) {
		
		userscrapdao.s_insert(vo);
	}

	
	
}
