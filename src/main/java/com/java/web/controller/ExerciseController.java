package com.java.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.web.service.ExerciseService;
import com.java.web.vo.BasketballPositionVO;

@Controller
public class ExerciseController {
	
	@Autowired
	ExerciseService es;
	
	@RequestMapping("/exercise_recommand")
	public String exercise_recommand(HttpSession session, HttpServletResponse res) throws IOException {
		if(session.getAttribute("id") == null) {
			res.setContentType("text/html; charset=utf-8");
			res.getWriter().print("<script>alert('로그인이 필요합니다'); location.href='/';</script>");
			res.getWriter().flush();
						
		}
		return "exercise_recommand";
	}
	
	@RequestMapping("/exercise_recommand/{position_name}")
	public String exercise_recommand(HttpSession session,HttpServletRequest req ,HttpServletResponse res, @PathVariable String position_name) throws IOException {
		if(session.getAttribute("id") == null) {
			res.setContentType("text/html; charset=utf-8");
			res.getWriter().print("<script>alert('로그인이 필요합니다'); location.href='/';</script>");
			res.getWriter().flush();
		}
		BasketballPositionVO basketball =es.loadskill(position_name);
		req.setAttribute("result", basketball);
		
		return "exercise_recommand";
	}
}
