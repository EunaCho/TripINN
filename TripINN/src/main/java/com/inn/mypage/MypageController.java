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
	//*메시지->보낸메시지list(숙소/트립)
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
	
	//*메시지->받은메시지list(숙소/트립)
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
	
	//*메시지-->메시지상세보기
	@RequestMapping("/messageDetail.do")
	public ModelAndView messageDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("messageDetail");
		
		int msg_idx = Integer.parseInt(request.getParameter("msg_idx")); //jsp에서 전달받은 msg_idx를 저장할 변수를 선언해 저장 
		commandMap.put("msg_idx", msg_idx); //commandMap에 msg_idx를 저장 
		mypageService.selectMsgDetail(commandMap.getMap()); //mypageService에 선언된 selectDetail 실행 
		
		return mv;
	}
	//*메시지->메시지쓰기 
	@RequestMapping("/messageWrite.do")
	public ModelAndView messageWrite(CommandMap commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("messageWrite");
		
		return mv;
	}
	
//---------------------------------------------숙소목록 시작---------------------------------------------
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
	//*숙소목록=>예약관리
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
