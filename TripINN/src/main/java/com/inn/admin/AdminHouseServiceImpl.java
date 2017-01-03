package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("AdminHouseService")
public class AdminHouseServiceImpl implements AdminHouseService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminHouseDAO")
	private AdminHouseDAO adminHouseDAO;

	@Override
	public List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception {
		
		return adminHouseDAO.selectHouseList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectHouseReportList(Map<String, Object> map) throws Exception {
		
		return adminHouseDAO.selectHouseReportList(map);
	}
	
	@Override
	public void houseReportDelete(Map<String, Object> map) throws Exception{
		
		adminHouseDAO.houseReportDelete(map);
	}
}
