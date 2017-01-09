package com.inn.house;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map; //sql map 형식 연결

import javax.annotation.Resource; //service 클래스 연결
import javax.servlet.http.HttpServletRequest; //jsp data

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller; //controller 클래스 등록 위함
import org.springframework.web.bind.annotation.RequestMapping; //jsp와 클래스 연결
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView; //jsp view

import com.inn.house.HouseService; // interface 숙소 등록
import com.common.common.CommandMap; // sql key 설정
import com.common.common.ConvertAddress;


@Controller
public class HouseController {
	
	Logger log = Logger.getLogger(this.getClass()); //데이터 찍기
	
	@Resource(name="houseService")//service class 연결
	private HouseService houseService; // interface 연결
	
	//house list mapping
	@RequestMapping(value="/house/houseMain.do", method=RequestMethod.POST)
	public ModelAndView houseList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("houseMain"); // tilse에 등록된 jsp
		//System.out.println("메인 값 받아오나 확인");
		//System.out.println(commandMap.getMap());
		//System.out.println("메인 값  여기까지");
		mv.addObject("search",commandMap.getMap()); //검색키워드 넘기기
		//System.out.println(mv);
	
		List<Map<String, Object>> list = houseService.selectHouseList(commandMap.getMap());
		//List<Map<String, Object>> list = houseService.searchHouseList(commandMap.getMap());

		System.out.println("맵");
		System.out.println(commandMap.getMap());
		System.out.println("리스트");
		System.out.println(list);
		mv.addObject("list",list); // list에 담은 데이터를 보여주기 위함.
		//System.out.println(mv);
		return mv;
		
	}
	
	//house register view mapping
	@RequestMapping(value="/house/houseRegisterMain.do")
	public ModelAndView houseRegisterMain(CommandMap map, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("openHouseRegister"); // tilse에 등록된 jsp
		return mv;
	}
	
	//house register view mapping detail 1
	@RequestMapping(value="/house/houseRegister1.do")
	public ModelAndView houseRegisterView1(CommandMap map, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("houseRegister1");
		/*String str = str.contains("house_img_file");*/
		return mv;
	}
	//house register insert view mapping detail 2
	//INSERT 후의  페이지
	@RequestMapping(value="/house/houseRegister2.do")
	public ModelAndView houseRegisterView2(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("houseRegister2");
		mv.addObject("map", map.getMap());
		
		System.out.println(map.get("HOUSE_ADDR1")+"**************************");
		return mv;
	}
	//house register view mapping detail 2-1
	@RequestMapping(value="/house/houseRegisterInput.do")
	public ModelAndView houseRegisterInsert2(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/house/houseRegister3.do");
		houseService.insertHouse(map.getMap(), request);
		return mv;
	}
	//house register insert view mapping detail 2
	@RequestMapping(value="/house/houseRegister3.do")
	public ModelAndView houseRegisterResult2(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("houseRegister3");
		return mv;
	}
	
	//map view
	@RequestMapping(value="/house/houseMapView.do")
	public ModelAndView houseMapView(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("house/register/houseMapView");
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
	
	public File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException{
        File convFile = new File("E:\\upload\\" + multipart.getOriginalFilename());
        multipart.transferTo(convFile);
        return convFile;
}
	//하우스 상세정보 보기
	@RequestMapping(value="/house/houseDetail.do", method=RequestMethod.GET) 
	public ModelAndView houseDetail(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("HouseInfoDetail");
		
		Map<String, Object> map = houseService.selectHouseDetail(commandMap.getMap()); //하우스 상세정보 꺼내오기
		mv.addObject("detail", map);//map에 상세정보 넣기
		
		return mv; //mv 값 넘기기
	}
	
	//하우스 리뷰 작성하기
	@RequestMapping(value="/house/houseReviewWrite.do", method=RequestMethod.POST)
	public ModelAndView houseReviewWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
 		
		//작성된 리뷰 내용 전송
		
		houseService.insertReview(commandMap.getMap());
		
		
		mv.setViewName("redirect:/house/houseDetail.do");//리뷰 작성하면 상세페이지 다시 띄움
		return mv; 
	}
	

}
