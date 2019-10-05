package com.java.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.vo.GamelistrecordVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class MatchrecordService {
	
	@Autowired
	SqlSession sqlsession;
	
	public int saverecord(HttpServletRequest req) {
		int result =0;
		String list = req.getParameter("list");
		JSONArray jary = JSONArray.fromObject(list);
		GamelistrecordVO gamerecord = new GamelistrecordVO();
		for(int i=0; i<jary.size(); i++ ) {
			JSONObject jobj=(JSONObject) jary.get(i);
			gamerecord.setRecord_assortment((String)jobj.get("record_assortment"));
			gamerecord.setRecord_nickname((String)jobj.get("record_nickname"));
			gamerecord.setRecord_twop(Integer.parseInt((String) jobj.get("record_twop")));
			gamerecord.setRecord_threep(Integer.parseInt((String) jobj.get("record_threep")));
			gamerecord.setRecord_onep(Integer.parseInt((String) jobj.get("record_onep")));
			gamerecord.setRecord_foul(Integer.parseInt((String) jobj.get("record_foul")));
			gamerecord.setRecord_assist(Integer.parseInt((String) jobj.get("record_assist")));
			gamerecord.setRecord_steal(Integer.parseInt((String) jobj.get("record_steal")));
			gamerecord.setRecord_block(Integer.parseInt((String) jobj.get("record_block")));
			gamerecord.setRecord_turnover(Integer.parseInt((String) jobj.get("record_turnover")));
			gamerecord.setRecord_totalp(Integer.parseInt((String) jobj.get("totalp")));
			gamerecord.setRecord_quarter(Integer.parseInt((String) jobj.get("record_quarter")));
//				GamelistrecordVO gamerecord = new GamelistrecordVO((String)jobj.get("record_assortment"),
//						(String)jobj.get("record_nickname"), Integer.parseInt((String) jobj.get("record_twop")),
//						Integer.parseInt((String) jobj.get("record_threep")), Integer.parseInt((String) jobj.get("record_onep")),
//						Integer.parseInt((String) jobj.get("record_foul")), Integer.parseInt((String) jobj.get("record_assist")),
//						Integer.parseInt((String) jobj.get("record_steal")), Integer.parseInt((String) jobj.get("record_block")),
//						Integer.parseInt((String) jobj.get("record_turnover")), Integer.parseInt((String) jobj.get("totalp")));
			result = sqlsession.insert("gamerecord.saverecord", gamerecord);
		}
		
		return result;
	}
	
}
