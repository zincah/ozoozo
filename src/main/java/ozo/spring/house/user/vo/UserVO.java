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
	
	// ���� �����Ǿ����� ��¥�� �־�� �ҵ� 
	// ȸ���� �޸�������� �ƴ��� ǥ������ �ʵ尡 �־�� �ҵ�
	
}
