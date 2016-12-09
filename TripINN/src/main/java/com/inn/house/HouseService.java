package com.inn.house;

import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

//DAO 기능 구현
public interface HouseService {
	
	List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception;
	
	void insertHouse(Map<String, Object> map) throws Exception;
	
	void updateHouse(Map<String, Object> map) throws Exception;
	
}
