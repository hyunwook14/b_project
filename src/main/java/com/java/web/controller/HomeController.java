package com.java.web.controller;

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
	
	@RequestMapping("/m_detail")
	public String m_detail() {
		return "m_detail";
	}
	
	@RequestMapping("/exercise_recommand")
	public String exercise_recommand() {
		return "exercise_recommand";
	}
	
	
}
