package com.java.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.web.service.KblPlayerService;
import com.java.web.vo.KblPlayerVO;

import net.sf.json.JSONArray;

@Controller
public class PlayerController {
	
	@Autowired
	KblPlayerService kps;
	
	@RequestMapping("/player_recommand")
	public String player_recommand(HttpSession session, HttpServletResponse res) throws IOException {
		if(session.getAttribute("id") == null) {
			res.setContentType("text/html; charset=utf-8");
			res.getWriter().print("<script>alert('로그인이 필요합니다'); location.href='/';</script>");
			res.getWriter().flush();
		}
		return "player_recommand";
	}
	
	@RequestMapping("/player_recommand/{name}")
	public String player_recommand(HttpSession session, @PathVariable String name, HttpServletRequest req) {
		if(session.getAttribute("id") == null) return "redirect:/";
		
		return "player_recommand";
	}
	
	@RequestMapping(value="/playerlistload", method=RequestMethod.POST)
	public void playerlistload(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		try {
			res.setContentType("application/json; charset=utf-8");
			List<KblPlayerVO> resultlist = kps.loadplayer(req);
			int totalpage = kps.pagenumber();
			JSONArray jary = JSONArray.fromObject(resultlist);
			jary.add(jary.size(), totalpage);
			res.getWriter().print(jary);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value ="/recommandlist", method=RequestMethod.POST)
	public void recommandlist(HttpServletRequest req, HttpServletResponse res) throws IOException {
		JSONArray jarry = kps.recommend(req);
		res.setContentType("application/json; charset=utf-8");
		res.getWriter().print(jarry);
		
	}
	
}
