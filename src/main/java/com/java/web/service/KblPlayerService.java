package com.java.web.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.vo.KblPlayerVO;
import com.java.web.vo.UserCharacterVO;

import net.sf.json.JSONArray;

@Service
public class KblPlayerService {

	@Autowired
	SqlSession sqlsession;
	
	//KBL 홈페이지에서 값 가져오기
	public int playercrawling() {
			int result = 0;
			
			if((int)sqlsession.selectOne("kblplayer.datacount") == 0 ) {
				System.out.println("크롤링시작");
				try {
					String urlpath = "https://kbl.or.kr";
					int pcode = 290100;
					//pcode290100~291236
					String url ="https://kbl.or.kr/players/player_info.asp?pcode=";
					for(int i = pcode; i<291237; i++) {
						Document doc = Jsoup.connect(url+i).get();
						Elements playerframes = doc.select(".player_frame");
						
						String imgpath = urlpath+playerframes.select("img").eq(0).attr("src");
						
						boolean imgresult = isImage(imgpath);
						if(imgresult == true) {
							String names =playerframes.select(".name").eq(0).text();
							String[] temp = names.split(" ");
							String teamnumber ="";
							String name = "";
							for(int j= 0; j<temp.length; j++) {
								if(!"NO".equals(temp[j])) {
									String[] temp2 = temp[j].split("\\.");
									if(temp2.length == 2) {
										teamnumber = temp2[0];
										name = temp2[1];
									}
								}
							}
							String height =playerframes.select(".stature").eq(0).text();
							String team = playerframes.select(".team_name").eq(0).text();
							String position = playerframes.select(".position").eq(0).text();
							
							if(!"".equals(name) && !"".equals(teamnumber)) {
								KblPlayerVO player = new KblPlayerVO(name, height, Integer.parseInt(teamnumber), team, position, imgpath);
								System.out.println(player.toString());
								//DB에 저장
								result = sqlsession.insert("kblplayer.save", player);
							}
						}
						
						
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else {
				System.out.println("데이터 존재");
			}
			return result;
	}
	
	//KBL player list 가져오기
	public List<KblPlayerVO> loadplayer(HttpServletRequest req) {
		List<KblPlayerVO> result = new ArrayList<KblPlayerVO>();
		int index = 0;
		if(req.getParameter("index")==null) {
			System.out.println("null");
		}else {
			index = Integer.parseInt(req.getParameter("index")) * 12;
		}
		result = sqlsession.selectList("kblplayer.select", index);
		
		return  result;
	}
	
	//KBL player list page 개수
	public int pagenumber() {
		return sqlsession.selectOne("kblplayer.count");
	}
	
	//KBL palyer img 확인여부검사
	public boolean isImage(String url) throws Exception{
		boolean result =false;
		try {
			URL urltest = new URL(url);
			
			InputStream input = urltest.openStream();
			URLConnection con = urltest.openConnection(); 
			HttpURLConnection exitCode = (HttpURLConnection)con;
			System.out.println(exitCode.getResponseCode());
			System.out.println(con.getContentType());
			
			if(con.getContentType().indexOf("png") > -1) {
				System.out.println("Image 화면");
				result = true;
			}else {
				System.out.println("HTML 화면");
			}
			
			System.out.println("sucees: "+input.read());
			
			input.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//케릭터 포지션에 맞는 선수추천
	public JSONArray recommend(HttpServletRequest req) {
		String name = req.getParameter("nickname");
		int index = 0;
		if(req.getParameter("index")==null) {
			System.out.println("index는 null");
		}else {
			index = Integer.parseInt(req.getParameter("index")) * 12;
		}
		System.out.println(name + " :name은?");
		UserCharacterVO character = sqlsession.selectOne("character.info", name);
		System.out.println(character);
		String[] positions = character.getCharacter_position().split(" ");
		String position = "";
		for(int i =0 ; i < positions.length; i++) {
			if("Forward".equals(positions[i])) {
				position ="FD";
			}else if("Center".equals(positions[i])) {
				position = "C";
			}else if("Guard".equals(positions[i])) {
				position = "GD";
			}
		}
		System.out.println(position+ ": position");
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("position", position);
		inputMap.put("index", index);
		List<KblPlayerVO> listplayer  = sqlsession.selectList("kblplayer.recommand", inputMap);
		System.out.println(listplayer.size() + ":size?");
		int recommandcount = recommandcount(position);
		JSONArray jarry = JSONArray.fromObject(listplayer);
		System.out.println(jarry.size()+" jarry size");
		jarry.add(jarry.size(), recommandcount);
		
		return jarry;
	}
	
	public int recommandcount(String position) {
		return sqlsession.selectOne("kblplayer.recommandcount", position);
	}
	
}
