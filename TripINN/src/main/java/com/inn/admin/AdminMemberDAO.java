package com.inn.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO {
    
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("admin.selectMemberList", map);
	}
		
	@SuppressWarnings("unchecked")
		public Map<String, Object> selectMemberView(Map<String, Object> map) throws Exception{
		
		    return (Map<String, Object>) selectOne("admin.selectMemberView",map);

	}

	
}
