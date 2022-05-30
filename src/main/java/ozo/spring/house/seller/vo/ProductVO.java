package ozo.spring.house.seller.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import ozo.spring.house.common.Criteria;

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
	private int product_postid; //postid�� ����
	
	// product_status table
	private int status_id;
	private int st_product_id;
	private String status;
	private boolean product_del;
	
	// product_posting table
	private int post_id;
	private boolean today_deal; //boolean�� getter�� get�� �ƴ� is, setter�� set
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
	private String sc_searchName; // �˻���
	private String sc_searchNameStatus; // �˻��� ���� �����ڽ� ��
	private ArrayList<String> sc_searchStatus; // �ǸŻ��� üũ�ڽ� ��
	private int sc_category; // ��з�
	private int sc_middleSelect; // �ߺз�
	private int sc_smallSelect; // �Һз�
	private String sc_selectDate; // �Ⱓ ���� ����Ʈ�ڽ� ��
	private Date sc_startDate; // ���۳�¥
	private Date sc_endDate; // ���ᳯ¥
	
	//user order
	private int order_id; // �ֹ���ȣ
	private int quantity; // ����
	private String order_status; // �ֹ�����
	private Timestamp confirm_date; // ����Ȯ������
	private Timestamp order_date; // �ֹ�����
	private String memo; // ��۸޸�
	// product_id(��ǰ���̵�)�� ��ܿ� ������
	private int user_num; // ȸ�����̵�
	// seller_id(�Ǹ��ھ��̵�)�� ��ܿ� ������
	private int order_num; // �׷��ֹ���ȣ
	private int shipping_fee; // ��ۺ�
	private int payment; // �����ݾ�
	// address_id(���������Ű)�� �ϴܿ� ������
	private String delivery; // �ù�ȸ��
	private int invoice_number; // �����ȣ
	private int od_postid; // postid ���� Ű
	private Timestamp shipfinish_date; // ��ۿϷᳯ¥
	private Timestamp shipstart_date; // ��۽��۳�¥
	private String refund_id; // ȯ�� ��� order_id
	
	//payment
	private int payment_id; // �������̵�
	private int pay_ordernum; // �׷��ֹ���ȣ (serial4)
	private String payment_way; // ��������
	private String payment_info; // ��������
	private int payment_total; // �����ݾ�
	private int py_sellerid; // �Ǹ��� ���̵�
	private int py_couponid; // ����� �����ڵ�
	private int py_usepoint; // ��� ����Ʈ
	private int py_discount; // ���αݾ� (����� �����ڵ��� �ݾ� + ��� ����Ʈ)
	private int py_final; // ���� �����ݾ� (�����ݾ� - ���αݾ�)
	
	//address
	private int address_id; // �����PK
	private String address_name; // �������
	private String receiver; // �����θ�
	private String phone_num; // ������ ����ó
	private String address1; // �ּ�
	private String address2; // ���ּ�
	private boolean addr_default; // �⺻���������
	// user_num(ȸ����ȣ)�� ��ܿ� ������.
	
	//user table
	// user_num(ȸ����ȣ)�� ��ܿ� ������.
	private String user_email; // ���� �̸���
	private String nickname; // ���� �г���
	private String user_birth; // ���� ����
	private boolean gender; // ���� ����
	// �ϴ� �ʿ��Ѱ͸� ������
	
	
	// ���� ����Ʈ ��ȸ
	private Timestamp sales_date; // ��¥
	private Date sales_dateString; // ��¥(Date ��)
	private int sales_paymentTotal; // �����ݾ�
	private int sales_paymentTotalNum; // �����Ǽ� 
	private int sales_canclePaymentTotal; // ��ұݾ�
	private int sales_canclePaymentTotalNum; // ��ҰǼ�
	private int sales_submitPaymentTotal; // ����ݾ�
	private int sales_submitPaymentTotalNum; // ����Ǽ�
	private int sales_discount; // ���αݾ�
	private int sales_shippingFee; // ��ۺ�
	private int sales_final; // �Ǹ�����
	
	// barChart ������ ��¿�
	private Timestamp sales_startDate; // ���۳�¥
	private Timestamp sales_endDate; // ���ᳯ¥
	private int sales_count; // �Ǹŷ�
	
	// index ������ ��¿�
	private int index_1; // �����Ϸ� ��
	private int index_2; // ����Ȯ�� ��
	private int index_3; // ����غ��� ��
	private int index_4; // ����� ��
	private int index_5; // ��ۿϷ� ��
	private int index_6; // �űԿ�û ��
	private int index_7; // ��ҿ�û ��
	private int index_8; // ��ǰ��û ��
	private int index_9; // ��ȯ��û ��
	private int index_10; // ����Ǽ� ��
	private int index_11; // ����ݾ� ��
	
	// paging �־��ֱ�
	private Criteria cri;
}
