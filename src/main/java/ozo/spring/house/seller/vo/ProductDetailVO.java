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
	private String detail_name;
	private int detail_value;
	private int dtop_catecode;
	private int dprodetails_postid;
	
	// productdetail_table
	private int table_id;
	private String table_title;
	private String table_kc;
	private String table_color;
	private String table_component;
	private String table_material;
	private String table_manufacturer;
	private String table_country;
	private String table_size;
	private String table_delivery;
	private String table_qa;
	private String table_cstel;
	private int protable_postid;
	private String shiptable_info;
	private String shiptable_fee;
	private String shiptable_plusfee;
	private String shiptable_unable;
	private String shiptable_propotionalfee;
	private String refundtable_fee;
	private String exchangetable_fee;
	private String refundtable_address;
	

}
