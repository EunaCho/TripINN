package com.inn.trip;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.ConvertAddress;

@Controller
public class TestController {
	
	@RequestMapping("/test.do")
	public ModelAndView test() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test");
		
		String addr1 = "서울 강남구 테헤란로14길";
		String addr2 = "6";
		String[] nearByAddr = {"5 삼흥역삼빌딩 9층", "8 강남역두산위브센티움", "16 라인빌딩", "13"}; // 테헤란로14길 에 포함된 모든 주소 뽑아오기.
		
		
		String map = ConvertAddress.conAddr(addr1 + " " + addr2);
		String lat = map.substring(map.indexOf("lat")+5, map.indexOf("lat")+18).trim();
		String lng = map.substring(map.indexOf("lng")+5, map.indexOf("lng")+19).trim();
		String ba = ConvertAddress.decode(map.substring(map.indexOf("buildingAddress")+18, map.indexOf("title")-3).trim()); // 빌딩 주소
		mv.addObject("lat", lat);
		mv.addObject("lng", lng);
		mv.addObject("ba", ba);
		
		if(nearByAddr.length != 0) {
			ArrayList<HashMap<String, Object>> nearByList = new ArrayList<>();
			HashMap<String, Object> nearByMap = null;
			String map2 = null;
			for(int i=0; i<nearByAddr.length; i++) {
				nearByMap = new HashMap<>();
				map2 = ConvertAddress.conAddr(addr1 + " " + nearByAddr[i]);
				
				nearByMap.put("lat", map2.substring(map2.indexOf("lat")+5, map2.indexOf("lat")+18).trim());
				nearByMap.put("lng", map2.substring(map2.indexOf("lng")+5, map2.indexOf("lng")+19).trim());
				nearByMap.put("ba", ConvertAddress.decode(map2.substring(map2.indexOf("buildingAddress")+18, map2.indexOf("title")-3).trim()));
				
				if(nearByMap.get("ba").equals("")) {
					nearByMap.put("ba", "건물명 없음");
				}
				nearByList.add(nearByMap);
				
			}
			mv.addObject("nearByList", nearByList);
			
		}
		
		//System.out.println("substring : " + map.substring(map.indexOf("lat")+5, map.indexOf("lat")+17).trim());
		return mv;
	}
	
	
}
