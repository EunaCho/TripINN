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
	
	//리스트
	@Override
	public List<Map<String, Object>> faqBoardList(Map<String, Object> map) throws Exception {
		return adminFaqDAO.faqBoardList(map);
		
	}

	//글쓰기
	@Override
	public void adminFaqInsert(Map<String, Object> map) throws Exception {
		adminFaqDAO.adminFaqInsert(map);
	}
	
	
	//수정하기
	@Override
	public void adminFaqUpdate(Map<String, Object> map) throws Exception {
		adminFaqDAO.adminFaqUpdate(map);
	}
	
	//상세보기
    @Override
    public Map<String, Object> adminFaqSelectDetail(Map<String, Object> map) throws Exception {
 
        Map<String, Object> resultMap = adminFaqDAO.adminFaqSelectDetail(map);
        return resultMap;
    }
    
    //삭제하기
    @Override
    public void adminFaqDelete(Map<String, Object> map) throws Exception {
        adminFaqDAO.adminFaqDelete(map);
    }
	
}
