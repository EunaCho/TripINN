package com.inn.trip;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TripService {

	void tripRegist(Map<String, Object> map, HttpServletRequest request) throws Exception;

	List<Map<String, Object>> selectTripList(Map<String, Object> map) throws Exception;

	String selectImages(String trip_idx) throws Exception;

	
}
