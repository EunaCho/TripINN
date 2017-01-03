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
    
    //리스트
    @RequestMapping(value="/admin/qnaList.do")
    public ModelAndView adminQnaList(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("qnaList");
        
        
     
        //반환시킨 맵을 리절트맵에 담음
        Map<String,Object> resultMap = adminQnaService.qnaBoardList(commandMap.getMap());
        
        //paginationInfo와 result를 mv에 담아줌
        mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
        mv.addObject("list", resultMap.get("result"));
          
        return mv;
    }   
    //글쓰기 폼
    @RequestMapping(value="/admin/qnaWrite.do")
    public ModelAndView adminQnaWrite(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("qnaWrite");
         
        return mv;
    }
    
    //글쓰기 처리
    @RequestMapping(value="/admin/qnaInsertPro.do")
    public ModelAndView adminQnaInsertPro(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/admin/qnaList.do");
         
        adminQnaService.adminQnaInsertPro(commandMap.getMap());
         
        return mv;
    }
    
    
    //상세보기
    @RequestMapping(value="/admin/qnaDetail.do")
    public ModelAndView adminQnaDetail(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("qnaDetail");
             
        Map<String,Object> map = adminQnaService.adminQnaSelectDetail(commandMap.getMap());
        mv.addObject("map", map);
             
        return mv;
    }
    
    //수정폼
    @RequestMapping(value="/admin/qnaUpdate.do")
    public ModelAndView adminQnaUpdate(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("qnaUpdate");
         
        Map<String,Object> map = adminQnaService.adminQnaSelectDetail(commandMap.getMap());
        mv.addObject("map", map);
         
        return mv;
    }
    
    //수정처리(저장)
    @RequestMapping(value="/admin/qnaUpdatePro.do")
    public ModelAndView adminQnaUpdatePro(CommandMap commandMap) throws Exception{
    	System.out.println("글번호1:" + commandMap.get("QNA_IDX"));
    	System.out.println("글제목1:" + commandMap.get("QNA_TITLE"));
    	System.out.println("글내용1:" + commandMap.get("QNA_CONTENT"));
    	
    	
        ModelAndView mv = new ModelAndView("redirect:/admin/qnaDetail.do");
         
        adminQnaService.adminQnaUpdatePro(commandMap.getMap());
        
        System.out.println("글번호2:" + commandMap.get("QNA_IDX"));
    	System.out.println("글제목2:" + commandMap.get("QNA_TITLE"));
    	System.out.println("글내용2:" + commandMap.get("QNA_CONTENT"));
        

        //해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
        mv.addObject("QNA_IDX", commandMap.get("QNA_IDX"));
        return mv;
    }
    
    //삭제하기
    @RequestMapping(value="/admin/qnaDelete.do")
    public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
        
    	ModelAndView mv = new ModelAndView("redirect:/admin/qnaList.do");
         
        adminQnaService.adminQnaDelete(commandMap.getMap());
         
        return mv;
    }
    
    
        
}