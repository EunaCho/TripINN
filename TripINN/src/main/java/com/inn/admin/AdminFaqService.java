package com.inn.admin;

import java.util.List;
import java.util.Map;


public interface AdminFaqService {
	//faq에 나타내는 리스트 유형1
	List<Map<String, Object>> faqBoardList(Map<String, Object> map) throws Exception;
	//faq에 나타내는 리스트 유형2
	List<Map<String, Object>> faqBoardList2(Map<String, Object> map) throws Exception;

	
	//faq 이용방법 글쓰기 
    void adminFaqInsert(Map<String, Object> map) throws Exception;
    
    //faq 수정
	void adminFaqUpdate(Map<String, Object> map) throws Exception;

	//faq 상세보기용
    Map<String, Object> adminFaqSelectDetail(Map<String, Object> map) throws Exception;

    //faq 삭제
	void adminFaqDelete(Map<String, Object> map) throws Exception;
	
	
	
    

}