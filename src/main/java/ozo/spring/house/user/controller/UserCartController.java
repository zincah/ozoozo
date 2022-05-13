package ozo.spring.house.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ozo.spring.house.user.service.UserService;

@Controller
public class UserCartController {
	@Autowired
	UserService userservice;
	
	
}
