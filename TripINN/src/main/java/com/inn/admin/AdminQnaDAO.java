package com.inn.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;
 
@Repository("adminQnaDAO")
public class AdminQnaDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("admin.selectBoardList", map);
    }
 
}