package com.inn.mypage;

import java.util.List;
import java.util.Map;

//DAO 기능 구현
public interface MypageService {
	
	List<Map<String, Object>> selectSendMsgList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectReceiveMsgList(Map<String, Object> map) throws Exception;

}
