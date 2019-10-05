package com.java.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.web.service.UserService;
import com.java.web.vo.MemberUserVO;

@Controller
public class UserController {
	
	@Autowired
	UserService us;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping("/main")
	public String main(HttpSession session){
		System.out.println(session.getAttribute("id"));
		
		// session id 값이 없을떄 첫화면으로 이동
		if(session.getAttribute("id")==null) {
			return "redirect:/";
		}
		
		return "main";
	}
	
	
	//유저로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public void login(MemberUserVO user, HttpSession session, HttpServletResponse res) {
		try {
			int result = us.userlogin(user);
			res.setContentType("text/html; charset=utf-8;");
			
			String msg ="";
			if(result ==0 ) {
				msg ="<script>alert('로그인실패'); location.href='/';</script>";
			}else {
				session.setAttribute("id", user.getUser_id());
				msg ="<script> location.href='/main'; </script>";
			}
			res.getWriter().print(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//유저로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입URL맵핑
	@RequestMapping("/c_user")
	public String c_user() {
		return "c_user";
	}
	
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	public void idcheck(HttpServletRequest req, HttpServletResponse res) {
		try {
			res.setContentType("text/html; charset=utf-8"); 
			System.out.println("idcheck서버단");
			boolean result = us.idcheck(req);
			res.getWriter().print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/createuser")
	public void createuser(MemberUserVO user, HttpServletResponse res) {
		try {
			System.out.println(user.toString());
			int result =us.createuser(user);
			String msg ="";
			if(result == 1) {
				msg ="<script> alert('회원가입성공'); location.href='/';</script>";
			}else {
				msg ="<script> alert('회원가입실패'); location.href='/c_user'</script>";
			}
			res.getWriter().print(result+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
