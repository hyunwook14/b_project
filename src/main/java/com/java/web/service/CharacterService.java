package com.java.web.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.vo.BasketballPositionVO;
import com.java.web.vo.UserCharacterVO;

@Service
public class CharacterService {

	@Autowired
	SqlSession sqlsession;
	
	//케릭터 생성
	public int create(UserCharacterVO character, HttpSession session) {
		String userid = (String) session.getAttribute("id");
		int userno = sqlsession.selectOne("selectno", userid);
		//로그인된 user 고유키값 등록
		character.setUser_no(userno);
		
		return sqlsession.insert("character.create", character);
	}
	
	//User의 케릭터 수 업데이트
	public int characterupdate() {
		System.out.println("업데이트시작");
		return sqlsession.update("user.characternumber");
	}
	
	
	//케릭터정보가져오기
	public List<UserCharacterVO> select(HttpSession session){
		//user 고유키값가져오기
		String userid = (String) session.getAttribute("id");
		int userno = sqlsession.selectOne("selectno", userid);
		
		//user키값으로 케릭터정보가져오기
		List<UserCharacterVO> characterlist = sqlsession.selectList("character.select", userno);
		
		return characterlist;
	}
	
	//포지션정보 불러오기
	public List<BasketballPositionVO> positionselect(HttpServletRequest req){
		List<BasketballPositionVO> resultlist = new ArrayList<BasketballPositionVO>(); 
		int height = Integer.parseInt( (String)req.getParameter("height") );
		int no = 0;
		//키별로 포지션구별
		if(height <180) {
			no = 1;
			resultlist = sqlsession.selectList("character.position_select", no);
		}else if(height <191) {
			no=2;
			resultlist.add((BasketballPositionVO) sqlsession.selectList("character.position_select", no).get(0));
			no=3;
			resultlist.add((BasketballPositionVO) sqlsession.selectList("character.position_select", no).get(0));
		}else if(height >190) {
			no=4;
			resultlist.add((BasketballPositionVO) sqlsession.selectList("character.position_select", no).get(0));
			no=5;
			resultlist.add((BasketballPositionVO) sqlsession.selectList("character.position_select", no).get(0));
		}
		
		return resultlist;
	}
}
