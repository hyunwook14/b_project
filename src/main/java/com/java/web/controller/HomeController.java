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
