package com.inn.trip;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.common.common.ConvertAddress;


@Controller
public class TestController {
	
	@Resource(name="testService")
	private TestService testService;
	
	@RequestMapping(value="/test2.do", method=RequestMethod.GET)
	public ModelAndView test2() throws Exception {
		ModelAndView mv = new ModelAndView("test2");
		
		return mv;
	}
	
	@RequestMapping(value="/test3.do", method=RequestMethod.POST)
	public ModelAndView test2(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("test2");
		
		System.out.println("testTitle : " + commandMap.get("testTitle"));
		testService.insertTest(commandMap.getMap(), request);
		
		return mv;
	}
	
	
	
	
}
