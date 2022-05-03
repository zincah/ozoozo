package ozo.spring.house.seller.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDetailVO {
	
	// option filtering
	private int detail_id;
	private int using_people = 0;
	private String place;
	private boolean rental;
	private boolean refurbish;
	private String color;
	private String woodtone;
	private String material;
	private int prodetails_postid;
	
	// productdetail_table
	private int table_id;
	private String table_title;
	private String table_kc;
	private String table_color;
	private String table_component;
	private String table_manufacturer;
	private String table_country;
	private String table_size;
	private String table_delivery;
	private String table_cstel;
	private int protable_postid;

	

}
