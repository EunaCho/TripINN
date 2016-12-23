package com.inn.house;

import java.util.List;
import java.util.Map; //sql map 형식 연결

import javax.annotation.Resource; //service 클래스 연결
import javax.servlet.http.HttpServletRequest; //jsp data

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller; //controller 클래스 등록 위함
import org.springframework.web.bind.annotation.RequestMapping; //jsp와 클래스 연결
import org.springframework.web.servlet.ModelAndView; //jsp view

import com.inn.house.HouseService; // interface 숙소 등록
import com.common.common.CommandMap; // sql key 설정


@Controller
public class HouseController {
	
	Logger log = Logger.getLogger(this.getClass()); //데이터 찍기
	
	@Resource(name="houseService")//service class 연결
	private HouseService houseService; // interface 연결
	
	//house list mapping
	@RequestMapping(value="/house/houseMain.do")
	public ModelAndView houseList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("houseMain"); // tilse에 등록된 jsp
		
		List<Map<String, Object>> list = houseService.selectHouseList(commandMap.getMap());
		mv.addObject("list",list); // list에 담은 데이터를 보여주기 위함.
		return mv;
	}
	
	//house register view mapping
	@RequestMapping(value="/house/openHouseRegister.do")
	public ModelAndView houseRegisterMain(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("openHouseRegister"); // tilse에 등록된 jsp
		return mv;
	}
	
	//house register view mapping detail 1
	@RequestMapping(value="/house/openHouseRegister1.do")
	public ModelAndView houseRegisterView1(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("houseRegister1");
		return mv;
	}
	//house register insert view mapping detail 1-1
	//INSERT 후의  페이지
	@RequestMapping(value="/house/houseInsertRegister1.do")
	public ModelAndView houseRegisterResult1(CommandMap map, HttpServletRequest request) throws Exception{
//		ModelAndView mv = new ModelAndView("redirect:/house/openHouseRegister2.do");
		//houseService.insertHouse(map.getMap(), request);
//		mv.addObject("HOUSE_NAME", map.get("HOUSE_NAME"));
		ModelAndView mv = new ModelAndView("houseRegister2");
		return mv;
	}
	
	//house register view mapping detail 2
	@RequestMapping(value="/house/openHouseRegister2.do")
	public ModelAndView houseRegisterView2(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("houseRegister2");
		return mv;
	}
/*	
	//house register insert view mapping detail 2
	@RequestMapping(value="/house/openHouseRegister2.do")
	public ModelAndView houseReegisterResult2(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/house/houseMain.do");
		
		houseService.insertHouse(map.getMap(), request);
		return mv;
	}*/
	
	//houseregister insert mapping
	@RequestMapping(value="/house/insertHouseRegister.do")
	public ModelAndView insertHouseRegister(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("insertHouseRegister"); // tilse에 등록된 jsp
		houseService.insertHouse(commandMap.getMap(), request);
		
		return mv;
	}
	
}
