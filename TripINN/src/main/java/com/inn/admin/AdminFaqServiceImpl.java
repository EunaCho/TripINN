package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminFaqService")
public class AdminFaqServiceImpl implements AdminFaqService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminFaqDAO")
    private AdminFaqDAO adminFaqDAO;
	
	@Override
	public List<Map<String, Object>> FaqBoardList(Map<String, Object> map) throws Exception {
		return adminFaqDAO.FaqBoardList(map);
	}
	
	
}
