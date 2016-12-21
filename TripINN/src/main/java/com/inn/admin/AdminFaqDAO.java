package com.inn.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.common.common.AbstractDAO;


@Repository("adminFaqDAO")
public class AdminFaqDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> FaqBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("admin.FaqBoardList", map);
	}
}