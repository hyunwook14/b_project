package com.java.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.vo.BasketballPositionVO;
import com.java.web.vo.GamelistrecordVO;
import com.java.web.vo.UserCharacterVO;

@Service
public class CharacterService {

	@Autowired
	SqlSession sqlsession;
	
	//케릭터 이름 중복확인
	public int nicknamecheck(String nickname) {
		return sqlsession.selectOne("character.nicknamecheck", nickname);
	}
	
	//케릭터 생성
	public int create(UserCharacterVO character, HttpSession session) {
		int result = 0;
		String userid = (String) session.getAttribute("id");
		int userno = sqlsession.selectOne("selectno", userid);
		//로그인된 user 고유키값 등록
		character.setUser_no(userno);
		
		result = nicknamecheck(character.getCharacter_nickname());
		if(result != 0) {
			result = 3;
		}else {
			int count = sqlsession.selectOne("character.checknumber", userno);
			if( count < 3 ) {
				result = sqlsession.insert("character.create", character);
			}
		}
		
		
		return result;
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
		int userno = sqlsession.selectOne("user.selectno", userid);
		
		//user키값으로 케릭터정보가져오기
		List<UserCharacterVO> characterlist = sqlsession.selectList("character.select", userno);
		return characterlist;
	}
	
	//포지션정보 불러오기
	public List<BasketballPositionVO> positionselect(HttpServletRequest req, HttpSession session){
		List<BasketballPositionVO> resultlist = new ArrayList<BasketballPositionVO>(); 
		int height = Integer.parseInt( (String)req.getParameter("height") );
		System.out.println(height);
		int no = 0;
		
		//키별로 포지션구별
		if(  height < 230 && height >=190) {
			no=5;
			resultlist.add((BasketballPositionVO) sqlsession.selectList("character.position_select", no).get(0));
		}else if(height <190 && height >=188) {
			no=4;
			resultlist.add((BasketballPositionVO) sqlsession.selectList("character.position_select", no).get(0));
		}else if(height <188 && height >= 183) {
			no=3;
			resultlist.add((BasketballPositionVO) sqlsession.selectList("character.position_select", no).get(0));
		}else if(height < 183 && height >= 180) {
			no=2;
			resultlist.add((BasketballPositionVO) sqlsession.selectList("character.position_select", no).get(0));
		}else if(height < 180 && height > 100){
			no = 1;
			resultlist = sqlsession.selectList("character.position_select", no);
		}else {
			System.out.println("포지션추천해줄수없는 키입니다.");
		}
		return resultlist;
	}
	// user 케릭터 시합정보가져오기
	public List<GamelistrecordVO> selectmymatch(HttpSession session) {
		List<GamelistrecordVO> list = new ArrayList<>();
		String userid = (String) session.getAttribute("id");
		int userno = sqlsession.selectOne("user.selectno", userid);
		List<UserCharacterVO> characterlist = sqlsession.selectList("character.select", userno);
		for(int i=0; i< characterlist.size(); i++) {
			System.out.println(characterlist.get(i).toString());
			List<GamelistrecordVO> result = sqlsession.selectList("gamerecord.characterlistselect", characterlist.get(i));
			for(int j =0; j<result.size(); j++) {
				list.add(result.get(j));
			}
		}
		return list;
	}
	// 케릭터 삭제
	public int delete(HttpServletRequest req) {
		int character_no = Integer.parseInt(req.getParameter("character_no"));
		return sqlsession.update("character.delete", character_no);
	}
	// 케릭터 삭제시 수 변경
	public int delete_updatenumber(HttpSession session) {
		String userid = (String) session.getAttribute("id");
		int userno = sqlsession.selectOne("user.selectno", userid);
		System.out.println("userno : "+userno);
		int count = sqlsession.selectOne("character.checknumber", userno);
		System.out.println(count);
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("user_no", userno);
		inputMap.put("count", count);
		System.out.println("케릭터 삭제시 수변경");
		return sqlsession.update("character.deletenumberupdate", inputMap);
		
	}
}
