package com.inn.admin;

import java.util.List;
import java.util.Map;

public interface AdminQnaService {
	//리턴값을 list에서 Map으로 변경하였음
	//리스트
	Map<String, Object> qnaBoardList(Map<String, Object> map) throws Exception;
	
	//글쓰기 
    void adminQnaInsertPro(Map<String, Object> map) throws Exception;
	
	//상세보기    
    Map<String, Object> adminQnaSelectDetail(Map<String, Object> map) throws Exception;

    //수정하기
	void adminQnaUpdatePro(Map<String, Object> map) throws Exception;
	
	//삭제하기
	void adminQnaDelete(Map<String, Object> map) throws Exception;
	
	
}
