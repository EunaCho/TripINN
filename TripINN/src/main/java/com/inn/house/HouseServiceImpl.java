package com.inn.house;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service; //Service 클래스 등록


//서비스 클래스 등록
@Service("hosueService")
public class HouseServiceImpl implements HouseService{

	// jsp와 연동
	@Override
	public List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertHouse(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateHouse(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
