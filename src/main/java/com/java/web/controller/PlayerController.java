package com.java.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String player_recommand(HttpSession session) {
		if(session.getAttribute("id") == null) return "redirect:/";
		return "player_recommand";
	}
	
	@RequestMapping(value="/playerlistload", method=RequestMethod.POST)
	public void playerlistload(HttpServletResponse res) {
		try {
			res.setContentType("application/json; charset=utf-8");
			
			List<KblPlayerVO> resultlist = kps.loadplayer();
			JSONArray jary = JSONArray.fromObject(resultlist);
			
			res.getWriter().print(jary);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
