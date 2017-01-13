package com.inn.admin;

import java.util.List;
import java.util.Map;

import com.common.common.CommandMap;


public interface AdminQnaService {
	//리스트
	List<Map<String, Object>> qnaBoardList(Map<String, Object> map) throws Exception;
	
	//검색 (0=제목, 1=내용, 2=이름)
		List<Map<String,Object>> search0(Map<String,Object> map);
		List<Map<String,Object>> search1(Map<String,Object> map);
		List<Map<String,Object>> search2(Map<String,Object> map);
	
	
	//글쓰기 
    void adminQnaInsertPro(Map<String, Object> map) throws Exception;
	
	//상세보기    
    Map<String, Object> adminQnaSelectDetail(Map<String, Object> map) throws Exception;  	
    	
  		//댓글리스트	
    	List<Map<String, Object>> qnaCommList(Map<String, Object> map) throws Exception;
    
  		//댓글쓰기
  		void qnaCommWrite(Map<String, Object> map) throws Exception;
  		
  		//댓글삭제
  		void qnaCommDelete(Map<String, Object> map) throws Exception;
 
  		
    //수정하기
	void adminQnaUpdatePro(Map<String, Object> map) throws Exception;
	
	//삭제하기
	void adminQnaDelete(Map<String, Object> map) throws Exception;

	


	
	
	
	
}
