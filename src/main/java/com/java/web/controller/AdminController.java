package com.java.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.web.service.KblPlayerService;
import com.java.web.service.UserService;
import com.java.web.vo.MemberUserVO;

import net.sf.json.JSONArray;

@Controller
public class AdminController {
	
	@Autowired
	UserService us;
	
	@Autowired
	KblPlayerService kps;
	
	@RequestMapping("/admin")
	public String admin(HttpSession session , HttpServletResponse res) throws IOException {
		if(session.getAttribute("id") ==null) {
			res.setContentType("text/html; charset=utf-8");
			res.getWriter().print("<script>alert('로그인이 필요합니다'); location.href='/';</script>");
			res.getWriter().flush();
		}
		return "admin";
	}
	
	@RequestMapping(value="/userlist", method=RequestMethod.POST)
	public void userlist(HttpServletResponse res) {
		try {
			res.setContentType("application/json; charset=utf-8;");
			List<MemberUserVO> userlist= us.userlistselect();
			JSONArray jarry = JSONArray.fromObject(userlist);
			res.getWriter().print(jarry);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value ="/crawling", method=RequestMethod.POST)
	public void crawling(HttpServletResponse res) {
		int result = 0;
		try {
			res.setContentType("html/text; charset=utf-8");
			
			result =kps.playercrawling();
			res.getWriter().print(result+"");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/test")
	public void test() throws Exception {
		
		for(int i = 290100; i < 290105; i++) {
			String url = "https://kbl.or.kr/images/playersPhoto/"+i+".png";
			kps.isImage(url);
		}
		
	}
}
