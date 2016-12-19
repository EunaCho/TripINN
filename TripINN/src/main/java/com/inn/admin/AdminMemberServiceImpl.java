package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
	

}
