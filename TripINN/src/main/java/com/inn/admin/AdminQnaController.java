package com.inn.admin;
 
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.inn.admin.AdminQnaService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
 
@Controller
public class AdminQnaController {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="adminQnaService")
    private AdminQnaService adminQnaService;
    
    
    @RequestMapping(value="/admin/qnaList.do")
    public ModelAndView adminQnaList(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("qnaList");
        
        
        //페이징을 위해 수정된 부분
        //반환시킨 맵을 리절트맵에 담음
        Map<String,Object> resultMap = adminQnaService.qnaBoardList(commandMap.getMap());
        
        //paginationInfo와 result를 mv에 담아줌
        mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
        mv.addObject("list", resultMap.get("result"));
        
        
        //List<Map<String,Object>> list = adminQnaService.QnaBoardList(commandMap);
        //mv.addObject("list", list);
         
        return mv;
    }
    
    
    
}