package com.inn.mypage;

import java.util.List;
import java.util.Map;

//DAO 기능 구현
public interface MypageService {
	
	//메시지 
	List<Map<String, Object>> selectSendMsgList(Map<String, Object> map) throws Exception; //보낸메시지 리스트
	List<Map<String, Object>> selectReceiveMsgList(Map<String, Object> map) throws Exception; //받은 메시지 리스트 
	Map<String, Object> selectMsgDetail(Map<String, Object> map) throws Exception; //메시지 상세보기 
	
	//숙소 목록
	List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception; //숙소 목록 리스트 
	Map<String, Object>  selectHousetDetail(Map<String, Object> map) throws Exception; //숙소 상세보기 

}
