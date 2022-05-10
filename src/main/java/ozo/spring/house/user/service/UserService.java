package ozo.spring.house.user.service;

import java.util.List;

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
}
