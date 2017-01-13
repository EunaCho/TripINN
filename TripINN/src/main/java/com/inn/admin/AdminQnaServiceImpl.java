package com.inn.admin;


import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;
 
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.common.common.CommandMap;

import org.mybatis.spring.SqlSessionTemplate;

//ServiceImpl = 하나의 페이지를 호출할 때 필요한 비지니스 로직을 묶어서 처리하는 곳
//상세보기시 1) 해당 게시글의 조회수를 1 증가시킨다. , 2) 게시글의 상세내용을 조회한다. , 3)댓글목록을 불러온다.

@Service("adminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="adminQnaDAO")
    private AdminQnaDAO adminQnaDAO;
    
    //리스트
    @Override
    public List<Map<String, Object>> qnaBoardList(Map<String, Object> map) throws Exception {
        return adminQnaDAO.qnaBoardList(map);  
    }
    
    //검색
    	//제목으로 검색
  		@Override
  		public List<Map<String,Object>> search0(Map<String,Object> map) {
  			return adminQnaDAO.search0(map);
  		}
  		
  		//내용으로 검색
  		@Override
  		public List<Map<String,Object>> search1(Map<String,Object> map) {
  			return adminQnaDAO.search1(map);
  		}
  		
  		//작성자로 검색
  		@Override
  		public List<Map<String,Object>> search2(Map<String,Object> map) {
  			return adminQnaDAO.search2(map);
  		}
    
    //글쓰기
    @Override
    public void adminQnaInsertPro(Map<String, Object> map) throws Exception {
    	adminQnaDAO.adminQnaInsertPro(map);
    }

    
    //상세보기
    @Override
    public Map<String, Object> adminQnaSelectDetail(Map<String, Object> map) throws Exception {
        adminQnaDAO.updateQnaReadCount(map); //조회수 증가
 
        Map<String, Object> resultMap = adminQnaDAO.adminQnaSelectDetail(map);
        

        return resultMap;
    }
    	//댓글리스트
    	@Override
    	public List<Map<String, Object>> qnaCommList(Map<String, Object> map) throws Exception {	
    		return adminQnaDAO.qnaCommList(map);
    	}
    	
    
    	//댓글쓰기
    	@Override
    	public void qnaCommWrite(Map<String, Object> map) throws Exception {
    		
    		adminQnaDAO.qnaCommWrite(map);
    		
    	}
    	
    	//댓글삭제
    	@Override
    	public void qnaCommDelete(Map<String, Object> map) throws Exception {

    		adminQnaDAO.qnaCommDelete(map);

    		
    	}
    
    	
    
    //수정하기
    @Override
    public void adminQnaUpdatePro(Map<String, Object> map) throws Exception{
        adminQnaDAO.adminQnaUpdatePro(map);
    }
    
    //삭제하기
    @Override
    public void adminQnaDelete(Map<String, Object> map) throws Exception {

        adminQnaDAO.adminQnaDelete(map);

    }

	
	
    
    
    
    /*
    public List<Map<String, Object>> qnaBoardList(Map<String, Object> map) throws Exception {
        return adminQnaDAO.qnaBoardList(map);
    }
    */
    
 
}