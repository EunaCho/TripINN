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
import com.inn.admin.AdminMemberService;
import com.inn.admin.AdminPaging;

@Controller
public class AdminMemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminMemberService")
	private AdminMemberService adminMemberService;
	
//--------------------------------------------------------------------//	
	
	
	//페이징 구현을 위해 추가한 변수들
	   private int currentPage = 1;    //처음 표시되는 페이지 
	   private int totalCount;         //총 글 갯수
	   private int blockCount = 10;   //1페이지당 글 몇개 할건지 정하는 변수
	   private int blockPage = 5;     //한 화면에 페이지번호 몇개까지 띄울 것인지 정하는 변수
	   private String requestName;
	   private String pagingHtml;  
	   private AdminPaging page;  
	   
	   //리스트
	@RequestMapping(value="/admin/memberList.do")
	  public ModelAndView memberList(HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("memberList");
		
		//페이징  부분
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
	            || request.getParameter("currentPage").equals("0")) {
	         currentPage = 1;
	      } else {
	         currentPage = Integer.parseInt(request.getParameter("currentPage"));
	      }
		
		
		List<Map<String,Object>> list = adminMemberService.selectMemberList(commandMap.getMap());
		mv.addObject("list",list);
		
		
	      
	      totalCount = list.size();
	      page = new AdminPaging(currentPage, totalCount, blockCount, blockPage,"memberList");
	      pagingHtml = page.getPagingHtml().toString();

	      int lastCount = totalCount;

	      if (page.getEndCount() < totalCount) {
	         lastCount = page.getEndCount() + 1;
	      }
	            
	      list = list.subList(page.getStartCount(), lastCount);

	     
	      mv.addObject("totalCount", totalCount);
	      mv.addObject("pagingHtml", pagingHtml);
	      mv.addObject("currentPage", currentPage);
	      mv.addObject("list", list);
	      mv.setViewName("memberList");  
		
		return mv;
	}
	
	@RequestMapping(value="/admin/memberView.do")
	   public ModelAndView memberView(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("memberView");
		System.out.println(request.getParameter("MEMBER_IDX"));
		int member_idx = Integer.parseInt(request.getParameter("MEMBER_IDX")); 
		
		commandMap.put("member_idx", member_idx);
		
		Map<String,Object> map = adminMemberService.selectMemberView(commandMap.getMap());
		mv.addObject("map",map);
		System.out.println("member_idx: " + member_idx);
		return mv;
	}
	
	@RequestMapping(value="/admin/memberModify.do", method=RequestMethod.POST)
	   public ModelAndView memberModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("memberModify");
		
		int member_idx = Integer.parseInt(request.getParameter("MEMBER_IDX")); 
		System.out.println("member_idx : " + member_idx);
		commandMap.put("member_idx", member_idx);
		
		Map<String,Object> map = adminMemberService.selectMemberView(commandMap.getMap());
		mv.addObject("map",map);
		return mv;
	}
	
	
	@RequestMapping(value="/admin/updateMemberModify.do", method=RequestMethod.POST)
	public ModelAndView updateMemberModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/admin/memberView.do");
	    
	    System.out.println("idx : " + commandMap.get("MEMBER_IDX"));
	    System.out.println("r_idx : " + request.getParameter("MEMBER_IDX"));
	    
	    int member_idx = Integer.parseInt(request.getParameter("MEMBER_IDX"));
	    
	    commandMap.put("MEMBER_IDX", member_idx);
	    adminMemberService.updateMemberModify(commandMap.getMap());
	    
	     
	    mv.addObject("MEMBER_IDX", commandMap.get("MEMBER_IDX"));
	    return mv;
	}

	@RequestMapping(value="/admin/deleteList.do", method=RequestMethod.POST)
	public ModelAndView deleteList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/memberList.do");
		
		
        int member_idx = Integer.parseInt(request.getParameter("MEMBER_IDX"));
	    commandMap.put("MEMBER_IDX", member_idx);
	    
		adminMemberService.deleteList(commandMap.getMap());
		
		return mv;
	}
	
	
}
