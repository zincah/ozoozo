package ozo.spring.house.user.service;

import java.util.List;

import ozo.spring.house.user.dao.UserDAO.cart_Allload;
import ozo.spring.house.user.dao.UserDAO.paymentLog_cls;
import ozo.spring.house.user.dao.UserDAO.payment_class;
import ozo.spring.house.user.dao.UserDAO.product_cls;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserProduct_tableVO;
import ozo.spring.house.user.vo.UserVO;

public interface UserService {
	public Boolean Duplicate_Check_Nickname(UserVO vo);
	public Boolean Duplicate_Check_Email(UserVO vo);
	public void insertUser(UserVO vo);
	public UserVO checkUser(UserVO vo);
	public void change_pass(UserVO vo);
	public List<UserProductVO> productGet(UserProductVO vo);
	public List<UserProductVO> productGet_option(UserProductVO vo);
	public List<UserProductVO> productGet_img(UserProductVO vo);
	public UserProduct_tableVO productGet_table(UserProduct_tableVO tvo);
	public boolean basket_add(List<UserProductVO> vo, UserVO uvo);
	//장바구니
	public cart_Allload get_cart_class(CartVO vo);
	public payment_class get_payment_class();
	public paymentLog_cls get_Log_class();
	public product_cls get_product_class();
}
