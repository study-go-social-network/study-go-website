package com.teamnine.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.teamnine.bean.Admin;
import com.teamnine.service.AdminService;

@Controller
@RequestMapping("adminController")
@SessionAttributes(value="adminList")
public class AdminController {

	@Autowired
	AdminService adminService;
	@Autowired
	ForumController forumController;
	@Autowired
	UserController userController;
	
	List<Admin> list=new ArrayList<Admin>();
	
	/**
	 * Admin login validation
	 * @param admin
	 * @param map
	 * @return
	 */
	@RequestMapping("getLogin")
	public String getLogin(Admin admin, Map<Object, Object> map) {

		System.out.println(admin);
		
		// Query admin
		list=adminService.getAdmin(admin);
		String str=list.toString();
		
		System.out.println(list);

		if (!str.equals("[]")) {

			map.put("adminList", list.get(0));
			forumController.getForum(map);
			userController.getUser(map);
			
			return "redirect:/admin/index.jsp"; // redirect
		} else {

			return "redirect:/admin/index.jsp"; // redirect
		}
	}
	
	/**
	 * Admin registration
	 * @param admin
	 * @param map
	 * @return
	 */
	@RequestMapping("/setSignUp")
	public String setSignUp(Admin admin, Map<Object, Object> map) {
		
		if(adminService.getAdminName(admin).toString().equals("[]")) {
			
			// Add admin
			adminService.setAdmin(admin);
			
			// Query admin (get the signed up admin)
			list=adminService.getAdmin(admin);
			
			map.put("adminList", list.get(0));
			
			System.out.println("Registration Successful");
			
			return "admin";
		}else {
			
			System.err.println("Registration Failed");
			return "redirect:/admin/index.jsp"; // redirect
		}
			
	}
	
	/**
	 * Admin logout
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("/adminExit")
	public String adminExit(Map<Object, Object> map) {

		map.put("adminList", "");
		return "redirect:/admin/index.jsp"; // redirect
	}
	
	
	
	
}
