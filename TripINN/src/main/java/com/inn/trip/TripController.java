package com.inn.trip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TripController {
	
	@RequestMapping(value="/trip.do")
	public String tripForm() {
		return "tripMain";
	}
}
