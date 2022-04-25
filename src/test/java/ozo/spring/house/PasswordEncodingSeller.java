package ozo.spring.house;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ozo.spring.house.admin.service.MemberService;
import ozo.spring.house.seller.service.SellerService;
import ozo.spring.house.seller.vo.SellerVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class PasswordEncodingSeller {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	SellerService sellerService;

	@org.junit.Test
	public void checkEncoding() {

		SellerVO vo = new SellerVO();
		
		String rawPass = "seller";
		String encodePass;
		
		encodePass = passwordEncoder.encode(rawPass);
		
		System.out.println("encoding : " + encodePass);
		System.out.println("verify : " + passwordEncoder.matches(rawPass, encodePass));
		
		vo.setSeller_code("inha");
		vo.setSeller_password(encodePass);
		
		sellerService.insertSeller(vo);
		
	}

}
