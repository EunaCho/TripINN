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


<<<<<<< HEAD
	
	
=======
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
	//메시지 상세보기 
	@Override
	public Map<String, Object> selectMsgDetail(Map<String, Object> map) throws Exception{
		return mypageDAO.selectMsgDetail(map);
	}
	
	//-------숙소목록------//
	
	//숙소목록 리스트
	@Override
	public List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception{
		
		return mypageDAO.selectHouseList(map);
	}

	//숙소 상세보기 
	@Override
	public Map<String, Object> selectHousetDetail(Map<String, Object> map) throws Exception{
		
		return mypageDAO.selectHousetDetail(map);
	}
	
	
	//-------트립목록 ------//
	//-------프로필------//
}
