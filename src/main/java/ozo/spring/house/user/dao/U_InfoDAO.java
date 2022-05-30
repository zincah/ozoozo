package ozo.spring.house.user.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import ozo.spring.house.user.vo.UserVO;

@Repository("infoDAO")
public class U_InfoDAO {
	private String encodePass;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	public void insertUser(UserVO vo) {
		System.err.println("[Log] --- info DAO >>>>> insertUser Method");

		encodePass = passwordEncoder.encode(vo.getUser_pw());
		vo.setUser_pw(encodePass);
		sqlSessionTemplate.insert("UserDAO.insertUser", vo);

		System.out.println("[LOGO] : insert success");
	}

	// login
	public UserVO checkUser(UserVO vo) {
		System.err.println("[Log] --- info DAO >>>>> checkUser Method");

		try {
			String status = sqlSessionTemplate.selectOne("UserDAO.checkMemberStatus", vo);
			if (status.equals("비활동중")) {
				return null;
			} else {
				UserVO user = (UserVO) sqlSessionTemplate.selectOne("UserDAO.checkUser", vo);

				if (passwordEncoder.matches(vo.getUser_pw(), user.getUser_pw())) {
					return user;
				} else {
					return null;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// naver login
	public UserVO checkUserByNaver(UserVO vo) {
		System.err.println("[Log] --- info DAO >>>>> checkUserByNaver Method");
		return sqlSessionTemplate.selectOne("UserDAO.checkUserByNaver", vo);
	}

	// 마지막 로그인 체크
	public void lastLoginCheck(UserVO vo) {
		System.err.println("[Log] --- info DAO >>>>> lastLoginCheck Method");
		sqlSessionTemplate.update("UserDAO.lastLoginCheck", vo);

		System.out.println("회원 넘버 : " + vo.getUser_num());
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = simpleDateFormat.format(date);

		vo.setLogin_date(java.sql.Date.valueOf(formattedDate));
		UserVO user = sqlSessionTemplate.selectOne("UserDAO.selectLoginCount", vo);

		if (user == null) {
			System.out.println("insert");
			sqlSessionTemplate.insert("UserDAO.insertLoginCount", vo);
		}
	}

	public Boolean Duplicate_Check_Email(UserVO vo) {
		System.err.println("[Log] --- info DAO >>>>> Duplicate_Check_Email Method");
		UserVO user = (UserVO) sqlSessionTemplate.selectOne("UserDAO.Duplicate_Check_Email", vo);
		// System.out.println(user);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}

	public Boolean Duplicate_Check_Nickname(UserVO vo) {
		System.err.println("[Log] --- info DAO >>>>> Duplicate_Check_Nickname Method");
		UserVO user = (UserVO) sqlSessionTemplate.selectOne("UserDAO.Duplicate_Check_Nickname", vo);
		// System.out.println("select 검색 결과 " + user);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}

	public void change_pass(UserVO vo) {
		System.err.println("[Log] --- info DAO >>>>> change_pass Method");
		encodePass = passwordEncoder.encode(vo.getUser_pw());
		vo.setUser_pw(encodePass);
		sqlSessionTemplate.update("UserDAO.change_pass", vo);
	}
}
