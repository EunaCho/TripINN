package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.inn.admin.AdminFaqService;

@Controller
public class AdminFaqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminFaqService")
    private AdminFaqService adminFaqService;
	
	//faq 리스트 이용방법
	@RequestMapping(value="/admin/faqList.do")
	public ModelAndView adminFaqList(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("howToUse");
        List<Map<String,Object>> list = adminFaqService.faqBoardList(commandMap.getMap());
        mv.addObject("list", list);
        
        return mv;
    }
	
	//faq 리스트 여행방법
		@RequestMapping(value="/admin/faqList1.do")
		public ModelAndView adminFaqList1(CommandMap commandMap) throws Exception{
	        ModelAndView mv = new ModelAndView("howToTrip");
	        List<Map<String,Object>> list = adminFaqService.faqBoardList(commandMap.getMap());
	        mv.addObject("list", list);
	        
	        return mv;
	    }
	
		
		
		
		
	//faq 이용방법 글쓰기폼
	@RequestMapping(value="/admin/faqWrite.do")
    public ModelAndView adminFaqWrite(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("faqWrite");
        
        return mv;
    }
    
    //faq 이용방법 글쓰기 처리
    @RequestMapping(value="/admin/faqWriteInsert.do")
    public ModelAndView adminFaqInsert(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do");
        
        adminFaqService.adminFaqInsert(commandMap.getMap());
         
        return mv;
    }
    
    //faq 수정폼
    @RequestMapping(value="/admin/faqUpdate.do")
    public ModelAndView adminFaqUpdate(CommandMap commandMap , HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("faqUpdate");
 
        Map<String,Object> map = adminFaqService.adminFaqSelectDetail(commandMap.getMap()); 
        mv.addObject("map", map);     //맵을 모델앤뷰 객체에 담음
         
        return mv;
    }
    
  //faq 수정처리(저장)
    @RequestMapping(value="/admin/faqUpdatePro.do")
    public ModelAndView adminFaqUpdate(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do");
        adminFaqService.adminFaqUpdate(commandMap.getMap());

        //해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
        mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
        return mv;
    }
    
    //faq 삭제
    @RequestMapping(value="/admin/faqDelete.do")
    public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do");	
        adminFaqService.adminFaqDelete(commandMap.getMap());
        return mv;
    }

  
    
    
	
	
}