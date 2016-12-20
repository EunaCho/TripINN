package com.inn.mypage;

import java.util.List;
import java.util.Map;

//DAO 기능 구현
public interface MypageService {
	
	//보낸 메시지 리스트 
	List<Map<String, Object>> selectSendMsgList(Map<String, Object> map) throws Exception;
	//받은메시지 리스트 
	List<Map<String, Object>> selectReceiveMsgList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectMsgDetail(Map<String, Object> map) throws Exception;

}
