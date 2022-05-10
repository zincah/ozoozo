package ozo.spring.house.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserProduct_tableVO {
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
	
	private int table_id;
	private int protable_postid;
}
