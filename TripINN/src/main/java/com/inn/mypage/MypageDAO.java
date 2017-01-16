package com.inn.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("mypageDAO") //DAO 클래스 등록 
public class MypageDAO extends AbstractDAO {
	
	//-------------------------------------알림판----------------------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMember(Map<String, Object> map){
		return (Map<String, Object>) selectOne("mypage.selectMember", map);
	}

	//--------------------------------------메시지 ----------------------------------------//
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
	//보낸 메시지 상세보기 
	public Map<String, Object> selectSendMsgDetail(Map<String, Object> map){
		return (Map<String, Object>) selectOne("mypage.selectSendMsgDetail", map);
	}
	//받은메시지 상세보기 
	public Map<String, Object> selectReceiveMsgDetail(Map<String, Object> map){
		return (Map<String, Object>) selectOne("mypage.selectReceiveMsgDetail", map);
	}
	public void updateMsg_state(Map<String, Object> map){
		update("mypage.updateMsg_state", map);
	}
	//메시지 쓰기 
	@SuppressWarnings("unchecked")
	public void insertMsgWrite(Map<String, Object> map){
		insert("mypage.insertMsgWrite", map);
	}
	

	//----------------------------------------숙소목록-----------------------------------------//
	//숙소목록 리스트
	public List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mypage.selectHouseList", map);
	}
	//숙소 상세보기 
	public Map<String, Object> selectHouseDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("mypage.selectHouseDetail", map);
	}
	//숙소 상세보기 ->숙소 수정하기 
	public Map<String, Object> selectHouseModify(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectHouseModify", map);
	}
	//해당 숙소예약 리스트
	public List<Map<String, Object>> selectH_ReserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mypage.selectH_ReserList",map);
	}
	//해당 숙소 메시지 리스트 
	public List<Map<String, Object>> selectH_MsgList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mypage.selectH_MsgList", map);
	}
	//예약관리리스트
	public List<Map<String, Object>> selectMy_ReserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mypage.selectMy_ReserList", map);
	}
	//예약취소 리스트
	public List<Map<String, Object>> selectH_ReserDeleteList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectH_ReserDeleteList", map);
	}
	//예약관리 상세보기
	public Map<String, Object> selectReserDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectReserDetail", map);
	}
	//예약취소목록에서 해당 숙소 삭제 
	public void deleteReserDelete(Map<String, Object> map) throws Exception{
		delete("mypage.deleteReserDelete", map);
	}
	//update hr_delete_state
	public void updateHr_delete_state_1(Map<String, Object> map){
		update("mypage.updateHr_delete_state_1", map);
	}
	public void updateHr_delete_state_2(Map<String, Object> map){
		update("mypage.updateHr_delete_state_2", map);
	}
	public void updateHr_delete_state_3(Map<String, Object> map){
		update("mypage.updateHr_delete_state_3", map);
	}
	//예약취소 신청 날짜 update
	public void updateHr_delete_date(Map<String, Object> map){
		update("mypage.updateHr_delete_date", map);
	}
	//숙소 이용 날짜계싼
	public Map<String, Object> countDate(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.countDate", map);
	}
	
	//--------------------------------트립목록------------------------------------------
	//내가 등록한 트립 리스트
	public List<Map<String, Object>> selectTripList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectTripList", map);
	}
	//트립리스트 상세보기 
	public Map<String, Object> selectTripDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectTripDetail", map);
	}
	//해당트립예약현황 리스트
	public List<Map<String, Object>> selectT_ReserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectT_ReserList", map);
	}
	//해당트립 메시지 리스트 
	public List<Map<String, Object>> selectT_MsgList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectT_MsgList", map);
	}
	//내 예약관리리스트 
	public List<Map<String, Object>> selectMy_TReserList(Map<String, Object> map) throws Exception{
		return  (List<Map<String, Object>>)selectList("mypage.selectMy_TReserList", map);
	}
	//예약관리 예약 상세보기 
	public Map<String, Object> selectT_ReserDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectT_ReserDetail", map);
	}
	
	//예약취소 state update
	public void updateTr_delete_state1(Map<String, Object> map) throws Exception{
		update("mypage.updateTr_delete_state1", map);
	}
	public void updateTr_delete_state2(Map<String, Object> map) throws Exception{
		update("mypage.updateTr_delete_state2", map);
	}
	public void updateTr_delete_state3(Map<String, Object> map) throws Exception{
		update("mypage.updateTr_delete_state3", map);
	}
	//deletedate update
	public void updateTr_delete_date(Map<String, Object> map) throws Exception{
		update("mypage.updateTr_delete_date", map);
	}
	//예약 취소 리스트 
	public List<Map<String, Object>> selectT_ReserDeleteList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectT_ReserDeleteList", map);
	}
	
	//예약취소 리스트 에서 예약취소 목록 삭제하기 
	public void deleteT_ReserDelete(Map<String, Object> map) throws Exception{
		delete("mypage.deleteT_ReserDelete", map);
	}
	
	//------------------위시리스트 
	//내 숙소 위시리스트 
	public Map<String, Object> selectMy_HouseList(Map<String, Object> map) throws Exception{
		return selectPagingList("mypage.selectMy_HouseList", map);
	}
	//내 트립 위시시트스 
	public Map<String, Object> selectMy_TripList(Map<String, Object> map) throws Exception{
		return selectPagingList("mypage.selectMy_TripList", map);
	}
	
	//숙소 위시리스트 삭제
	public void deleteHouseWish(Map<String, Object> map) throws Exception{
		delete("mypage.deleteHouseWish", map);
	}
	//트립위시리스트 삭제 
	public void deleteTripWish(Map<String, Object> map) throws Exception{
		delete("mypage.deleteTripWish", map);
	}
}
