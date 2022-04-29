package ozo.spring.house.user.controller;

import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import ozo.spring.house.user.service.ReviewService;
import ozo.spring.house.user.vo.ReviewVO;

import static org.junit.Assert.*;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/config/user-management.xml","file:src/main/webapp/WEB-INF/config/email-context.xml" })
public class ReviewControllerTest extends TestCase {

    @Autowired
    ReviewService reviewService;

    @Test
    public void insertreview() {

        ReviewVO vo = new ReviewVO();

        vo.setUser_num(100004);
        vo.setProduct_id(3);
        vo.setSeller_id(500001);
        vo.setRating(1);
        vo.setContent("녕세요");
        vo.setRv_catecode(2);
        vo.setRv_subcatecode(10003);

        reviewService.insertview(vo);
    }


}
