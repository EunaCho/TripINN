package com.inn.trip;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TripService {

	void tripRegist(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
}
