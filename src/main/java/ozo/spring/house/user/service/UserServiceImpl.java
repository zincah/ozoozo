package ozo.spring.house.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ozo.spring.house.user.dao.CScenterDAO;
import ozo.spring.house.user.dao.UserDAO;
import ozo.spring.house.user.dao.UserDAO.cart_Allload;
import ozo.spring.house.user.dao.UserDAO.paymentLog_cls;
import ozo.spring.house.user.dao.UserDAO.payment_class;
import ozo.spring.house.user.dao.UserDAO.product_cls;
import ozo.spring.house.user.vo.CScenterVO;
import ozo.spring.house.user.vo.CartVO;
import ozo.spring.house.user.vo.UserProductVO;
import ozo.spring.house.user.vo.UserProduct_tableVO;
import ozo.spring.house.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	// set method
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	@Override
	public UserVO checkUser(UserVO vo) {
		return userDAO.checkUser(vo);
	}

	@Override
	public Boolean Duplicate_Check_Email(UserVO vo) {
		return userDAO.Duplicate_Check_Email(vo);
	}

	@Override
	public Boolean Duplicate_Check_Nickname(UserVO vo) {
		return userDAO.Duplicate_Check_Nickname(vo);
	}

	@Override
	public void change_pass(UserVO vo) {
		userDAO.change_pass(vo);
	}

	@Override
	public List<UserProductVO> productGet(UserProductVO vo) {
		return userDAO.product_Get(vo);
	}

	@Override
	public List<UserProductVO> productGet_option(UserProductVO vo) {
		return userDAO.product_Get_option(vo);
	}

	@Override
	public List<UserProductVO> productGet_img(UserProductVO vo) {
		return userDAO.product_Get_img(vo);
	}

	@Override
	public UserProduct_tableVO productGet_table(UserProduct_tableVO tvo) {
		return userDAO.product_Get_table(tvo);
	}

	@Override
	public boolean basket_add(List<UserProductVO> vo, UserVO uvo) {
		return userDAO.basket_add(vo,uvo);
	}

	@Override
	public cart_Allload get_cart_class(CartVO vo) {
		return userDAO.get_cart_class(vo);
	}

	@Override
	public payment_class get_payment_class() {
		return userDAO.get_payment_class();
	}

	@Override
	public paymentLog_cls get_Log_class() {
		return userDAO.get_paymentLog_class();
	}

	@Override
	public product_cls get_product_class() {
		// TODO Auto-generated method stub
		return userDAO.get_productDetail_class();
	}

	@Override
	public UserVO checkUserByNaver(UserVO vo) {
		return userDAO.checkUserByNaver(vo);
	}

	@Override
	public void lastLoginCheck(UserVO vo) {
		userDAO.lastLoginCheck(vo);
	}
	//Service Senter
	@Autowired
	CScenterDAO CScenterDAO;
	
	//swtter
	public void setCScenterDAO(CScenterDAO CScenterDAO) {
		this.CScenterDAO = CScenterDAO;
	}

	@Override
	public List<CScenterVO> csall(CScenterVO vo) {
		return CScenterDAO.csall(vo);
		
	}

	@Override
	public List<CScenterVO> cskeyword(CScenterVO vo) {
		return CScenterDAO.cskeyword(vo);
		 
	}

	
}
