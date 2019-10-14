package com.java.web.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.vo.BasketballPositionVO;
import com.java.web.vo.PositiontrainVO;

@Service
public class ExerciseService {
	
	@Autowired
	SqlSession sqlsession;
	
	public BasketballPositionVO loadskill(String position_name) {
		BasketballPositionVO basketball = sqlsession.selectOne("exercise.positionskill", position_name);
		return basketball;
	}
	
	public List<PositiontrainVO> loadsrc(String position) {
		int position_no = 0;
		if("Point Guard".equals(position)) {
			position_no = 1;
		}else if("Shooting Guard".equals(position)) {
			position_no = 2;
		}else if("Small Forward".equals(position)) {
			position_no = 3;
		}else if("Power Forward".equals(position)) {
			position_no = 4;
		}if("Center".equals(position)) {
			position_no = 5;
		}
		
		System.out.println(position_no+ ": position_no");
		List<PositiontrainVO> result = sqlsession.selectList("exercise.loadsrc", position_no);
		System.out.println(result.get(0).getSrc());
		return result;
	}
}
