package com.inn.member;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	Logger log = Logger.getLogger(this.getClass()); //??
	
	@Resource(name="memberDAO") //sql�� �޾ƿ� DAO Resource ����
	private MemberDAO memberDAO;

	public void memberJoin(Map<String, Object> map) throws Exception {
		memberDAO.memberJoin(map);
	}

	public Map<String, Object> memberLogin(Map<String, Object> map) throws Exception {
		return memberDAO.memberLogin(map);
		
	}
	
	
	public void memberEmailFind(Map<String, Object> map) throws Exception {
		
	}
	
	public void memberPwFind(Map<String, Object> map) throws Exception {
		
	}
	
	
}
