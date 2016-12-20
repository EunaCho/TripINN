package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.inn.admin.AdminMemberService;

@Controller
public class AdminMemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminMemberService")
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/admin/memberList.do")
	  public ModelAndView memberList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("memberList");
		
		List<Map<String,Object>> list = adminMemberService.selectMemberList(commandMap.getMap());
		mv.addObject("list",list);
		
		return mv;
	}
	
	@RequestMapping("/admin/memberView.do")
	   public String memberView() {
	      
	      return "memberView";
	   }
	
	@RequestMapping("/admin/memberModify.do")
	   public String memberModify() {
	      
	      return "memberModify";
	   }
	
	
}
