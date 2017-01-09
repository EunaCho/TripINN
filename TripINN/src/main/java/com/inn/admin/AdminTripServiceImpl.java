package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("AdminTripService")
public class AdminTripServiceImpl implements AdminTripService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminTripDAO")
	private AdminTripDAO adminTripDAO;

	@Override
	public List<Map<String, Object>> selectTripList(Map<String, Object> map) throws Exception {
		
		return adminTripDAO.selectTripList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectTripReportList(Map<String, Object> map) throws Exception {
		
		return adminTripDAO.selectTripReportList(map);
	}
}