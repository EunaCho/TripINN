package com.inn.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.inn.house.HouseService;

@Controller
public class MainController {
	
	@Resource(name="houseService")
	private HouseService houseService;
	
	@RequestMapping("/main.do")
	public ModelAndView main(CommandMap commandMap) throws Exception {
		System.out.println(1);
		ModelAndView mv = new ModelAndView("main");//tiles definition name
		System.out.println(2);
		//하우스 미리보기 출력용 리스트 생성
		List<Map<String, Object>> houseList = houseService.selectHouseList(commandMap.getMap());
		System.out.println(3);
		mv.addObject("houseList", houseList);
		System.out.println(4);
		
		//트립 미리보기 출력용 리스트 생성
		//List<Map<String, Object>> tripList = tripService.selectTripList(commandMap.getMap());
		//mv.addObject("tripList", tripList);
		System.out.println(mv);
		return mv; 
	}
}
