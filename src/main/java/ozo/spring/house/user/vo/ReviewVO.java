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
    
    // order table ó??
    private int order_id;
    private boolean review_status; // ?̰? ??????

    // review ????
    private String last_review_image;
    
    // review 
    private String nickname; // ???? ?г???
    private String user_img; // ???? ????
    
    // option
    private String option1_name;
    private String option2_name;
    private String option1;
    private String option2;

}
