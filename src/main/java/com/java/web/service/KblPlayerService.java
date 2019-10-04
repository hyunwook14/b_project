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
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.vo.KblPlayerVO;

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
	public List<KblPlayerVO> loadplayer() {
		return sqlsession.selectList("kblplayer.select");
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
	
}
