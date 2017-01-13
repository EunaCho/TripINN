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

@Controller
public class AdminTripController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminTripService")
	private AdminTripService adminTripService;
	
	//페이징 구현을 위해 추가한 변수들
    private int currentPage = 1;    //처음 표시되는 페이지 
    private int totalCount;         //총 글 갯수
    private int blockCount = 2;   //1페이지당 글 몇개 할건지 정하는 변수
    private int blockPage = 2;     //한 화면에 페이지번호 몇개까지 띄울 것인지 정하는 변수
    private String requestName;
    private String pagingHtml;  
    private AdminPaging page; 
	
//----------------------------------------------------------------------------//	
	@RequestMapping(value="/admin/adminTripList.do")
	  public ModelAndView adminTripList(HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("adminTripList");
		
		//페이징  부분
	      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
	               || request.getParameter("currentPage").equals("0")) {
	            currentPage = 1;
	         } else {
	           System.out.println("뭐라고"+currentPage);
	            currentPage = Integer.parseInt(request.getParameter("currentPage"));
	            System.out.println("떴냐?"+currentPage);
	         }
		
		List<Map<String,Object>> list = adminTripService.selectTripList(commandMap.getMap());
		//mv.addObject("list",list);
		
		totalCount = list.size();
        
        page = new AdminPaging(currentPage, totalCount, blockCount, blockPage,"adminTripList");
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
        mv.setViewName("adminTripList");  
     
     return mv;
	}
//-------------------------------------------------------------------------------------//	
	@RequestMapping(value="/admin/adminTripReportList.do")
	  public ModelAndView adminTripReportList(HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("adminTripReportList");
		
		//페이징  부분
	      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
	               || request.getParameter("currentPage").equals("0")) {
	            currentPage = 1;
	         } else {
	           System.out.println("뭐라고"+currentPage);
	            currentPage = Integer.parseInt(request.getParameter("currentPage"));
	            System.out.println("떴냐?"+currentPage);
	         }
		
		List<Map<String,Object>> list = adminTripService.selectTripReportList(commandMap.getMap());
		//mv.addObject("list",list);
		
totalCount = list.size();
        
        page = new AdminPaging(currentPage, totalCount, blockCount, blockPage,"adminTripReportList");
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
        mv.setViewName("adminTripReportList");  
     
     return mv;
	}
}
