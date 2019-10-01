package com.java.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.web.service.CharacterService;
import com.java.web.vo.BasketballPositionVO;
import com.java.web.vo.UserCharacterVO;

import net.sf.json.JSONArray;

@Controller
public class UserCharacterController {
	
	@Autowired
	CharacterService cs;
	
	//신체정보등록페이지
	@RequestMapping("/bodyinfo_register")
	public String bodyinfo_register(HttpSession session) {
		if(session.getAttribute("id") ==null) return "redircet:/";
		return "bodyinfo_register";
	}
	//신체정보등록
	@RequestMapping(value="/register_bodyinfo", method=RequestMethod.POST)
	public void register_bodyinfo(UserCharacterVO character, HttpServletResponse res, HttpSession session) {
		try {
			System.out.println(character.toString());
			int result = cs.create(character, session);
			res.setContentType("text/html; charset=utf-8");
			res.getWriter().print(result+"");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//main페이지 신체정보불러오기
	@RequestMapping(value="/selectbodyinfo", method=RequestMethod.POST)
	public void selectbodyinfo(HttpSession session, HttpServletResponse res) {
		try {
			res.setContentType("application/x-www-form-urlencoded; charset=utf-8");
			
			List<UserCharacterVO> characterlist =cs.select(session);
			JSONArray jarry = JSONArray.fromObject(characterlist);
			res.getWriter().print(jarry);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//포지션추천 키별로
	@RequestMapping(value="/position_recommand", method=RequestMethod.POST)
	public void position_recommand(HttpServletRequest req, HttpServletResponse res) {
		try {
			res.setContentType("application/x-www-form-urlencoded; charset=utf-8");
			
			List<BasketballPositionVO> positionlist =cs.positionselect(req);
			JSONArray jarry = JSONArray.fromObject(positionlist);
			res.getWriter().print(jarry);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}