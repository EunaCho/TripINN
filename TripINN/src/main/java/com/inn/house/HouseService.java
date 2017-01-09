package com.inn.house;

import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

//DAO 기능 구현
public interface HouseService {
	//리스트 목록 보기 기능
	List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception;

	//하우스검색 정렬
	List<Map<String, Object>> searchHouseList(Map<String, Object> map) throws Exception;

	//하우스 지도 검색 정렬
	List<Map<String,Object>> selectHouseMapList(Map<String,Object> map) throws Exception;
	
	//삽입 기능
	void insertHouse(Map<String, Object> map, HttpServletRequest request) throws Exception;
		
	//수정 기능
	void updateHouse(Map<String, Object> map, HttpServletRequest request) throws Exception;
	//삭제 기능
	void deleteHouse(Map<String, Object> map) throws Exception;
	//상세보기 기능
	Map<String, Object> selectHouseDetail(Map<String, Object> map) throws Exception;
	
	

}
