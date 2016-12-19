package com.inn.admin;
 
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.inn.admin.AdminQnaService;
 
@Controller
public class AdminQnaController {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="adminQnaService")
    private AdminQnaService adminQnaService;
     
    @RequestMapping(value="/admin/qnaList.do")
    public ModelAndView AdminQnaList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/views/admin/qna/list");
         
        List<Map<String,Object>> list = adminQnaService.selectBoardList(commandMap);
        mv.addObject("list", list);
         
        return mv;
    }
}