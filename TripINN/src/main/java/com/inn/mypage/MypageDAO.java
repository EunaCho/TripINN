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
	

	//-------숙소목록------//
	//숙소목록 리스트
	public List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mypage.selectHouseList", map);
	}
	//숙소 상세보기 
	public Map<String, Object> selectHouseDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("mypage.selectHouseDetail", map);
	}
	//해당 숙소예약 리스트
	public List<Map<String, Object>> selectH_ReserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mypage.selectH_ReserList",map);
	}
	//해당 숙소 메시지 리스트 
	public List<Map<String, Object>> selectH_MsgList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mypage.selectH_MsgList", map);
	}
	//예약관리
	public List<Map<String, Object>> selectMy_ReserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mypage.selectMy_ReserList", map);
	}
	//예약관리 상세보기
	public Map<String, Object> selectReserDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectReserDetail", map);
	}
	//update hr_delete_state
	public void updateHr_delete_state_1(Map<String, Object> map){
		update("updateHr_delete_state_1", map);
	}
	public void updateHr_delete_state_2(Map<String, Object> map){
		update("updateHr_delete_state_2", map);
	}
	public void updateHr_delete_state_3(Map<String, Object> map){
		update("updateHr_delete_state_3", map);
	}
	//예약취소 신청 날짜 update
	public void updateHr_delete_date(Map<String, Object> map){
		update("updateHr_delete_date", map);
	}
	//숙소 이용 날짜계싼
	public Map<String, Object> countDate(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.countDate", map);
	}
}
