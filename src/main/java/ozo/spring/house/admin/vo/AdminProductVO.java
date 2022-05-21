package ozo.spring.house.admin.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import ozo.spring.house.common.Criteria;

@Getter
@Setter
@ToString
public class AdminProductVO {
	
	// posting ����
	private int post_id;
	private String company_name;
	private String deal_status;
	private boolean best_product;
	private double star_ratio;
	private String post_name;
	private Timestamp product_created;
	private Timestamp post_created;
	private int product_count;
	private String cate_name;
	private String subcate_name;
	private String post_status;
	private int post_couponid;
	
	// seller
	private int seller_id;
	private String representative;
	private int registration_num;
	private String seller_status;
	
	// posting
	private boolean today_deal;
	
	// coupon
	private int coupon_id;
	private String coupon_title;
	private String coupon_subtitle;
	
	// ��¥ �˻�
	private Date startdate;
	private Date enddate;
	private String pack; // �˻�����
	private String keyword; // �˻��ܾ�

	// paging �־��ֱ�
	private Criteria cri;
	
	// catecode �־��ֱ� (�����ǵ�������)
	private int po_category;
	private int po_subcate;
	
	// ���� ���� payment
	private int payment;
	private int quantity;
	private int realPayment;
	private int fee;
	private int cnt;
	private int whole_price;
	private int sale_ratio;
	private long sale_price;
	
	private Timestamp deal_time;
	private Timestamp deal_endtime;

	

}
