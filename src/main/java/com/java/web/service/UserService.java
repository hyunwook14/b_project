package com.java.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.vo.MemberUserVO;

@Service
public class UserService {
	
	@Autowired
	SqlSession sqlsession;
	
	//login
	public int userlogin(MemberUserVO user){
		int result = 0;
		List<MemberUserVO> userlist =sqlsession.selectList("user.selectuser", user);
		
		if(userlist == null) {
			System.out.println("null 값넘어옴");
		}else {
			for(int i =0 ; i<userlist.size(); i++) {
				if(user.getUser_id().equals(userlist.get(i).getUser_id())) {
					
					if(user.getUser_pw().equals(userlist.get(i).getUser_pw())) {
						System.out.println("아이디와 비밀번호일치");
						result = 1;
					}
				}else {
					System.out.println("아이디가 틀립니다");
				}
			}
		}
		return result;
	}
	
	//회원가입 id중복체크
	public boolean idcheck(HttpServletRequest req) {
		boolean result =false;
		
		String id = (String) req.getParameter("id");
		String userresult = sqlsession.selectOne("user.idcheck", id);
		
		if(userresult == null) {
			result = true;
		}
		return result;
	}
	
	//회원가입
	public int createuser(MemberUserVO user) {
		int result = 0;
		result = sqlsession.insert("user.createuser", user);
	
		return result;
	}
	
	//회원리스트
	public List<MemberUserVO> userlistselect(){
		return sqlsession.selectList("user.userlist");
	}
	
}
