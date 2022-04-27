package ozo.spring.house.seller.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SellerVO {
	private int seller_id;
	private int user_id;
	private String company_name;
	private String representative;
	private String address;
	private String shop_tell;
	private String email;
	private int registration_num; // 우편번호
	private Timestamp entry_date; // 입점일
}
