package com.inn.trip;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.ConvertAddress;

@Controller
public class TripController {
	
	@RequestMapping(value="/trip.do")
	public String tripForm() {
		return "tripMain";
	}
	
	@RequestMapping(value="/tripRegistForm.do", method=RequestMethod.POST)
	public ModelAndView tripRegistForm(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("tripRegistForm");
		mv.addObject("trip_area", request.getParameter("trip_area"));
		mv.addObject("trip_type", request.getParameter("trip_type"));
		
		return mv;
	}
	
	@RequestMapping(value="/tripMapView.do", method=RequestMethod.GET)
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
