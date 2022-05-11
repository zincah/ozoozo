package ozo.spring.house.admin.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminProductVO {
	
	private int post_id;
	private boolean today_deal;
	private boolean best_product;
	private double star_ratio;
	private String post_name;
	private Timestamp product_created;
	private int product_count;
	private String cate_name;
	private String subcate_name;
	private String post_status;
	private String post_couponid;
	
	
	

}
