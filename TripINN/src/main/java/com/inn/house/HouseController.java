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

	Logger log = Logger.getLogger(this.getClass()); // 데이터 찍기

	@Resource(name = "houseService") // service class 연결
	private HouseService houseService; // interface 연결

	// house list mapping
	@RequestMapping(value = "/house/houseMain.do", method = RequestMethod.POST)
	public ModelAndView houseList(CommandMap map, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("houseMain"); // tilse에 등록된 jsp

		if (session.getAttribute("member_idx") != null) {
			mv.addObject("search", map.getMap()); // 검색키워드 넘기기

			List<Map<String, Object>> list = houseService.searchHouseList(map.getMap());
			mv.addObject("search", map.getMap()); // 검색키워드 넘기기
			List<Map<String, Object>> map_list = houseService.selectHouseMapList(map.getMap());

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

			if (!list.isEmpty()) {
				store_img = new String[map_list.size()];

				for (int i = 0; i < list.size(); i++) {
					str_img = listIterator.next().toString();
					str_img = str_img.substring(str_img.indexOf("IMAGE") + 6, str_img.indexOf(", HOUSE_IDX")).trim();
					if (str_img.contains("|")) {
						str_img = str_img.substring(0, str_img.indexOf("|"));
					}
					store_img[i] = str_img; // IMG DATA
					list.get(i).put("HOUSE_IMAGE", str_img);
				}

			}

			if (!map_list.isEmpty()) {
				store_total_addr = new String[map_list.size()];
				store_addr = new String[map_list.size()];
				store_idx = new String[map_list.size()];

				for (int i = 0; i < map_list.size(); i++) {

					str_total_addr = mapIterator.next().toString();
					str_total_addr = str_total_addr.substring(1, str_total_addr.length() - 1);

					// 주소 값, idx 받기
					store_total_addr[index] = str_total_addr;

					// 주소 값 받기
					str_addr = store_total_addr[index].substring(store_total_addr[index].indexOf("ADDR1=") + 6,
							store_total_addr[index].indexOf(", "));
					store_addr[index] = str_addr;

					// idx 값 받기
					str_idx = store_total_addr[index].substring(store_total_addr[index].indexOf("IDX=") + 4,
							store_total_addr[index].length());
					store_idx[index] = str_idx;
					index++;
				}
			}

			map.put("store_addr", store_addr);
			mv.addObject("img", store_img);
			mv.addObject("list", list); // list에 담은 데이터를 보여주기 위함.
			mv.addObject("map_list", store_addr);
			mv.addObject("map_list_length", store_addr.length);
		}
		return mv;

	}

	// house register view mapping
	@RequestMapping(value = "/house/houseRegisterMain.do")
	public ModelAndView houseRegisterMain(CommandMap map, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("openHouseRegister");
		return mv;
	}

	// house register view mapping detail 1
	@RequestMapping(value = "/house/houseRegister1.do")
	public ModelAndView houseRegisterView1(CommandMap map, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("houseRegister1");
		/* String str = str.contains("house_img_file"); */
		return mv;
	}

	// house register insert view mapping detail 2
	// INSERT 후의 페이지
	@RequestMapping(value = "/house/houseRegister2.do")
	public ModelAndView houseRegisterView2(CommandMap map, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("houseRegister2");
		mv.addObject("map", map.getMap());

		System.out.println(map.get("HOUSE_ADDR1") + "**************************");
		return mv;
	}

	// house register view mapping detail 2-1
	@RequestMapping(value = "/house/houseRegisterInput.do")
	public ModelAndView houseRegisterInsert2(CommandMap map, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/house/houseRegister3.do");
		if(session.getAttribute("member_idx") == null) {
			map.put("MY_MEMBER_IDX", "0");
		} else {
			map.put("MY_MEMBER_IDX", session.getAttribute("member_idx"));
		}
		System.out.println(map.getMap()+"dddddddddddddddddd");
		houseService.insertHouse(map.getMap(), request);
		
		houseService.updateTotalPrice(map.getMap());
		return mv;
	}

	// house register insert view mapping detail 2
	@RequestMapping(value = "/house/houseRegister3.do")
	public ModelAndView houseRegisterResult2(CommandMap map, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("houseRegister3");
		return mv;
	}

	// map view
	@RequestMapping(value = "/house/houseMapView.do")
	public ModelAndView houseMapView(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("house/register/houseMapView");
		String addr1 = request.getParameter("addr");

		String map = ConvertAddress.conAddr(addr1);
		String lat = map.substring(map.indexOf("lat") + 5, map.indexOf("lat") + 16).trim();
		String lng = map.substring(map.indexOf("lng") + 5, map.indexOf("lng") + 16).trim();
		String ba = ConvertAddress
				.decode(map.substring(map.indexOf("buildingAddress") + 18, map.indexOf("title") - 3).trim());

		mv.addObject("lat", lat);
		mv.addObject("lng", lng);
		mv.addObject("ba", ba);
		return mv;
	}

	// map multi view 숙소 리스트 다중 마커
	@RequestMapping(value = "/house/houseMapListView.do")
	public ModelAndView houseMapListView(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("house/register/houseMapListView");
		String addr = request.getParameter("addr");
		String img = request.getParameter("img");
		String name = request.getParameter("name");
		String idx = request.getParameter("idx");
		String price = request.getParameter("price");
		String house_member_idx = request.getParameter("house_member_idx");
		System.out.println(house_member_idx+"sssssssss");
		/*commandMap.put("HOUSE_IDX", idx);
		Map<String, Object> house = houseService.selectHouseDetail(commandMap.getMap());*/
		String[] addr2 = addr.split(","), img2 = img.split(","), name2 = name.split(","), idx2 = idx.split(","),
				price2 = price.split(",");
		
		String map = "", lat = "", lng = "", ba = "", img3 = "", name3 = "", idx3 = "", addr3 = "", price3="";

		String[] latArry = new String[addr2.length], lngArry = new String[addr2.length],
				baArry = new String[addr2.length];

		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		HashMap<String, Object> hashMap = null;
		for(int i = 0; i<price2.length; i++){

			price3 = price3 + price2[i] + "/";
		}
		for (int i = 0; i < addr2.length; i++) {
			System.out.println(addr2[i]);
			map = ConvertAddress.conAddr(addr2[i]);

			latArry[i] = map.substring(map.indexOf("lat") + 5, map.indexOf("lat") + 16).trim();
			lat = lat + latArry[i] + "/";
			lngArry[i] = map.substring(map.indexOf("lng") + 5, map.indexOf("lng") + 16).trim();
			lng = lng + lngArry[i] + "/";
			baArry[i] = ConvertAddress
					.decode(map.substring(map.indexOf("buildingAddress") + 18, map.indexOf("title") - 3).trim()); //
			ba = ba + baArry[i] + "/";

			if (img2[i].contains("|")) {
				img2[i] = img2[i].substring(0, img2[i].indexOf("|"));
				/* System.out.println("index of img2=   "+ img2[i]); */
			} else {
				img2[i] = img2[i];
				/* System.out.println("else index of im2 = " +img2[i]); */
			}

			img3 = img3 + img2[i] + "/";
			name3 = name3 + name2[i] + "/";
			idx3 = idx3 + idx2[i] + "/";
			addr3 = addr3 + addr2[i] + "/";
		}
		/*
		 * System.out.println(img3 + "///////////////");
		 * System.out.println(name3 + "////////////////name");
		 */
		/* System.out.println(idx3 + "--------------------"); */
		System.out.println(addr3 + "///////////");
		mv.addObject("addr_size", addr2.length);
		mv.addObject("price_size", price2.length);
		mv.addObject("addr", addr3);
		mv.addObject("lat", lat);
		mv.addObject("lng", lng);
		mv.addObject("ba", ba);
		mv.addObject("img", img3);
		mv.addObject("name", name3);
		mv.addObject("idx", idx3);
		mv.addObject("price",price3);
		mv.addObject("house_member_idx",house_member_idx);
		return mv;
	}

	public File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {
		File convFile = new File("E:\\upload\\" + multipart.getOriginalFilename());
		multipart.transferTo(convFile);
		return convFile;
	}

	// review like 리뷰 추천
	@RequestMapping(value = "/house/hrbLike.do", method = RequestMethod.GET)
	public ModelAndView hrbLike(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/house/review/reviewLike");
		Map<String, Object> map = new HashMap<>();
		int cnt = Integer.parseInt(request.getParameter("cnt"));

		map.put("CNT", cnt);
		map.put("HOUSE_IDX", request.getParameter("HOUSE_IDX"));
		map.put("MEMBER_IDX", request.getParameter("MEMBER_IDX"));
		map.put("HRB_IDX", request.getParameter("HRB_IDX"));

		if (cnt == -1) {
			houseService.deleteLike(map);
		} else {
			houseService.insertLike(map);
		}
		houseService.reviewLike(map); // review like 업데이트 해줌.
		String hrb_like = houseService.selectLikeCnt(request.getParameter("HRB_IDX"));
		mv.addObject("hrb_like", hrb_like);
		return mv;
	}


	// hr_pwd check
	@RequestMapping(value = "/house/hrbPwdCheck.do", method = RequestMethod.GET)
	public ModelAndView hrbPwdCheck(CommandMap map, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("house/review/pwdCheck");
		String str_hrb_idx = request.getParameter("HRB_IDX");
		String str_hrb_pwd = request.getParameter("HRB_PWD");
		String str_input_pwd = request.getParameter("INPUT_PWD");
		String str_pwdCheck = request.getParameter("pwdCheck");
		String str_house_member_idx = request.getParameter("HOUSE_MEMBER_IDX");
		String str_house_idx = request.getParameter("HOUSE_IDX");
		if (str_pwdCheck != null) {
			if (str_pwdCheck.equals("1")) {
				System.out.println("비밀번호 통과");
				System.out.println(str_hrb_idx);
				System.out.println(str_hrb_pwd);
				System.out.println(str_input_pwd);
				houseService.deleteReview(map.getMap());
			}
		}
		return mv;
	}

	// 하우스 상세정보 보기
	@RequestMapping(value="/house/houseDetail.do", method=RequestMethod.GET) 
	public ModelAndView houseDetail(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		
		if(session.getAttribute("member_idx") == null) {
			commandMap.put("MY_MEMBER_IDX", "0");
		} else {
			commandMap.put("MY_MEMBER_IDX", session.getAttribute("member_idx"));
		}
		ModelAndView mv = new ModelAndView("HouseInfoDetail");
		//하우스 상세정보 꺼내오기
		Map<String, Object> house = houseService.selectHouseDetail(commandMap.getMap()); 
		mv.addObject("house", house);
		Map<String, Object> map = houseService.selectHouseDetail(commandMap.getMap()); //하우스 상세정보 꺼내오기
		mv.addObject("detail", map);//map에 상세정보 넣기
		
		houseService.increaseHouseCnt(commandMap.getMap());//하우스 cnt 증가

		//하우스 리뷰 리스트 꺼내오기
		List<Map<String, Object>> reviewList = houseService.selectReviewList(commandMap.getMap());
		//좋아요 기능 내가 좋아요 한 리스트 뽑기
		List<Map<String, Object>> likeCheckList = houseService.likeCheckList(commandMap.getMap());

		
		//wishList 기능
		String wish = request.getParameter("HOUSE_WISH");
		String member_idx = request.getParameter("MEMBER_IDX");
		
		
		String str_img = (String) house.get("HOUSE_IMAGE"); // img str
		String[] store_img = null;// 저장된 img
		int index = 0;
		
		
		if (str_img!=null) {
			if(str_img.contains("|")){
				store_img = str_img.split("\\|");
			}else{
				store_img = new String[1];
				store_img[0] = str_img;
			}
		}
		if(wish != null){
		if(wish.contains("1")){ // wish 리스트 체크
			commandMap.put("MEMBER_IDX", member_idx);
			houseService.insertWish(commandMap.getMap(), request);
		}else if(wish.contains("0")){// wish 리스트 체크 취소
			String wishIdx = houseService.selectWishIdx(commandMap.getMap());
			commandMap.put("FVR_IDX", wishIdx);
			houseService.deleteWish(commandMap.getMap(), request);
		}
		}

		
		commandMap.put("HRB_TITLE", request.getParameter("HRB_TITLE"));
		commandMap.put("HRB_CONTENT", request.getParameter("HRB_CONTENT"));
		commandMap.put("HRB_PWD", request.getParameter("HRB_PWD"));
		commandMap.put("HOUSE_IDX", request.getParameter("HOUSE_IDX"));
		
		mv.addObject("review_size",reviewList.size());
		mv.addObject("likeList",likeCheckList);
		mv.addObject("house", house);
		mv.addObject("review", reviewList);
		mv.addObject("house_idx", commandMap.get("HOUSE_IDX"));
		mv.addObject("review_size", reviewList.size());
		mv.addObject("imgList", store_img);
		return mv; //mv 값 넘기기
	}

	// 하우스 리뷰 작성하기
	@RequestMapping(value="/house/houseReviewWrite.do", method=RequestMethod.POST)
	public ModelAndView houseReviewWrite(CommandMap map, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/house/houseDetail.do");

		map.put("HRB_STAR", request.getParameter("hrb_star"));
		//작성된 리뷰 내용 전송
		houseService.insertReview(map.getMap());
		
		mv.addObject("HOUSE_IDX", map.get("HOUSE_IDX"));
		mv.addObject("MEMBER_IDX", request.getParameter("MEMBER_IDX"));
		return mv; 
	}
	// 신고하기
	@RequestMapping(value = "/house/houseReport.do", method = RequestMethod.GET)
	public ModelAndView houseReport(CommandMap map, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("house/review/report");
		System.out.println("신고하기");
		String house_idx = request.getParameter("HOUSE_IDX");
		String member_idx = request.getParameter("MEMBER_IDX");
		String report_title = request.getParameter("REPORT_TITLE");
		String report_content = request.getParameter("REPORT_CONTENT");
		
		if(report_content != null && report_title !=null){
		map.put("REPORT_TITLE", report_title);
		map.put("REPORT_CONTENT", report_content);
		map.put("MEMBER_IDX", member_idx);
		map.put("HOUSE_IDX", house_idx);
		houseService.insertReportHouse(map.getMap());
		}
		return mv;
	}
	
	// message 메시지
	@RequestMapping(value = "/house/sendMssg.do", method = RequestMethod.GET)
	public ModelAndView houseMessage(CommandMap map, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/house/houseDetail.do?HOUSE_IDX="+request.getParameter("HOUSE_IDX")+"&MEMBER_IDX="+request.getParameter("HOUSE_MEMBER_IDX"));
		
		String house_idx = request.getParameter("HOUSE_IDX"); // 숙소 idx
		String receive_member_email = request.getParameter("RECEIVE_MEMBER_EMAIL"); //받는 이메일
		String msg_title = request.getParameter("MSG_TITLE");
		String msg_content = request.getParameter("MSG_CONTENT");
		
		map.put("RECEIVE_MEMBER_EMAIL", receive_member_email);
		map.put("MEMBER_IDX", session.getAttribute("member_idx"));
		map.put("MSG_CONTENT", msg_content);
		map.put("MSG_TITLE", msg_title);
		map.put("HOUSE_IDX", house_idx);
		houseService.sendMssg(map.getMap());
		return mv;
	}

}
