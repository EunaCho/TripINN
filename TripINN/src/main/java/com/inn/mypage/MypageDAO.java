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

	public void house_rsv_del(String hr_idx) {
		delete("mypage.houseRsvDel", hr_idx);
	}
}
