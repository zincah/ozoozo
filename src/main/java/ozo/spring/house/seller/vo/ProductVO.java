package ozo.spring.house.seller.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	
	// product table
	private int product_id;
	private int seller_id;
	private int pro_catecode;
	private String product_title;
	private String product_uniqueimg;
	private int product_price;
	private Timestamp product_created;
	private Timestamp product_updated;
	private int pro_subcatecode;
	private String product_seller_code;
	private int product_quantity;
	private int product_postid; //postid와 연결
	
	// product_status table
	private int status_id;
	private int st_product_id;
	private String status;
	private boolean product_del;
	
	// product_posting table
	private int post_id;
	private boolean today_deal; //boolean은 getter가 get이 아닌 is, setter는 set
	private boolean best_product;
	private float star_ratio;
	private String post_name;
	private int sale_ratio;
	private int whole_price;
	private String post_content;
	private String shipping_info1;
	private String shipping_info2;
	private String refund_content;
	private int post_sellerid;
	private int po_category;
	private int po_subcate;
	private String post_status;
	private int post_couponid;
	private Timestamp post_created;
	private int post_shipfee;
	
	private String cate_name;
	
	// deal info
	private int deal_id;
	private int deal_postid;
	private int deal_originprice;
	private int deal_saleratio;
	private int deal_saleprice;
	private int deal_sellerid;
	private String deal_status;
	private Timestamp deal_time;
	private Timestamp deal_endtime;
	
	// option table
	private int option_id;
	private int op_productid;
	private String option1_name;
	private String option1;
	private String option2_name;
	private String option2;
	
	// product_detail
	private int detail_id;
	private String detail_content;
	private String detail_table;
	private int prodetail_postid;
	
	// product_photo
	private int photo_id;
	private String photo_url;
	private Timestamp photo_uploaddate;
	private int photo_seq;
	private boolean photo_separate;
	private int photo_postid;
	
	private String category_name;
	
	// product search
	private String sc_searchName; // 검색어
	private String sc_searchNameStatus; // 검색어 조건 라디오박스 값
	private ArrayList<String> sc_searchStatus; // 판매상태 체크박스 값
	private int sc_category; // 대분류
	private int sc_middleSelect; // 중분류
	private int sc_smallSelect; // 소분류
	private String sc_selectDate; // 기간 조건 셀렉트박스 값
	private Date sc_startDate; // 시작날짜
	private Date sc_endDate; // 종료날짜
	
	//user order
	private int order_id; // 주문번호
	private int quantity; // 수량
	private String order_status; // 주문상태
	private Timestamp confirm_date; // 구매확정일자
	private Timestamp order_date; // 주문일자
	private String memo; // 배송메모
	// product_id(상품아이디)는 상단에 선언함
	private int user_num; // 회원아이디
	// seller_id(판매자아이디)는 상단에 선언함
	private int order_num; // 여러개 주문시 그룹주문번호
	private int shipping_fee; // 배송비
	private int payment; // 결제금액
	private String delivery; // 택배회사
	private int invoice_number; // 송장번호
	
	//payment
	private int payment_id; // 결제아이디
	private int pay_ordernum; // 그룹주문번호 (serial4)
	private String payment_way; // 결제수단
	private String payment_info; // 결제정보
	private int payment_total; // 총 결제금액
	
	//address
	private int address_id; // 배송지PK
	private String address_name; // 배송지명
	private String receiver; // 수취인명
	private String phone_num; // 수취인 연락처
	private String address1; // 주소
	private String address2; // 상세주소
	private boolean addr_default; // 기본배송지여부
	// user_num(회원번호)은 상단에 선언함.
	
	//user table
	// user_num(회원번호)은 상단에 선언함.
	private String user_email; // 유저 이메일
	private String nickname; // 유저 닉네임
	private String user_birth; // 유저 생일
	private boolean gender; // 유저 성별
	// 일단 필요한것만 선언함
}
