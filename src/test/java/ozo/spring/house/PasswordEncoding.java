package ozo.spring.house;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ozo.spring.house.admin.service.MemberService;
import ozo.spring.house.admin.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:security-config.xml", "classpath:applicationContext.xml" })
public class PasswordEncoding {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	MemberService memberService;

	@org.junit.Test
	public void checkEncoding() {

		MemberVO vo = new MemberVO();
		
		String rawPass = "admin";
		String encodePass;
		
		encodePass = passwordEncoder.encode(rawPass);
		
		System.out.println("encoding : " + encodePass);
		System.out.println("verify : " + passwordEncoder.matches(rawPass, encodePass));
		
		vo.setAdmin_code("zinc");
		vo.setAdmin_password(encodePass);
		
		memberService.insertAdmin(vo);
		
	}

}
