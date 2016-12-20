package com.inn.trip;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
}
