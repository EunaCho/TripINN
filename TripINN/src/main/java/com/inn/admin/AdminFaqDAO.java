package com.inn.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.common.common.AbstractDAO;


@Repository("adminFaqDAO")
public class AdminFaqDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("admin.faqBoardList", map);
	}

	//글쓰기
	public void adminFaqInsert(Map<String, Object> map) throws Exception{
		insert("admin.adminFaqInsert", map);
	} 
	
	//수정
	public void adminFaqUpdate(Map<String, Object> map) throws Exception{
		update("admin.adminFaqUpdate", map);
	}

	//상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminFaqSelectDetail(Map<String, Object> map) throws Exception{
		   return (Map<String, Object>) selectOne("admin.adminFaqSelectDetail", map);
	}

	//삭제하기
	public void adminFaqDelete(Map<String, Object> map) throws Exception{
		delete("admin.adminFaqDelete", map);
	}
}