package ozo.spring.house.seller.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	
	// product table
	private int product_id;
	private int seller_id;
	private int pro_catecode;
	private String product_title;
	private String product_uniqueimg;
	private int product_price;
	private Timestamp product_created;
	private Timestamp product_updated;
	private int pro_subcatecode;
	private int product_seller_code;
	private int product_quantity;
	
	// product_posting table
	private int post_id;
	private int post_product_id;
	private boolean today_deal;
	private boolean best_product;
	private float star_ratio;
	private String post_name;
	private int sale_ratio;
	private int whole_price;
	
	// option table
	private int option_id;
	// product_id 
	private String option1_name;
	private String option1;
	private String option2_name;
	private String option2;
	
	

}
