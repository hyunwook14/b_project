package com.java.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
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
	public String exercise_recommand(HttpSession session, HttpServletResponse res) throws IOException {
		if(session.getAttribute("id") == null) {
			res.setContentType("text/html; charset=utf-8");
			res.getWriter().print("<script>alert('로그인이 필요합니다'); location.href='/';</script>");
			res.getWriter().flush();
						
		}
		return "exercise_recommand";
	}
	
	@RequestMapping("/myinfo")
	public String myinfo(HttpSession session, HttpServletResponse res) throws IOException {
		if(session.getAttribute("id") == null) {
			res.setContentType("text/html; charset=utf-8");
			res.getWriter().print("<script>alert('로그인이 필요합니다'); location.href='/';</script>");
			res.getWriter().flush();
		}
		return "/myinfo";
	}
	
	
}
