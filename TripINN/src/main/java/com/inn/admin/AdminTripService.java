package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminTripService {
	
	List<Map<String, Object>> selectTripList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectTripReportList(Map<String, Object> map) throws Exception;
}