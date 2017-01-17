package com.inn.mypage;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.inn.member.MemberService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Resource
	private MypageService mypageService; //마이페이지 서비스 
	@Resource
	private MemberService memberService; //멤버 서비스 

	
	private Integer session_member_idx; //로그인한 회원의 memger_idx세션값
	private String session_member_email ;// 로그인한 회원의 member_email 세션값
	
	private Calendar today = Calendar.getInstance(); // 시스템 날짜
	
//---------------------------------------------알림판 시작---------------------------------------------
	@RequestMapping("/notice.do")
	public ModelAndView noticeForm(CommandMap commandMa, HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("noticeForm"); //noticeForm으로 설정된 ModelAndView 객체 선언 

		session_member_idx = (Integer)session.getAttribute("member_idx"); //로그인한 member_idx 세션값
		
		
		/*
		if(session_member_idx == null){
			mv.setViewName("redirect:/main.do");
		}*/
		
		return mv;
	}
	
//---------------------------------------------메시지 시작---------------------------------------------
	//*메시지->보낸메시지list
	@RequestMapping("/sendMessage.do")
	public ModelAndView sendMsgForm(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{ 	//보낸 메시지를 select박스를이용해서 숙소와 트립의 선택에 따라 리스트를 뽑는다. 
		
		ModelAndView mv = new ModelAndView("sendMsgForm");  //sendMsgForm으로 된 ModelAndView 객체 선언 
		
		/*session_member_idx = (Integer)session.getAttribute("member_idx"); //로그인한 member_idx 
		commandMap.put("member_idx", session_member_idx); //commandMap 객체에 불러온 세션값 과 키값 저장 
		 */		
		commandMap.put("member_idx", "12");

		ArrayList<Map<String, Object>> list = new ArrayList<>(); //seletSendMessage 리스트를 저장할 list객체 선언 
		list=(ArrayList<Map<String, Object>>)mypageService.selectSendMsgList(commandMap.getMap()); // list 객체에 불러온 sendMessage값을 저장 
		
		mv.addObject("list", list); //moderAndView 값에 list 추가 
		System.out.println("sendMessageList: " + list);
		
		return mv;
	}
	
	//*메시지->받은메시지list
	@RequestMapping("/receiveMessage.do")
	public ModelAndView receiveMsgForm(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{ //받은 메시지를 select박스를 이용해 숙소와 트립의 선택에 따라 리스트를 뽑는다.
		
		ModelAndView mv = new ModelAndView("receiveMsgForm");
		
		/*session_member_email = (String)session.getAttribute("member_email"); //selectReceiveMessage 리스트를 저장할 list 객체
		commandMap.put("member_email", session_member_email);
		*/
		commandMap.put("member_email", "eunkyung@naver.com");
		
		ArrayList<Map<String, Object>> list = new ArrayList<>(); //selectReceiveMessage 를 저장할 ArrayList<Map<String, Object>> 객체 생성 
		list = (ArrayList<Map<String, Object>>)mypageService.selectReceiveMsgList(commandMap.getMap());
		
		mv.addObject("list", list);
		System.out.println("receiveMessageList:" + list);
		
		return mv;
	}
	
	//*메시지-->보낸메시지상세보기
	@RequestMapping("/sendMsgDetail.do")
	public ModelAndView sendMsgDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("sendMsgDetail");
		
		int msg_idx = Integer.parseInt(request.getParameter("msg_idx")); //jsp에서 전달받은 msg_idx를 저장할 변수를 선언해 저장 
		commandMap.put("msg_idx", msg_idx); //commandMap에 msg_idx를 저장 
		Map<String, Object> map = mypageService.selectSendMsgDetail(commandMap.getMap()); //mypageService에 선언된 selectDetail 실행 
		
		mv.addObject("map",map);
		
		return mv;
	}
	//*메시지-->받은메시지상세보기 
	@RequestMapping("receiveMsgDetail")
	public ModelAndView receiveMsgDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("receiveMsgDetail");
		
		int msg_idx = Integer.parseInt(request.getParameter("msg_idx"));
		commandMap.put("msg_idx", msg_idx);
		Map<String, Object> map = mypageService.selectReceiveMsgDetail(commandMap.getMap());
		
		mv.addObject("map", map);
		
		mypageService.updateMsg_state(commandMap.getMap());

		return mv;
		
	}
	
	//*메시지->메시지쓰기 폼이동 
	@RequestMapping("/messageWrite.do")
	public ModelAndView messageWrite(CommandMap commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("messageWrite");

		return mv;
	}
	
	//메시지 쓰기 성공
	@RequestMapping(value="/messageWriteOk.do", method=RequestMethod.POST)
	public ModelAndView messageWriteOk(CommandMap commandMap, HttpSession session) throws Exception{
		System.out.println("test1");
		ModelAndView mv = new ModelAndView("messageWriteOk"); //messageWriteOk.jsp로 타일즈 설정된 뷰 messageWriteOk.jsp에서  다시 mypage/notice.do 실행 
		System.out.println("test2");									  
		/*session_member_idx = (Integer)session.getAttribute("member_idx");
		commandMap.put("member_idx", session_member_idx);*/
		commandMap.put("MEMBER_IDX", "12");
		System.out.println("test3");
		System.out.println("member_idx : " + commandMap.get("MEMBER_IDX"));
		mypageService.insertMsgWrite(commandMap.getMap());
		System.out.println("test4");
		return mv;
	}
	
//---------------------------------------------숙소목록 시작----------------------------------------	-----
	//*숙소목록=>숙소목록 메인
	@RequestMapping("/house.do")
	public ModelAndView houseForm(CommandMap commandMap, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView("houseForm"); //tilse맵핑된 ModelAndView 객체 선언 
		
		/*session_member_idx = (Integer)session.getAttribute("member_idx"); //member_idx 세션값
		commandMap.put("member_idx", session_member_idx);*/
		
		commandMap.put("member_idx", "12");
		
		ArrayList<Map<String, Object>> list = new ArrayList<>(); //숙소 리스트를 저장할 ArrayList 객체를 선언 
		list =(ArrayList<Map<String, Object>>)mypageService.selectHouseList(commandMap.getMap()); // selectHouseList를 실행
		
		mv.addObject("list", list); //modelAndView에 넣어줌 
		
		return mv;
	}
	//숙소목록->숙소상세보기 
	@RequestMapping(value="/houseDetail.do",method=RequestMethod.POST )
	public ModelAndView houseDetail(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("houseDetail");
		
		int house_idx = Integer.parseInt(request.getParameter("HOUSE_IDX"));
		session_member_email  = (String)session.getAttribute("member_email");
		commandMap.put("HOUSE_IDX", house_idx);
		commandMap.put("MEMBER_EMAIL", session_member_email);
		System.out.println("MEMBER_EMAIL:" + session_member_email);
		System.out.println("HOUSE_IDX: "+house_idx);
		
		Map<String, Object> houseMap = mypageService.selectHouseDetail(commandMap.getMap()); //숙소 상세보기 
		ArrayList<Map<String, Object>> reserList = (ArrayList<Map<String, Object>>) mypageService.selectH_ReserList(commandMap.getMap()); //해당 숙소의 예약 현황 리스트 
		ArrayList<Map<String, Object>> msgList= (ArrayList<Map<String, Object>>) mypageService.selectH_MsgList(commandMap.getMap()); //해당 숙소의 쪽지
		
		mv.addObject("houseMap",houseMap);
		mv.addObject("reserList", reserList);
		mv.addObject("msgList", msgList);
		
		return mv;
	}

	//*숙소목록=>예약관리

	// 숙소 상세 -> 예약관리 -> 예약 취소
	@RequestMapping(value="/house_rsv_del.do", method=RequestMethod.POST)
	public ModelAndView house_rsv_del(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/mypage/houseDetail.do");
		String hr_idx = request.getParameter("hr_idx");
		mypageService.house_rsv_del(hr_idx);
		
		mv.addObject("HOUSE_IDX", request.getParameter("HOUSE_IDX"));
		return mv;
	}
	
	//*숙소목록=>예약관리 리스트

	@RequestMapping("/houseReser.do")
	public String houseReserForm(CommandMap commandMap) throws Exception{
		
		return "houseReserForm";
	}
	
//--------------------------------------------트립목록 시작---------------------------------------------
	
	//*트립목록=>트립목록 메인
	@RequestMapping("/trip.do")
	public String tripForm(CommandMap commandMap) throws Exception{
		
		return "tripForm";
	}
	//*트립목록=>예약관리
	@RequestMapping("/tripReser.do")
	public String tripReserForm(CommandMap commandMap){
		
		return "tripReserForm";
	}

	
//-------------------------------------------위시리스트 시작---------------------------------------------
	@RequestMapping("/wishList.do")
	public String wishListForm(CommandMap commandMap) throws Exception{
		
		return "listForm";
	}
	

	
//--------------------------------------------프로필 시작---------------------------------------------
	//*프로필 수정(프로필 메인)
	@RequestMapping("/profile.do")
	public String profileForm(CommandMap commandMap) throws Exception{
		
		return "proForm";
	}
	//*후기
	@RequestMapping("/review.do")
	public String reviewForm(CommandMap commandMap) throws Exception{
		
		return "reviewForm";
	}
	
	//*인증현황
	@RequestMapping("/check.do")
	public String checkState(CommandMap commandMap) throws Exception{
		return "checkState";
	}

}
