package ozo.spring.house.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import ozo.spring.house.admin.service.AdminProductManageService;

@Controller
public class AdminProductManageController {
	
	@Autowired
	AdminProductManageService productService;
	
	

}
