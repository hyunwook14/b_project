package com.java.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.web.service.KblPlayerService;

@Controller
public class HomeController {
	
	@Autowired
	SqlSession session;
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/exercise_recommand")
	public String exercise_recommand() {
		return "exercise_recommand";
	}
	
	@RequestMapping("/myinfo")
	public String myinfo(HttpSession session) {
		if(session.getAttribute("id") == null) return "redirect:/";
		return "/myinfo";
	}
	
	
}
