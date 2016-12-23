package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.inn.admin.AdminFaqService;

@Controller
public class AdminFaqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminFaqService")
    private AdminFaqService adminFaqService;
	
	@RequestMapping(value="/admin/faqList.do")
	public ModelAndView adminFaqList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("faqList");
         
        List<Map<String,Object>> list = adminFaqService.FaqBoardList(commandMap);
        mv.addObject("list", list);
         
        return mv;
    }
	
	
	@RequestMapping(value="/admin/faqWrite.do")
    public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("faqWrite");
         
        return mv;
    }
    
    
	
	
}