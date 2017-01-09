package com.inn.mypage;

import java.util.List;
import java.util.Map;

//DAO 기능 구현
public interface MypageService {
	
	//------------------------------메시지----------------------------- 
	List<Map<String, Object>> selectSendMsgList(Map<String, Object> map) throws Exception; //보낸메시지 리스트
	List<Map<String, Object>> selectReceiveMsgList(Map<String, Object> map) throws Exception; //받은 메시지 리스트 
	Map<String, Object> selectSendMsgDetail(Map<String, Object> map) throws Exception; //보낸 메시지 상세보기
	Map<String, Object> selectReceiveMsgDetail(Map<String, Object> map) throws Exception; //받은 메시지 상세보기 
	void updateMsg_state(Map<String, Object> map) throws Exception; //msg_sate update 
	void insertMsgWrite(Map<String, Object> map) throws Exception; //메시지 쓰기 
	
	
	//------------------------------숙소 목록---------------------
	List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception; //숙소 목록 리스트 
	Map<String, Object>  selectHouseDetail(Map<String, Object> map) throws Exception; //숙소 상세보기
	List<Map<String, Object>> selectH_ReserList(Map<String, Object> map) throws Exception; //숙소 예약 현황 
	List<Map<String, Object>> selectH_MsgList(Map<String,Object> map) throws Exception; //숙소 쪽지 현황
	
	List<Map<String, Object>> selectMy_ReserList(Map<String, Object> map) throws Exception; //숙소예약관리리스트
	Map<String, Object> selectReserDetail(Map<String, Object> map) throws Exception; //예약상세보기 
	
	void updateHr_delete_state_1(Map<String, Object> map) throws Exception;//예약취소 신청 hr_delete_state update
	void updateHr_delete_state_2(Map<String, Object> map) throws Exception;
	void updateHr_delete_state_3(Map<String, Object> map) throws Exception;
	
	void updateHr_delete_date(Map<String, Object> map) throws Exception;//에약취소 신청 날짜 update
	
	Map<String, Object> countDate(Map<String, Object> map) throws Exception;  //숙소 이용 날짜 
	
	
	
}
