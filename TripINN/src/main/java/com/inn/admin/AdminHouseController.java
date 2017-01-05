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
public class AdminHouseController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminHouseService")
	private AdminHouseService adminHouseService;
	
//----------------------------------------------------------------------------//	
	@RequestMapping(value="/admin/houseList.do")
	  public ModelAndView houseList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("houseList");
		
		List<Map<String,Object>> list = adminHouseService.selectHouseList(commandMap.getMap());
		mv.addObject("list",list);
		
		return mv;
	}
	//-------------------------------------------------------------------------//
	@RequestMapping(value="/admin/houseReportList.do")
	  public ModelAndView houseReportList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("houseReportList");
		
		List<Map<String,Object>> list = adminHouseService.selectHouseReportList(commandMap.getMap());
		mv.addObject("list",list);
		
		return mv;
	}
	//-----------------------------------------------------------------------------//
	@RequestMapping(value="/admin/houseReportDelete.do", method=RequestMethod.POST)
	public ModelAndView houseReportDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/houseList.do");
		                                   
		
        int report_idx = Integer.parseInt(request.getParameter("REPORT_IDX"));
	    commandMap.put("REPORT_IDX", report_idx);
	    
		adminHouseService.houseReportDelete(commandMap.getMap());
		
		return mv;
	}
}