package ozo.spring.house.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserAddressVO {
	private int address_id;
	private String address_name;
	private String receiver;
	private String phone_num;
	private String address1;
	private String address2;
	private boolean is_default;
	private int user_num;
	
}
