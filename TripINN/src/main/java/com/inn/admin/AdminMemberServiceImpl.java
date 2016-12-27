package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("AdminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;

	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		
		return adminMemberDAO.selectMemberList(map);
	}

	@Override
	public Map<String, Object> selectMemberView(Map<String, Object> map) throws Exception {
		
		Map<String,Object> resultMap = adminMemberDAO.selectMemberView(map);
		return resultMap;
	}


	@Override
	public void updateMemberModify(Map<String, Object> map) throws Exception {
		
		adminMemberDAO.updateMemberModify(map);
		
	}
	
	@Override
	public void deleteList(Map<String, Object> map) throws Exception{
		adminMemberDAO.deleteList(map);
	}
	
	
	

}
