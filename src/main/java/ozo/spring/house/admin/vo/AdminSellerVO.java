package ozo.spring.house.admin.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminSellerVO {
	
	private int seller_id;
	private int user_num;
	private String company_name;
	private String representative;
	private String address;
	private String shop_tel;
	private String email;
	private String registration_num;
	private Timestamp entry_date;
	private String seller_representpic;
	
	private float brandstar; // 브랜드 별점 
	

}
