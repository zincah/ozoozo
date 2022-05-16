package ozo.spring.house.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import ozo.spring.house.user.service.UserService;

@Controller
public class UserPaymentController {
	@Autowired
	UserService userservice;
}
