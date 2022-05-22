package ozo.spring.house;

import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml", 
		"file:src/main/webapp/WEB-INF/config/user-management.xml",
		"file:src/main/webapp/WEB-INF/config/email-context.xml" })
public class TimeTest {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@org.junit.Test
	public void insertTest() {
		System.out.println("time test");
		sqlSessionTemplate.insert("UserMainDAO.insertTest");
	}

	
}
