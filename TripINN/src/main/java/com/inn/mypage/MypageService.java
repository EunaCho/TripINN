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
<<<<<<< HEAD
=======
	
	List<Map<String, Object>> selectMy_ReserList(Map<String, Object> map) throws Exception; //예약관리 리스트
	List<Map<String, Object>> selectH_ReserDeleteList(Map<String, Object> map) throws Exception;//예약취소 관리 리스트 
	Map<String, Object> selectReserDetail(Map<String, Object> map) throws Exception; //예약관리상세보기 
	
	void deleteReserDelete(Map<String, Object> map) throws Exception; //예약취소 목록에서 해당 숙소 목록 삭제 
	
	void updateHr_delete_state_1(Map<String, Object> map) throws Exception;//예약취소 신청 hr_delete_state update
	void updateHr_delete_state_2(Map<String, Object> map) throws Exception;
	void updateHr_delete_state_3(Map<String, Object> map) throws Exception;	
	void updateHr_delete_date(Map<String, Object> map) throws Exception;//에약취소 신청 날짜 update
	
	Map<String, Object> countDate(Map<String, Object> map) throws Exception;  //숙소 이용 날짜 
	
	//------------------------------트립목록-------------------------------------------------
	List<Map<String, Object>> selectTripList(Map<String,Object> map) throws Exception; //내가 등록한 트립 목록 리스트 
	Map<String, Object> selectTripDetail(Map<String, Object> map) throws Exception; //트립 리스트 상세보기 
	List<Map<String, Object>> selectT_ReserList(Map<String, Object> map) throws Exception; //해당트립 예약현황리스트 
	List<Map<String, Object>> selectT_MsgList(Map<String, Object> map) throws Exception; //해당 트립 메시지 리스트 
	List<Map<String, Object>> selectMy_TReserList(Map<String, Object> map) throws Exception;//내 예약관리 리스트 
	Map<String, Object> selectT_ReserDetail(Map<String, Object> map) throws Exception;//예약관리 상세보기 
	//예약 취소 리스트 
	
	void updateTr_delete_state1(Map<String, Object> map) throws Exception;//예약 취소 state update
	void updateTr_delete_state2(Map<String, Object> map) throws Exception;
	void updateTr_delete_state3(Map<String, Object> map) throws Exception;
	
	void updateTr_delete_date(Map<String, Object> map) throws Exception; //예역 취소 신청 날짜 update
	
	List<Map<String, Object>> selectT_ReserDeleteList(Map<String, Object> map) throws Exception;//예약 취소 리스트 
	
	void deleteT_ReserDelete(Map<String, Object> map) throws Exception; //예약취소 목록에서 해당 트립 목록 삭제 
	
	//------------------------------위시리스트 -------------------------------------------------
	
	Map<String, Object> selectMy_HouseList(Map<String, Object> map) throws Exception; //내 숙소 위시리스트  
	Map<String, Object> selectMy_TripList(Map<String, Object> map) throws Exception; //내 트립 위시리스트 
	void deleteHouseWish(Map<String, Object> map) throws Exception;//숙소위시리스트 삭제 
	void deleteTripWish(Map<String, Object> map) throws Exception;//트립 위시리스트 삭제 

	void messageDel(String msg_idx);

	void house_rsv_del(String hr_idx);
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
	
}
