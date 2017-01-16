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
	
	public void updateMemberModify(Map<String, Object> map) throws Exception{
		
		update("admin.updateMemberModify",map);
	}

	public void deleteList(Map<String, Object> map) throws Exception{
		
		delete("admin.deleteList", map);
	}
	
	//이메일로 검색
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> search3(Map<String, Object> map) {
			return (List<Map<String,Object>>)selectList("admin.search3", map);
		}
	//번호로 검색
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> search4(Map<String, Object> map) {
			return (List<Map<String,Object>>)selectList("admin.search4", map);
		}
	//주소로 검색
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> search5(Map<String, Object> map) {
			return (List<Map<String,Object>>)selectList("admin.search5", map);
		}
	
}
