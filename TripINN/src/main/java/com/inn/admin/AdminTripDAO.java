package com.inn.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("adminTripDAO")
public class AdminTripDAO extends AbstractDAO {
    
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTripList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("admin.selectTripList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTripReportList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("admin.selectTripReportList", map);
	}
}