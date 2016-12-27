package com.inn.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("adminHouseDAO")
public class AdminHouseDAO extends AbstractDAO {
    
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("admin.selectHouseList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHouseReportList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("admin.selectHouseReportList", map);
	}
}
