package com.inn.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("mypageDAO") //DAO 클래스 등록 
public class MypageDAO extends AbstractDAO {
	/*
	@SuppressWarnings
	1. all : 모든 경고를 억제
	2. cast : 캐스트 연산자 관련 경고 억제
	3. dep-ann : 사용하지 말아야 할 주석 관련 경고 억제
	4. deprecation : 사용하지 말아야 할 메소드 관련 경고 억제
	5. fallthrough : switch문에서의 break 누락 관련 경고 억제
	6. finally : 반환하지 않는 finally 블럭 관련 경고 억제
	7. null : null 분석 관련 경고 억제
	8. rawtypes : 제네릭을 사용하는 클래스 매개 변수가 불특정일 때의 경고 억제
	9. unchecked : 검증되지 않은 연산자 관련 경고 억제
	10. unused : 사용하지 않는 코드 관련 경고 억제
	*/
	
	//**메시지 
	//보낸 메시지 리스트
	@SuppressWarnings("unchecked")//경고 제외 어노테이션
	public List<Map<String, Object>> selectSendMsgList(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("mypage.selectSendMsgList", map);
	}
	
	@SuppressWarnings("unchecked")//경고 제외 어노테이션
	//받은 메시지 리트스 
	public List<Map<String, Object>> selectReceiveMsgList(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("mypage.selectReceiveMsgList", map);
	}
	
}
