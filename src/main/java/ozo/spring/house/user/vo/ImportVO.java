package ozo.spring.house.user.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ImportVO {
	private int imp_uid;
	
	private int merchant_uid;
	private int paid_amount;
	private Timestamp paid_at;
	private String pay_method;
	
	private int seller_id;
	private int price;
	private int final_price; //patment
	
	private int product_id;
	private int UID;
	private int quantity;
	private int shipfee;
	private int post_id;
	private String order_status;
	private Timestamp order_date;
	
}
