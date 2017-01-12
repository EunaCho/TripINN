package com.inn.house;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map; //sql map 형식 연결

import javax.annotation.Resource; //service 클래스 연결
import javax.servlet.http.HttpServletRequest; //jsp data
import javax.servlet.http.HttpSession;

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
	public ModelAndView houseList(CommandMap map, HttpSession session)throws Exception{
		
		System.out.println(session.getAttribute("member_idx")+"44444444444444444444");

		ModelAndView mv = new ModelAndView("houseMain"); // tilse에 등록된 jsp
		if(session.getAttribute("member_idx")!=null){
//			System.out.println("ssssssssssssssssss");
			mv.addObject("search",map.getMap()); //검색키워드 넘기기
		
			List<Map<String, Object>> list = houseService.searchHouseList(map.getMap());
			mv.addObject("search", map.getMap()); //검색키워드 넘기기
			List<Map<String,Object>> map_list = houseService.selectHouseMapList(map.getMap());
//			System.out.println(list.get(1).+"2222222222222");
			String str_total_addr = "";
			String str_addr = "";
			String str_idx = "";
			String str_img = ""; // img str
			String[] store_total_addr = null; // 저장된 주소, idx 값
			String[] store_addr = null; // 저장된 주소
			String[] store_idx = null;
			String[] store_img = null;// 저장된 img
			
			Iterator mapIterator = map_list.iterator();
			Iterator listIterator = list.iterator();
			
			int index = 0;
			if(!list.isEmpty()){
				store_img = new String[map_list.size()];
				
				for(int i=0; i<list.size(); i++){
					str_img = listIterator.next().toString();
					str_img = str_img.substring(str_img.indexOf("IMAGE")+6, str_img.indexOf(", HOUSE_IDX")).trim();
					if(str_img.contains("|")){
						str_img = str_img.substring(0,str_img.indexOf("|"));
					}
					store_img[i] = str_img; // IMG DATA
					list.get(i).put("HOUSE_IMAGE", str_img);
//					System.out.println(store_img[i]+"++++++++++++++++++++");
					
				}
				
			}
			
			
			if(!map_list.isEmpty()){
				store_total_addr = new String[map_list.size()];
				store_addr = new String[map_list.size()];
				store_idx = new String[map_list.size()];
				
				
			for(int i=0; i<map_list.size(); i++){
				
				str_total_addr = mapIterator.next().toString();
				str_total_addr = str_total_addr.substring(1, str_total_addr.length()-1);
				
				//주소 값, idx 받기
				store_total_addr[index] = str_total_addr;
				
				//주소 값 받기
				str_addr = store_total_addr[index].substring(store_total_addr[index].indexOf("ADDR1=")+6,
						store_total_addr[index].indexOf(", "));
				store_addr[index] = str_addr;
				
				//idx 값 받기
				str_idx = store_total_addr[index].substring(store_total_addr[index].indexOf("IDX=")+4, 
						store_total_addr[index].length());
				store_idx[index] = str_idx;
				index++;
				}
			}


			map.put("store_addr", store_addr);
			
			mv.addObject("img",store_img);
			mv.addObject("list",list); // list에 담은 데이터를 보여주기 위함.
			mv.addObject("map_list",store_addr);
			mv.addObject("map_list_length", store_addr.length);
			
		}

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
//		System.out.println(addr1+"111111111111111111");

		String map = ConvertAddress.conAddr(addr1);
		String lat = map.substring(map.indexOf("lat")+5, map.indexOf("lat")+16).trim();
		String lng = map.substring(map.indexOf("lng")+5, map.indexOf("lng")+16).trim();
		String ba = ConvertAddress.decode(map.substring(map.indexOf("buildingAddress")+18, map.indexOf("title")-3).trim());
		
		mv.addObject("lat", lat);
		mv.addObject("lng", lng);
		mv.addObject("ba", ba);
		return mv;
	}
	
	//map multi view 숙소 리스트 다중 마커
	@RequestMapping(value="/house/houseMapListView.do")
	public ModelAndView houseMapListView(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("house/register/houseMapListView");
		String addr = request.getParameter("addr");
		String img = request.getParameter("img");
		String name = request.getParameter("name");
		String idx = request.getParameter("idx");
		
		String[] addr2 = addr.split(","),
				img2 = img.split(","),
				name2 = name.split(","),
				idx2 = idx.split(",");
		
		String map = "",
				lat = "",
				lng = "",
				ba = "",
				img3 = "",
				name3 = "",
				idx3 = "",
				addr3 = "";
		
		
		String[] latArry = new String[addr2.length],
				lngArry = new String[addr2.length],
				baArry = new String[addr2.length];
		
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		HashMap<String, Object> hashMap = null;
		
		
		
		for(int i=0; i<addr2.length; i++){
			System.out.println(addr2[i]);
			map = ConvertAddress.conAddr(addr2[i]);
			
			latArry[i] = map.substring(map.indexOf("lat")+5, map.indexOf("lat")+16).trim();
			lat = lat + latArry[i] +"/";
			lngArry[i] = map.substring(map.indexOf("lng")+5, map.indexOf("lng")+16).trim();
			lng = lng + lngArry[i] + "/";
			baArry[i] = ConvertAddress.decode(map.substring(map.indexOf("buildingAddress")+18, map.indexOf("title")-3).trim()); //
			ba = ba + baArry[i] + "/";
			
			if(img2[i].contains("|")){
				img2[i] = img2[i].substring(0, img2[i].indexOf("|"));
				/*System.out.println("index of img2=   "+ img2[i]);*/
			}else{
				img2[i] = img2[i];
				/*System.out.println("else index of im2 = " +img2[i]);*/
			}
			
			img3 = img3 + img2[i] + "/";
			name3 = name3 + name2[i] + "/";
			idx3 = idx3 + idx2[i] + "/";
			addr3 = addr3 + addr2[i] + "/";
		}
		/*System.out.println(img3 + "///////////////");
		System.out.println(name3 + "////////////////name");*/
		/*System.out.println(idx3 + "--------------------");*/
//		System.out.println(addr3 + "///////////");
		mv.addObject("addr_size", addr2.length);
		mv.addObject("addr", addr3);
		mv.addObject("lat", lat);
		mv.addObject("lng", lng);
		mv.addObject("ba", ba);
		mv.addObject("img", img3);
		mv.addObject("name", name3);
		mv.addObject("idx", idx3);
		
		return mv;
	}
	
	public File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException{
        File convFile = new File("E:\\upload\\" + multipart.getOriginalFilename());
        multipart.transferTo(convFile);
        return convFile;
}
	//하우스 상세정보 보기
	@RequestMapping(value="/house/houseDetail.do", method=RequestMethod.GET) 
	public ModelAndView houseDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("HouseInfoDetail");
		//하우스 상세정보 꺼내오기
		Map<String, Object> house = houseService.selectHouseDetail(commandMap.getMap()); 
		Map<String, Object> map = houseService.selectHouseDetail(commandMap.getMap()); //하우스 상세정보 꺼내오기
		

		
		
		//하우스 리뷰 리스트 꺼내오기
		List<Map<String, Object>> reviewList = houseService.selectReviewList(commandMap.getMap());
		
		
		/*System.out.println(request.getParameter("HOUSE_IDX")+ "////////////////////");
		System.out.println(request.getParameter("HOUSE_WISH")+ "////////////////////");
		*/
		//wishList 기능
		String wish = request.getParameter("HOUSE_WISH");
//		System.out.println("-------------------------" + wish);
		if(wish != null){
		if(wish.contains("1")){ // wish 리스트 체크
			
			houseService.insertWish(map, request);
			
			
		}else if(wish.contains("0")){// wish 리스트 체크 취소
			
			String wishIdx = houseService.selectWishIdx(commandMap.getMap());
			
			commandMap.put("FVR_IDX", wishIdx);
			houseService.deleteWish(commandMap.getMap(), request);
			
			
		}
		}
		

		commandMap.put("HOUSE_IDX", request.getParameter("HOUSE_IDX"));
		commandMap.put("HRB_TITLE", request.getParameter("HRB_TITLE"));
		commandMap.put("HRB_CONTENT", request.getParameter("HRB_CONTENT"));
		commandMap.put("HRB_PWD", request.getParameter("HRB_PWD"));
		

		System.out.println( request.getParameter("MEMBER_IDX")+"**************************SDAF");
		Map<String, Object> member = houseService.selectMember(commandMap.getMap()); //member 정보 꺼내오기
		mv.addObject("member",member);
		mv.addObject("house", house);
		mv.addObject("detail", map);//map에 상세정보 넣기
		mv.addObject("review", reviewList);
		mv.addObject("house_idx", commandMap.get("HOUSE_IDX"));
		mv.addObject("review_size", reviewList.size());

		return mv; //mv 값 넘기기
	}
	
	//하우스 리뷰 작성하기
	@RequestMapping(value="/house/houseReviewWrite.do", method=RequestMethod.POST)
	public ModelAndView houseReviewWrite(CommandMap map, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/house/houseDetail.do");
 		
		
		System.out.println(request.getParameter("HOUSE_IDX")+"000000000000000000000000");
		/*String str_house_idx = "";
		String str_hrb_title = "";
		String str_hrb_content = "";
		String str_hrb_pwd = "";
		
		str_house_idx = request.getParameter("HOUSE_IDX");
		str_hrb_title = request.getParameter("HRB_TITLE");
		str_hrb_content = request.getParameter("HRB_CONTENT");
		str_hrb_pwd = request.getParameter("HRB_PWD");*/
		
		/*map.put("HOUSE_IDX", request.getParameter("HOUSE_IDX"));
		map.put("HRB_TITLE", request.getParameter("HRB_TITLE"));
		map.put("HRB_CONTENT", request.getParameter("HRB_CONTENT"));
		map.put("HRB_PWD", request.getParameter("HRB_PWD"));
		*/
		System.out.println(map.get("HRB_TITLE")+"*********************");
		System.out.println(map.get("HRB_CONTENT")+"*********************");
		System.out.println(map.get("HRB_PWD")+"*********************");
		//작성된 리뷰 내용 전송
		houseService.insertReview(map.getMap());
		
		mv.addObject("HOUSE_IDX", map.get("HOUSE_IDX"));
		return mv; 
	}
	

}
