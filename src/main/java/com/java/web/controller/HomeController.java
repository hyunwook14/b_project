package com.java.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/c_user")
	public String c_user() {
		return "c_user";
	}
	
	@RequestMapping("/m_record")
	public String m_record() {
		return "m_record";
	}
	
	@RequestMapping("/m_list")
	public String m_list() {
		return "m_list";
	}
	
	@RequestMapping("/m_detail")
	public String m_detail() {
		return "m_detail";
	}
	
	@RequestMapping("/main")
	public String main(){
		return "main";
	}
	
	@RequestMapping("/bodyinfo_register")
	public String bodyinfo_register() {
		return "bodyinfo_register";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	@RequestMapping("/player_recommand")
	public String player_recommand() {
		return "player_recommand";
	}
	
}
