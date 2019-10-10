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
import com.java.web.vo.GamelistrecordVO;
import com.java.web.vo.UserCharacterVO;

import net.sf.json.JSONArray;

@Controller
public class UserCharacterController {
	
	@Autowired
	CharacterService cs;
	
	//신체정보등록페이지
	@RequestMapping("/bodyinfo_register")
	public String bodyinfo_register(HttpSession session) {
		if(session.getAttribute("id") ==null) return "redirect:/";
		return "bodyinfo_register";
	}
	//신체정보등록
	@RequestMapping(value="/register_bodyinfo", method=RequestMethod.POST)
	public void register_bodyinfo(UserCharacterVO character, HttpServletResponse res, HttpSession session) {
		try {
			System.out.println(character.toString());
			int result = cs.create(character, session);
			int update = cs.characterupdate();
			System.out.println("result: "+result);
			System.out.println("update:"+ update);
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
	public void position_recommand(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		try {
			res.setContentType("application/x-www-form-urlencoded; charset=utf-8");
			
			List<BasketballPositionVO> positionlist =cs.positionselect(req, session);
			JSONArray jarry = JSONArray.fromObject(positionlist);
			res.getWriter().print(jarry);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//케릭터 정보로 시합경기 리스트가져오기
	@RequestMapping(value="/mymatchlist", method=RequestMethod.POST)
	public void mymatchlist(HttpSession session, HttpServletResponse res) {
		try {
			System.out.println("id :"+ session.getAttribute("id"));
			List<GamelistrecordVO> list =cs.selectmymatch(session);
			JSONArray jarry = JSONArray.fromObject(list);
			res.setContentType("application/json; charset=utf-8"); 
			res.getWriter().print(jarry);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//케릭터 삭제
	@RequestMapping(value="/deletecharacter", method=RequestMethod.POST)
	public void deletecharacter(HttpServletRequest req, HttpServletResponse res,HttpSession session) {
		try {
			int result = cs.delete(req);
			System.out.println("req:character_no : "+ req.getParameter("character_no"));
			String msg ="";
			res.setContentType("text/html; charset=utf-8"); 
			if(result == 0) {
				msg =" <script> alert('삭제실패'); </script>";
			}else if(result ==1 ) {
				int updatenumber = cs.delete_updatenumber(session);
				msg =" <script> location.href='/'; alert('삭제완료'); </script>";
				System.out.println(updatenumber + " : 삭제 업데이트 수");
			}
			res.getWriter().print(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
