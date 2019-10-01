package com.java.web.java;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class crawling {
	
	//KBL홈페이지에서 값 가져오기
	public void load() {
		//pcode
		String url ="https://kbl.or.kr/players/player_info.asp?pcode=291192&flag1=1&flag2=0&tcode=&sname=";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements playerframes = doc.select(".player_frame");
			System.out.println(playerframes);
			
			String test = playerframes.select("img").eq(0).attr("src");
			System.out.println(test);
			System.out.println("----");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}

