package ozo.spring.house.user.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import ozo.spring.house.common.Criteria;

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
	private Timestamp last_login;
	private Timestamp join_date;
	private String user_status;
	private String user_type;
	
	// ���� �����Ǿ����� ��¥�� �־�� �ҵ� 
	// ȸ���� �޸�������� �ƴ��� ǥ������ �ʵ尡 �־�� �ҵ�
	
	private Date startdate;
	private Date enddate; // ���� ������ �˾Ƴ��� ���� ��¥
	
	private String pack; // user table �˻� package
	private String keyword;
	
	// ���� �����α� ����
	private Date login_date;
	private int lc_usernum;
	private int count;
	
	// paging
	private Criteria cri;

}
