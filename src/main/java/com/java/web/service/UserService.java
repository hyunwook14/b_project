package com.java.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		//result 0:아이디가없습니다, 1:로그인성공, 2:아이디가 틀립니다, 3:비밀번호틀립니다, 4:회원탈퇴
		int result = 0;
		System.out.println(user.toString());
		if( (int)sqlsession.selectOne("user.checkdelYN", user) == 1) result = 4;
		else {
			
			List<MemberUserVO> userlist =sqlsession.selectList("user.selectuser", user);
			System.out.println(userlist.size());
			if(userlist == null) {
				System.out.println("null 값넘어옴");
			}else {
				for(int i =0 ; i<userlist.size(); i++) {
					if(user.getUser_id().equals(userlist.get(i).getUser_id())) {
						System.out.println(userlist.get(i).getUser_pw()+" -listpw ,"+user.getUser_pw() +"==pw");
						if(user.getUser_pw().equals(userlist.get(i).getUser_pw())) {
							System.out.println("아이디와 비밀번호일치");
							result = 1;
						}else {
							System.out.println("비밀번호가틀립니다.");
							result =3;
						}
					}else {
						System.out.println("아이디가 틀립니다");
						result = 2;
					}
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
	
	//내정보가져오기
	public MemberUserVO selectmyinfo(HttpSession session) {
		MemberUserVO user = new MemberUserVO();
		user.setUser_id((String) session.getAttribute("id"));
		user = sqlsession.selectOne("user.selectuser", user);
		return user;
	}
	//정보 수정, 삭제
	public int updatemyinfo(HttpServletRequest req, MemberUserVO user) {
		int result = 0;
		
		int index = Integer.parseInt(req.getParameter("index"));
		//index = 0 수정, index = 1 삭제
		if(index == 0 ) {
			result = sqlsession.update("user.updateuser", user);
		}else if (index == 1) {
			result = sqlsession.update("user.deleteuser", user);
			if(result ==1) result = 2;
		}
		
		return result;
	}
	
}
