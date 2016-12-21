package com.inn.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;
 
@Repository("adminQnaDAO")
public class AdminQnaDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
    public Map<String, Object> qnaBoardList(Map<String, Object> map) throws Exception{
        return (Map<String, Object>)selectPagingList("admin.qnaBoardList", map);
    }
 
}