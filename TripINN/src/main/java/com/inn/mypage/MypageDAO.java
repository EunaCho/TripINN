package com.inn.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("mypageDAO") //DAO 클래스 등록 
public class MypageDAO extends AbstractDAO {

	//-------메시지 ------//
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
	//메시지 상세보기 
	public Map<String, Object> selectMsgDetail(Map<String, Object> map){
		return (Map<String, Object>) selectOne("mypage.selectMsgDetail", map);
	}
	

	//-------숙소목록------//
	//숙소목록 리스트
	public List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mypage.selectHouseList", map);
	}
	//숙소 상세보기 
	public Map<String, Object> selectHousetDetail(Map<String, Object> map) throws Exception{
		
		return (Map<String, Object>)selectOne("mypage.selectHoustDetail", map);
	}
}
