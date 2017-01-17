package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminMemberService {

	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectMemberView(Map<String, Object> map) throws Exception;

	void updateMemberModify(Map<String, Object> map) throws Exception;
    
	void deleteList(Map<String, Object> map) throws Exception;
	
	//검색 (3=이메일)
	    List<Map<String,Object>> search3(Map<String,Object> map);
	
	//검색 (4=번호)
		List<Map<String,Object>> search4(Map<String,Object> map);
		
	//검색 (5=주소)
		List<Map<String,Object>> search5(Map<String,Object> map);
			

}
