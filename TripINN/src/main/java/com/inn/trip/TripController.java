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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.common.common.CommandMap;
import com.common.common.ConvertAddress;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

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
		ModelAndView mv = new ModelAndView("redirect:/tripList.do");
		String trip_include = "";
		for(String inc : inc_list) {
			trip_include = trip_include + inc + "|";
		}
		// 엔터값 처리-------------------------------
		String trip_intro = (String) commandMap.get("trip_intro");
		trip_intro = trip_intro.replace("\r\n", "<br />");
		commandMap.put("trip_intro", trip_intro);
		// 엔터값 처리-------------------------------
		//commandMap.put("member_idx", session.getAttribute("member_idx"));
		commandMap.put("member_idx", session.getAttribute("member_idx"));
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
		//List<Map<String, Object>> list = tripService.selectTripList(commandMap.getMap());
		Map<String,Object> resultMap = null;
		
		if(commandMap.get("trip_type") == null) {
			resultMap = tripService.selectTripList(commandMap.getMap()); // 검색 아닐때
		} else {
			resultMap = tripService.selectTripListSearch(commandMap.getMap()); // 검색
		}
	    mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
	    mv.addObject("list",resultMap.get("result")); 
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
		
		Map<String,Object> resultMap = tripService.selectTripList(commandMap.getMap());
		
	    mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
	    mv.addObject("list",resultMap.get("result")); 
		mv.addObject("area", commandMap.get("trip_area"));
		return mv;
	}
	
	// 트립 상세 페이지
	@RequestMapping(value="/tripDetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView tripDetail(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("tripDetail");
		if(session.getAttribute("member_idx") == null) {
			commandMap.put("member_idx", "0");
		} else {
			commandMap.put("member_idx", session.getAttribute("member_idx"));
		}
		
		Map<String, Object> map = tripService.selectTripDetail(commandMap.getMap()); // 트립 정보 map
		String include = (String) map.get("TRIP_INCLUDE");
		String[] inc = include.split("\\|");
		String[] total_inc = {"식사","간식","음료","숙박","교통비","티켓","장비","봉사료","여행자보험","기타개인비용"};
		
		
		if(inc.length > 0) {
			List<String> incList = new ArrayList<>();
			List<String> total_incList = new ArrayList<>();
			for(String s : inc) incList.add(s);
			for(String s : total_inc) total_incList.add(s);
			
			total_incList.removeAll(incList);
			map.put("TRIP_NOT_INCLUDE", total_incList);
			map.put("TRIP_INCLUDE", inc); 
		}
		//==============================지도 뷰==============================
		String addr1 = (String) map.get("TRIP_ADDR1");
		
		String mapView = ConvertAddress.conAddr(addr1);
		String lat = mapView.substring(mapView.indexOf("lat")+5, mapView.indexOf("lat")+16).trim();
		String lng = mapView.substring(mapView.indexOf("lng")+5, mapView.indexOf("lng")+16).trim();
		String ba = ConvertAddress.decode(mapView.substring(mapView.indexOf("buildingAddress")+18, mapView.indexOf("title")-3).trim()); // 
		mv.addObject("lat", lat);
		mv.addObject("lng", lng);
		mv.addObject("ba", ba);
		//==============================지도 뷰==============================
		System.out.println("lat : " + lat + "// lng : "  + lng + "// ba : " + ba);
		//==============================사진 뷰==============================
		String images = (String) map.get("TRIP_IMAGE");
		String[] imgs = images.split("\\|");
		mv.addObject("imgs", imgs);
		//사진뷰
		
		//==============================리뷰 가져오기==============================
		Map<String,Object> resultMap = tripService.reviewList(commandMap.getMap());
		Map<String,Object> subMap = tripService.getReviewInfoSub(commandMap.getMap());
		List<Map<String, Object>> likeCheckList = tripService.likeCheckList(commandMap.getMap());
	    mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
	    mv.addObject("rlist", resultMap.get("result"));
	    mv.addObject("likeList", likeCheckList);
	    mv.addObject("subMap", subMap);
		//==============================리뷰 가져오기==============================
		
		mv.addObject("trip", map);
		return mv;
	}
	
	//트립 예약 폼 이동
	@RequestMapping(value="/tripReserveForm.do", method=RequestMethod.POST)
	public ModelAndView tripReserveForm(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("tripReserveForm");
		if(session.getAttribute("member_idx") == null) {
			commandMap.put("member_idx", "0");
		} else {
			commandMap.put("member_idx", session.getAttribute("member_idx"));
		}
		Map<String, Object> tripInfo = tripService.selectTripDetail(commandMap.getMap());
		
		mv.addObject("tripInfo", tripInfo);
		return mv;
	}
	
	//트립 예약 
	@RequestMapping(value="/tripReserve.do", method=RequestMethod.POST)
	public ModelAndView tripReserve(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/tripList.do");
		
		tripService.tripReserve(commandMap.getMap());

		//mv.addObject("tripInfo", tripInfo);
		return mv;
	}
	
	//트립 후기작성
	@RequestMapping(value="/tripReview.do", method=RequestMethod.POST)
	public ModelAndView tripReview(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/tripDetail.do");
		String trb_content = (String) commandMap.get("trb_content");
		trb_content = trb_content.replace("\r\n", "<br />");
		commandMap.put("trb_content", trb_content);
		tripService.tripReview(commandMap.getMap());
		mv.addObject("trip_idx", commandMap.get("trip_idx"));
		
		return mv;
	}
	
	// 리뷰 추천
	@RequestMapping("/reviewLike.do")
	public ModelAndView reviewLike(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/trip/reviewLike");
		Map<String, Object> map = new HashMap<>();
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		map.put("trb_idx", request.getParameter("trb_idx"));
		map.put("cnt", cnt);
		map.put("member_idx", request.getParameter("member_idx"));
		map.put("trip_idx", request.getParameter("trip_idx"));
		
		if(cnt == -1) { // 추천 취소(delete 쿼리)
			tripService.deleteLike(map);
		} else { // 추천 (insert 쿼리)
			tripService.insertLike(map);
		}
		tripService.reviewLike(map);
		String trb_like = tripService.getLikeCnt(request.getParameter("trb_idx")); // TRB_LIKE(추천수) UPDATE
		mv.addObject("trb_like", trb_like);
		return mv;
	}
	
	@RequestMapping(value="/tripBookmark.do", method=RequestMethod.GET)
	public void tripBookmark(HttpServletRequest request) throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		map.put("member_idx", request.getParameter("member_idx"));
		map.put("trip_idx", request.getParameter("trip_idx"));

		tripService.insertBookMark(map);
		
	}
	
	@RequestMapping("/tripBookmarkDelete.do")
	public void tripBookmarkDelete(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		map.put("member_idx", request.getParameter("member_idx"));
		map.put("trip_idx", request.getParameter("trip_idx"));
		
		System.out.println("get(member_idx) : " + map.get("member_idx"));
		System.out.println("get(trip_idx) : " + map.get("trip_idx"));
		tripService.deleteBookMark(map);
	}
	
	@RequestMapping(value="/tripReport.do", method=RequestMethod.POST)
	public ModelAndView tripReport(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/tripDetail.do");
		
		tripService.tripReport(commandMap.getMap());
		
		mv.addObject("trip_idx", commandMap.get("trip_idx"));
		return mv;
	}
	
	@RequestMapping(value="/reviewDel.do", method=RequestMethod.POST)
	public ModelAndView reviewDel(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/tripDetail.do");
		tripService.reviewDel(request.getParameter("trb_idx"));
		
		mv.addObject("trip_idx", request.getParameter("trip_idx"));
		return mv;
	}
	
	@RequestMapping("/trip/sendMssg.do")
	public ModelAndView sendMssg(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/tripDetail.do?trip_idx="+request.getParameter("trip_idx"));
		Map<String, Object> map = new HashMap<>();
		String house_idx = request.getParameter("trip_idx");
		String receive_member_email = request.getParameter("receive_member_email"); //받는 이메일
		String msg_title = request.getParameter("msg_title");
		String msg_content = request.getParameter("msg_content");
		
		map.put("receive_member_email", receive_member_email);     // 받는 사람
		map.put("member_idx", session.getAttribute("member_idx")); // 보내는 사람
		map.put("msg_content", msg_content);
		map.put("msg_title", msg_title);
		map.put("trip_idx", house_idx);
		tripService.sendMssg(map);
		return mv;
	}
	
	@RequestMapping(value="/tripUpdateForm.do")
	public ModelAndView tripUpdateForm(CommandMap commandMap, HttpSession session) {
		ModelAndView mv = new ModelAndView("tripUpdateForm");
		
		if(session.getAttribute("member_idx") == null) {
			commandMap.put("member_idx", "0");
		} else {
			commandMap.put("member_idx", session.getAttribute("member_idx"));
		}
		
		Map<String, Object> map = tripService.selectTripDetail(commandMap.getMap()); // 트립 정보 map
		
		
		mv.addObject("trip", map);
		return mv;
	}
	
	@RequestMapping(value="/tripUpdate.do", method=RequestMethod.POST)
	public ModelAndView tripUpdate(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("redirect:/tripDetail.do");
		tripService.tripUpdate(commandMap.getMap());
		
		mv.addObject("trip_idx", commandMap.get("trip_idx"));
		return mv;
	}
}
