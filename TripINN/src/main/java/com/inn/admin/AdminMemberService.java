package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminMemberService {

	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectMemberView(Map<String, Object> map) throws Exception;

	void updateMemberModify(Map<String, Object> map) throws Exception;
    
	void deleteList(Map<String, Object> map) throws Exception;

}
