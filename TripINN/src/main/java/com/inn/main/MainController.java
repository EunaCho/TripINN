package com.inn.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.inn.house.HouseService;
import com.inn.trip.TripService;

@Controller
public class MainController {
	
	@Resource(name="houseService")
	private HouseService houseService;
	
	@Resource(name="tripService")
	private TripService tripService;
	
	@RequestMapping("/main.do")
	public ModelAndView main(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("main");//tiles definition name
		//하우스 미리보기 출력용 리스트 생성
		List<Map<String, Object>> houseList = houseService.selectHouseList(commandMap.getMap());
		mv.addObject("houseList", houseList);
		
		//트립 미리보기 출력용 리스트 생성
		Map<String, Object> tripList = tripService.selectTripList(commandMap.getMap());
		 if(tripList != null) {
				mv.addObject("tripList", tripList.get("result")); 
		 }

		return mv; 
	}
}
