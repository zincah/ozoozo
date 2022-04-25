package ozo.spring.house.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	
	private int user_num;
	private String user_email;
	private String user_pw;
	private String nickname;
	private String user_birth;
	private Boolean gender;
	private String user_img;
	private String user_page;
	private String comment;
	private int reccode;
	
	// 언제 생성되었는지 날짜가 있어야 할듯 
	// 회원이 휴면계정인지 아닌지 표시해줄 필드가 있어야 할듯
	
}
