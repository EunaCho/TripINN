package com.inn.admin;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {

	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectMemberView(Map<String, Object> map) throws Exception;


}