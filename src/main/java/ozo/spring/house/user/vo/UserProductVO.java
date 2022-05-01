package ozo.spring.house.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserProductVO {
	private int product_id;
	private int seller_id;
	private int product_catecode;
	private int product_subcatecode;
	private String product_title; 
	private String product_img;
	private int product_price;
	
	private String seller;
	private String product_content;
	private String product_table;
	private String product_postid;
	
	private String option;
	
	
	 // option table
	   private int option_id;
	   private int op_productid;
	   private String option1_name;
	   private String option1;
	   private String option2_name;
	   private String option2;

}
