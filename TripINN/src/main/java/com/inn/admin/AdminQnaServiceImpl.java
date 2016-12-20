package com.inn.admin;
 
import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;
 
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
 
@Service("adminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="adminQnaDAO")
    private AdminQnaDAO adminQnaDAO;
     
    @Override
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
        return adminQnaDAO.selectBoardList(map);
    }
 
}