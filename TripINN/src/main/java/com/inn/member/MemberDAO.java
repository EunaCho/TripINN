package com.inn.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {
	
	//회원가입
	void memberJoin(Map<String, Object> map) throws Exception {
		insert("member.joinMember", map);
	}
	
	//로그인
	@SuppressWarnings("unchecked")
	Map<String, Object> memberLogin(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("member.loginMember", map);
	}
	
	//아이디 찾기
	void memberEmailFind(Map<String, Object> map) throws Exception {
		
	}
	
	//비밀번호 찾기
	void memberPwFind(Map<String, Object> map) throws Exception {
		
	}
	

}
