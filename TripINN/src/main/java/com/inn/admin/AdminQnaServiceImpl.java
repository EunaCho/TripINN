package com.inn.admin;
 
import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;
 
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
 
//ServiceImpl = 하나의 페이지를 호출할 때 필요한 비지니스 로직을 묶어서 처리하는 곳
//상세보기시 1) 해당 게시글의 조회수를 1 증가시킨다. , 2) 게시글의 상세내용을 조회한다. 

@Service("adminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="adminQnaDAO")
    private AdminQnaDAO adminQnaDAO;
     
    //리스트
    @Override
    public Map<String, Object> qnaBoardList(Map<String, Object> map) throws Exception {
        return adminQnaDAO.qnaBoardList(map);
    }
    
    //상세보기
    @Override
    public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
        adminQnaDAO.updateQnaReadCount(map);
        Map<String, Object> resultMap = adminQnaDAO.selectQnaDetail(map);
        return resultMap;
    }
    
    /*
    public List<Map<String, Object>> qnaBoardList(Map<String, Object> map) throws Exception {
        return adminQnaDAO.qnaBoardList(map);
    }
    */
    
 
}