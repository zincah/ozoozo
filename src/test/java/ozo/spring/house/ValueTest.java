package ozo.spring.house;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/config/seller-management.xml"})
@PropertySource("classpath:config/awss3.properties")
public class ValueTest {
	
	@Value("${access_key}")
	private String key;
	
	@Test
	public void printvalue() {
		System.out.println(key);
	}

}
