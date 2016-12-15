package com.inn.trip;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;


@Repository("testDAO")
public class TestDAO  extends AbstractDAO{

	public void insertTest(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("trip.insertTest", map);
	}
	
	
}
