package com.inn.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {
	
	//ȸ������
	void memberJoin(Map<String, Object> map) throws Exception {
		insert("member.joinMember", map);
	}
	
	//�α���
	@SuppressWarnings("unchecked")
	Map<String, Object> memberLogin(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("member.loginMember", map);
	}
	
	//���̵� ã��
	void memberEmailFind(Map<String, Object> map) throws Exception {
		
	}
	
	//��й�ȣ ã��
	void memberPwFind(Map<String, Object> map) throws Exception {
		
	}
	

}
