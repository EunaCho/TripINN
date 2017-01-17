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
	
//----------------------------------------------------------------------------//	
	@RequestMapping(value="/admin/adminTripList.do")
	  public ModelAndView adminTripList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("adminTripList");
		
		List<Map<String,Object>> list = adminTripService.selectTripList(commandMap.getMap());
		mv.addObject("list",list);
		
		return mv;
	}
//-------------------------------------------------------------------------------------//	
	@RequestMapping(value="/admin/adminTripReportList.do")
	  public ModelAndView adminTripReportList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("adminTripReportList");
		
		List<Map<String,Object>> list = adminTripService.selectTripReportList(commandMap.getMap());
		mv.addObject("list",list);
		
		return mv;
	}
}
