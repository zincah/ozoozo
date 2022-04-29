package ozo.spring.house.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ozo.spring.house.user.service.ReviewService;
import ozo.spring.house.user.vo.ReviewVO;

import java.util.List;

@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @RequestMapping(value = "/userreview.com")
    public String user_Review(Model model, ReviewVO vo){
        List<ReviewVO> list;
        vo.setUser_num(100004);
        list = reviewService.myReviewList(vo);

        for(int i=0; i<list.size(); i++){
            ReviewVO review = list.get(i);
            System.out.println(review.getContent());
            System.out.println(review.getUser_num());
            System.out.println(review.getCreated_at());
        }
        model.addAttribute("list", list);

        return "myReview-view";
    }
}
