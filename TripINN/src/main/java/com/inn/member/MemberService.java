package com.inn.member;

import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {
	
	void memberJoin(Map<String, Object> map) throws Exception;

	Map<String, Object> memberLogin(Map<String, Object> map) throws Exception;
	
	void memberEmailFind(Map<String, Object> map) throws Exception;
	
	void memberPwFind(Map<String, Object> map) throws Exception;
	

}
