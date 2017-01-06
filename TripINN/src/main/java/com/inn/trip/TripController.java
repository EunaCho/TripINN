package com.inn.trip;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
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
	
	@RequestMapping(value="/tripList.do", method=RequestMethod.GET) //트립 리스트
	public ModelAndView tripList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("tripList");
		List<Map<String, Object>> list = tripService.selectTripList(commandMap.getMap());
		
		mv.addObject("list",list); 
		mv.addObject("area", commandMap.get("trip_area"));
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
	
	
	//리스트에서 사진정보 ajax로 가져옴
	@RequestMapping(value="/tripPhotoInfo.do", method=RequestMethod.POST)
	public ModelAndView tripPhotoInfo(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/trip/photoInfo");
		String trip_idx = request.getParameter("trip_idx");
		
		String images = tripService.selectImages(trip_idx);
		System.out.println("images : " + images);
		
		String[] imgs = images.split("\\|");
		mv.addObject("imgs", imgs);
		return mv; 
	} 
	
	//리스트에서 지역별로 검색
	@RequestMapping(value="/tripSearchArea.do", method=RequestMethod.POST)
	public ModelAndView tripSearchArea(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("tripList");
		commandMap.put("trip_area", request.getParameter("area"));
		
		List<Map<String, Object>> list = tripService.selectTripList(commandMap.getMap());
		
		mv.addObject("list", list);
		mv.addObject("area", commandMap.get("trip_area"));
		return mv;
	}
	
	// 트립 상세 페이지
	@RequestMapping(value="/tripDetail.do", method=RequestMethod.POST)
	public ModelAndView tripDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("tripDetail");
		
		Map<String, Object> map = tripService.selectTripDetail(commandMap.getMap());
		System.out.println("trip_idx : " + commandMap.get("trip_idx"));
		// 지도 뷰
		String addr1 = (String) map.get("TRIP_ADDR1");
		
		String mapView = ConvertAddress.conAddr(addr1);
		String lat = mapView.substring(mapView.indexOf("lat")+5, mapView.indexOf("lat")+16).trim();
		String lng = mapView.substring(mapView.indexOf("lng")+5, mapView.indexOf("lng")+16).trim();
		String ba = ConvertAddress.decode(mapView.substring(mapView.indexOf("buildingAddress")+18, mapView.indexOf("title")-3).trim()); // 
		mv.addObject("lat", lat);
		mv.addObject("lng", lng);
		mv.addObject("ba", ba);
		//지도 뷰
		System.out.println("lat : " + lat + "// lng : "  + lng + "// ba : " + ba);
		//사진 뷰
		String images = (String) map.get("TRIP_IMAGE");
		String[] imgs = images.split("\\|");
		mv.addObject("imgs", imgs);
		//사진뷰
		
		mv.addObject("trip", map);
		return mv;
	}
	
	//트립 예약 폼 이동
	@RequestMapping(value="/tripReserveForm.do", method=RequestMethod.POST)
	public ModelAndView tripReserveForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("tripReserveForm");
		
		Map<String, Object> tripInfo = tripService.selectTripDetail(commandMap.getMap());
		
		mv.addObject("tripInfo", tripInfo);
		return mv;
	}
	
}
