package com.inn.trip;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;


@Service("testService")
public class TestServiceImpl implements TestService {
	
	@Resource(name="testDAO")
	private TestDAO testDAO;
	
	@Override 
	public void insertTest(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		testDAO.insertTest(map);
	}

}
