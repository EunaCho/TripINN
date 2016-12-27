package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminHouseService {
	
	List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectHouseReportList(Map<String, Object> map) throws Exception;

}
