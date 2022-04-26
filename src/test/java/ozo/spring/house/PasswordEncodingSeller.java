package ozo.spring.house;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ozo.spring.house.seller.service.SellerService;
import ozo.spring.house.seller.vo.SellerVO;
import ozo.spring.house.user.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/config/seller-management.xml" })
public class PasswordEncodingSeller {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	SellerService sellerService;

	@org.junit.Test
	public void checkEncoding() {

		SellerVO vo = new SellerVO();
		
		UserVO uvo = sellerService.userDataSeller(100002);
			
		vo.setUser_id(uvo.getUser_num());
		vo.setEmail(uvo.getUser_email());
		
		vo.setSeller_id(500001);
		vo.setCompany_name("½Ò±¹¼ö¿ùµå");
		vo.setRepresentative("½Ò±¹¼ö¸Ç");
		vo.setAddress("¾îÂ¼±¸ ÀúÂ¼±¸");
		vo.setShop_tell("010-1010-0101");
		vo.setRegistration_num(12345);;
		
		sellerService.insertSeller(vo);
		
	}

}
