package com.inn.trip;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.common.common.CommandMap;
import com.common.common.ConvertAddress;

@Controller
public class TripController {
	
	@Resource(name="tripService")
	private TripService tripService;
	
	@RequestMapping(value="/trip.do")
	public String tripForm() {
		return "tripMain";
	}
	
	@RequestMapping(value="/tripRegist.do", method=RequestMethod.POST) //트립 등록
	public ModelAndView tripRegist(CommandMap commandMap, HttpServletRequest request,
				HttpSession session, @RequestParam(value="trip_include",required=true) List<String> inc_list) 
				throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/trip.do");
		String trip_include = "";
		for(String inc : inc_list) {
			trip_include = trip_include + inc + "|";
		}
		System.out.println("trip_zipcode : " + commandMap.get("trip_zipcode"));
		System.out.println("trip_addr1 : " + commandMap.get("trip_addr1"));
		System.out.println("trip_addr2 : " + commandMap.get("trip_addr2"));
		System.out.println("trip_addr3 : " + commandMap.get("trip_addr3"));
		//commandMap.put("member_idx", session.getAttribute("member_idx"));
		commandMap.put("member_idx", 1);
		commandMap.put("trip_include", trip_include);
		tripService.tripRegist(commandMap.getMap(), request);
		return mv;
	}
	
	@RequestMapping(value="/tripRegistForm.do", method=RequestMethod.POST) //트립 등록 폼 이동
	public ModelAndView tripRegistForm(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("tripRegistForm");
		mv.addObject("trip_area", request.getParameter("trip_area"));
		mv.addObject("trip_type", request.getParameter("trip_type"));
		
		return mv;
	}
	
	@RequestMapping(value="/tripMapView.do", method=RequestMethod.GET) // 지도 업데이트
	public ModelAndView tripMapView(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/trip/tripMapView");
		String addr1 = request.getParameter("addr");
		
		
		String map = ConvertAddress.conAddr(addr1);
		String lat = map.substring(map.indexOf("lat")+5, map.indexOf("lat")+16).trim();
		String lng = map.substring(map.indexOf("lng")+5, map.indexOf("lng")+16).trim();
		String ba = ConvertAddress.decode(map.substring(map.indexOf("buildingAddress")+18, map.indexOf("title")-3).trim()); // 
		mv.addObject("lat", lat);
		mv.addObject("lng", lng);
		mv.addObject("ba", ba);
		
		System.out.println("lat : " + lat + "// lng : "  + lng + "// ba : " + ba);

		return mv;
	}
}
