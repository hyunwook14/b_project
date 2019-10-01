package com.java.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	
	@RequestMapping("/home")
	public String home() {
		return "home";
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
	
	
	@RequestMapping("/player_recommand")
	public String player_recommand() {
		return "player_recommand";
	}
	
	@RequestMapping("/exercise_recommand")
	public String exercise_recommand() {
		return "exercise_recommand";
	}
}
