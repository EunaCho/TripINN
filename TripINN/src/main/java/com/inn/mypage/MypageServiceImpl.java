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
	//에약 관리 리스트 
	@Override
	public List<Map<String, Object>> selectMy_ReserList(Map<String, Object> map) throws Exception{
		return mypageDAO.selectMy_ReserList(map);
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
	
	
	//-------트립목록 ------//

	//-------프로필------//

	//-------프로필------//

}
