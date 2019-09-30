package com.java.web.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.vo.UserCharacterVO;

@Service
public class CharacterService {

	@Autowired
	SqlSession sqlsession;
	
	public int create(UserCharacterVO character, HttpSession session) {
		String userid = (String) session.getAttribute("id");
		int userno = sqlsession.selectOne("selectno", userid);
		character.setUser_no(userno);
		
		return sqlsession.insert("character.create", character);
	}
	
	public List<UserCharacterVO> select(HttpSession session){
		String userid = (String) session.getAttribute("id");
		int userno = sqlsession.selectOne("selectno", userid);
		List<UserCharacterVO> characterlist = sqlsession.selectList("character.select", userno);
		System.out.println(characterlist.get(0).toString());
		
		return null;
	}
	
}
