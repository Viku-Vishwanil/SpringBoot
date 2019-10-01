package com.vikash.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.vikash.model.User;
import com.vikash.services.UserService;


@Controller
public class ApplicationController 
{
	@Autowired
	UserService userService;
	
	@RequestMapping("/Welcome")
	public String Welcome(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}

	@RequestMapping("/register")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		return "welcomepage";
	}

	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {
		userService.saveMyUser(user);
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}

	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "welcomepage";
	}
	
	@RequestMapping ("/login-user")
	public String loginUser(@ModelAttribute User user, HttpServletRequest request) {
		if(userService.findByUsernameAndPassword(user.getUsername(), user.getPassword())!=null) {
			return "homepage";
		}
		else {
			request.setAttribute("error", "Invalid Username or Password");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";
			
		}
	}
}
