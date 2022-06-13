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
	private int payment; //patment
	
	private int product_id;
	private int UID;
	private int quantity;
	private int shipping_fee;
	private int post_id;
	private String order_status;
	private Timestamp order_date;
	private int py_orderid;
	private int address_id;
	
	private int addr_id;
	private int coupon_id;
	private int discount;
	private int empty_int;
	private int empty_int2;
	
	private int refund_id;
}
