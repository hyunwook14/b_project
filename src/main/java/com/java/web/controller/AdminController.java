package com.java.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.web.service.UserService;
import com.java.web.vo.MemberUserVO;

import net.sf.json.JSONArray;

@Controller
public class AdminController {
	
	@Autowired
	UserService us;
	
	@RequestMapping("/admin")
	public String admin(HttpSession session) {
		if(session.getAttribute("id") ==null) return "redirect:/";
		return "admin";
	}
	
	@RequestMapping(value="/userlist", method=RequestMethod.POST)
	public void userlist(HttpServletResponse res) {
		try {
			res.setContentType("application/json; charset=utf-8;");
			
			List<MemberUserVO> userlist= us.userlistselect();
			System.out.println(userlist.size()+"--size");
			JSONArray jarry = JSONArray.fromObject(userlist);
			
			res.getWriter().print(jarry);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
