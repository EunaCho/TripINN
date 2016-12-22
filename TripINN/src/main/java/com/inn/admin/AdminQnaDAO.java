package com.inn.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;
//DB에 접속하여 데이터를 조회하는 역할만 수행하는 클래스

@Repository("adminQnaDAO")
public class AdminQnaDAO extends AbstractDAO{
	
	//리스트
	@SuppressWarnings("unchecked")
    public Map<String, Object> qnaBoardList(Map<String, Object> map) throws Exception{
        return (Map<String, Object>)selectPagingList("admin.qnaBoardList", map);
    }
	
	//조회수 증가
	public void updateQnaReadCount(Map<String, Object> map) throws Exception{
	    update("admin.updateQnaReadCount", map);
	}
	
	//상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>) selectOne("admin.selectQnaDetail", map);
	}
 
}