package com.java.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.web.service.MatchrecordService;
import com.java.web.vo.GamelistrecordVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MatchrecordController {
	
	@Autowired
	MatchrecordService mrs;
	
	@RequestMapping("/m_record")
	public String m_record(HttpSession session) {
		if(session.getAttribute("id") == null) return "redirect:/";
		return "m_record";
	}
	
	@RequestMapping("/m_list")
	public String m_list(HttpSession session) {
		if(session.getAttribute("id") == null) return "redirect:/";
		return "m_list";
	}
	
	@RequestMapping(value="/recordsave", method=RequestMethod.POST)
	public void recordsave( HttpServletRequest req, HttpServletResponse res ) {
		try {
			int result =mrs.saverecord(req);
			
			res.getWriter().print(result+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/loadgamelist", method=RequestMethod.POST)
	public void loadgamelist(HttpServletResponse res){
		try {
			List<HashMap<String,String>> result =mrs.loadgamelist();
			JSONArray jarry = JSONArray.fromObject(result);
			res.setContentType("application/json; charset=utf-8");
			res.getWriter().println(jarry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
