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
	
	
	//-------메시지 ------//
	//보낸메시지 리스트 
	@Override
	public List<Map<String, Object>> selectSendMsgList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectSendMsgList(map);
	}
	//받은메시지 리스트 
	@Override
	public List<Map<String, Object>> selectReceiveMsgList(Map<String, Object> map) throws Exception{
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
	
	//-------숙소목록------//
	
	//숙소목록 리스트
	@Override
	public List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectHouseList(map);
	}

	//숙소 상세보기 
	@Override
	public Map<String, Object> selectHouseDetail(Map<String, Object> map) throws Exception{
		return mypageDAO.selectHouseDetail(map);
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
	
	
	//-------트립목록 ------//

	//-------프로필------//


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

	@Override
	public void house_rsv_del(String hr_idx) {
		mypageDAO.house_rsv_del(hr_idx);
	}
	
	//-------프로필------//

}
