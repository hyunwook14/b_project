package com.java.web.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.vo.BasketballPositionVO;

@Service
public class ExerciseService {
	
	@Autowired
	SqlSession sqlsession;
	
	public BasketballPositionVO loadskill(String position_name) {
		BasketballPositionVO basketball = sqlsession.selectOne("exercise.positionskill", position_name);
		System.out.println(basketball.toString());
		return basketball;
	}
}
