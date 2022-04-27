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
    private int user_num;
    private int product_id;
    private int seller_id;
    private int rating;
    private String review_image;
    private String content;
    private int liked;
    private boolean status;
    private Timestamp created_at;
    private int rv_catecode;
    private int rv_subcatecode;

}
