package ozo.spring.house.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class ReviewVO {

    private int review_id;
    private int reuser_num;
    private int reproduct_id;
    private int reseller_id;
    private int rating;
    private String review_image;
    private String recontent;
    private int liked;
    private boolean status;
    private Timestamp created_at;
    private int repost_id;
    
    // order table 처리
    private int order_id;
    private boolean review_status; // 이거 몰랑룽

    // review 수정
    private String last_review_image;
    
    // review 
    private String nickname; // 유저 닉네임
    private String user_img; // 유저 사진
    
    // option
    private String option1_name;
    private String option2_name;
    private String option1;
    private String option2;

}
