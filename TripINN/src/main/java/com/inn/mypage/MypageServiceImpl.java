package com.inn.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("mypageService") //service등록 
public class MypageServiceImpl implements MypageService{
	
	Logger log = Logger.getLogger(this.getClass()); 
	
	@Resource(name="mypageDAO")// @Repository에 DAO 등록 
	private MypageDAO mypageDAO;
	
	//---------------------------------알림판 -------------------------------------------
	@Override
	public Map<String, Object> selectMember(Map<String, Object> map) throws Exception{
		return mypageDAO.selectMember(map);
	}
	
	//-----------------------------------------메시지 ---------------------------------------------//
	//보낸메시지 리스트 
	@Override
	public Map<String, Object> selectSendMsgList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectSendMsgList(map);
	}
	//받은메시지 리스트 
	@Override
	public Map<String, Object> selectReceiveMsgList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectReceiveMsgList(map);
	}
	//보낸 메시지 상세보기 
	@Override
	public Map<String, Object> selectSendMsgDetail(Map<String, Object> map) throws Exception{
		return mypageDAO.selectSendMsgDetail(map);
	}
	//받은메시지 상세보기 
	@Override
	public Map<String, Object> selectReceiveMsgDetail(Map<String, Object> map) throws Exception{
		return mypageDAO.selectReceiveMsgDetail(map);
	}
	//msg_date update
	@Override
	public void updateMsg_state(Map<String, Object> map) throws Exception{
		mypageDAO.updateMsg_state(map);
	}
	//메시지 쓰기
	@Override
	public void insertMsgWrite(Map<String, Object> map) throws Exception{
		mypageDAO.insertMsgWrite(map);
	}
	
	//----------------------------------------숙소목록---------------------------------------------//
	
	//숙소목록 리스트
	@Override
	public Map<String, Object> selectHouseList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectHouseList(map);
	}
	//숙소 상세보기 
	@Override
	public Map<String, Object> selectHouseDetail(Map<String, Object> map) throws Exception{
		return mypageDAO.selectHouseDetail(map);
	}
	//숙소 목록 리스트 상세보기 ->숙소 수정하기 
	@Override
	public Map<String, Object> selectHouseModify(Map<String, Object> map) throws Exception{
		return mypageDAO.selectHouseModify(map);
	}
	//해당 숙소 예약 현황 리스트
	@Override
	public List<Map<String, Object>> selectH_ReserList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectH_ReserList(map);
	}
	//해당 숙소 메시지 리스트
	@Override
	public List<Map<String, Object>> selectH_MsgList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectH_MsgList(map);
	}
	//에약 관리 리스트 
	@Override
	public List<Map<String, Object>> selectMy_ReserList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectMy_ReserList(map);
	}
	//예약 취소 리스트 
	@Override
	public List<Map<String,Object>> selectH_ReserDeleteList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectH_ReserDeleteList(map);
	}
	//예약관리 상세보기 
	@Override
	public Map<String, Object> selectReserDetail(Map<String, Object> map) throws Exception{
		return mypageDAO.selectReserDetail(map);
	}
	//update hr_delete_state
	@Override
	public void updateHr_delete_state_1(Map<String, Object> map) throws Exception{
		mypageDAO.updateHr_delete_state_1(map);
	}
	public void updateHr_delete_state_2(Map<String, Object> map) throws Exception{
		mypageDAO.updateHr_delete_state_2(map);
	}
	public void updateHr_delete_state_3(Map<String, Object> map) throws Exception{
		mypageDAO.updateHr_delete_state_3(map);
	}
	//예약취소 신청날짜 update
	public void updateHr_delete_date(Map<String, Object> map) throws Exception{
		mypageDAO.updateHr_delete_date(map);
	}
	
	//숙소이용날짜 
	@Override 
	public Map<String, Object> countDate(Map<String, Object> map) throws Exception{
		return mypageDAO.countDate(map);
	}
	
	
	//------------------------------트립목록 ------------------------------------//
	//트립목록
	@Override 
	public Map<String, Object> selectTripList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectTripList(map);
	}
	//트립리스트 상세보기 
	@Override 
	public Map<String, Object> selectTripDetail(Map<String, Object> map) throws Exception{
		return mypageDAO.selectTripDetail(map);
	}
	//해당트립 예약 현황 리스트
	@Override 
	public List<Map<String, Object>> selectT_ReserList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectT_ReserList(map);
	}
	//해당 트립 메시지 리스트 
	@Override 
	public List<Map<String, Object>> selectT_MsgList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectT_MsgList(map);
	}
	//예약관리 리스트 
	@Override 
	public List<Map<String, Object>> selectMy_TReserList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectMy_TReserList(map);
	}
	//예약관리 예약 상세보기 
	@Override 
	public Map<String, Object> selectT_ReserDetail(Map<String, Object> map) throws Exception{
		return mypageDAO.selectT_ReserDetail(map);
	}
	//예약취소 목록에서 숙소 삭제
	@Override
	public void deleteReserDelete(Map<String, Object> map) throws Exception{
		mypageDAO.deleteReserDelete(map);
	}
	
	//에약 취소 상태 update
	@Override 
	public void updateTr_delete_state1(Map<String, Object> map) throws Exception{
		mypageDAO.updateTr_delete_state1(map);
	}
	@Override 
	public void updateTr_delete_state2(Map<String, Object> map) throws Exception{
		mypageDAO.updateTr_delete_state2(map);
	}
	@Override 
	public void updateTr_delete_state3(Map<String, Object> map) throws Exception{
		mypageDAO.updateTr_delete_state3(map);
	}
	//deletedate update
	@Override 
	public void updateTr_delete_date(Map<String, Object> map) throws Exception{
		mypageDAO.updateTr_delete_date(map);
	}
	//예약 취소 리스트
	@Override
	public List<Map<String, Object>> selectT_ReserDeleteList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectT_ReserDeleteList(map);
	}
	
	//예약취소 리스트에서 예약취소 목록 삭제하기 
	@Override
	public void deleteT_ReserDelete(Map<String, Object> map) throws Exception{
		mypageDAO.deleteT_ReserDelete(map);
	}
	//-------프로필------//
	@Override
	public void updateMemberPlofile(Map<String, Object> map) throws Exception{
		mypageDAO.updateMemberPlofile(map);
	}
	//----------------------------------------------위시리스트 --------------------------
	@Override
	public Map<String, Object> selectMy_HouseList(Map<String, Object> map) throws Exception {
		return mypageDAO.selectMy_HouseList(map);
	}

	@Override
	public Map<String, Object> selectMy_TripList(Map<String, Object> map) throws Exception {

		return mypageDAO.selectMy_TripList(map) ;
	}
	//숙소 위시리스트 삭제
	@Override
	public void deleteHouseWish(Map<String, Object> map) throws Exception{
		mypageDAO.deleteHouseWish(map);
	}
	//트립위시리스트 삭제 
	@Override
	public void deleteTripWish(Map<String, Object> map) throws Exception{
		mypageDAO.deleteTripWish(map);
	}

	@Override
	public void messageDel(String msg_idx) {
		mypageDAO.messageDel(msg_idx);
	}
	
	//-------프로필------//

}
