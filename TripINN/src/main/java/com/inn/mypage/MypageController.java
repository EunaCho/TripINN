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

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

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
	public ModelAndView noticeForm(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("noticeForm"); //noticeForm으로 설정된 ModelAndView 객체 선언 

		/*session_member_idx = (Integer)session.getAttribute("member_idx"); //로그인한 member_idx 세션값
		commandMap.put("MEMBER_IDX", session_member_idx);
		
		if(session_member_idx == null){
			mv.setViewName("redirect:/main.do");
		}*/
		
		commandMap.put("MEMBER_IDX", "12");
		Map<String, Object> map = mypageService.selectMember(commandMap.getMap());
		

		
		mv.addObject("map", map);
		
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
		
		return mv;
	}
	
	//*메시지->받은메시지list
	@RequestMapping("/receiveMessage.do")
	public ModelAndView receiveMsgForm(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{ //받은 메시지를 select박스를 이용해 숙소와 트립의 선택에 따라 리스트를 뽑는다.
		
		ModelAndView mv = new ModelAndView("receiveMsgForm");
		
		/*session_member_email = (String)session.getAttribute("member_email"); //selectReceiveMessage 리스트를 저장할 list 객체
		commandMap.put("member_email", session_member_email);
		*/
		commandMap.put("member_email", "jieunkyung@naver.com");
		
		ArrayList<Map<String, Object>> list = new ArrayList<>(); //selectReceiveMessage 를 저장할 ArrayList<Map<String, Object>> 객체 생성 
		list = (ArrayList<Map<String, Object>>)mypageService.selectReceiveMsgList(commandMap.getMap());
		
		mv.addObject("list", list);
		
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
		
		ModelAndView mv = new ModelAndView("my_HouseDetail");
		
		int house_idx = Integer.parseInt(request.getParameter("HOUSE_IDX"));
		session_member_email  = (String)session.getAttribute("member_email");
		commandMap.put("HOUSE_IDX", house_idx);
		commandMap.put("MEMBER_EMAIL", session_member_email);
		
		Map<String, Object> houseMap = mypageService.selectHouseDetail(commandMap.getMap()); //숙소 상세보기 
		ArrayList<Map<String, Object>> reserList = (ArrayList<Map<String, Object>>) mypageService.selectH_ReserList(commandMap.getMap()); //해당 숙소의 예약 현황 리스트 
		ArrayList<Map<String, Object>> msgList= (ArrayList<Map<String, Object>>) mypageService.selectH_MsgList(commandMap.getMap()); //해당 숙소의 쪽지
		
		mv.addObject("houseMap",houseMap);
		mv.addObject("reserList", reserList);
		mv.addObject("msgList", msgList);
		
		return mv;
	}
	//*숙소목록=>예약관리 리스트
	@RequestMapping("/houseReser.do")
	public ModelAndView houseReserForm(CommandMap commandMap, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView("houseReserForm");
		
		/*session_member_idx = (Integer)session.getAttribute("MEMBER_IDX");
		commandMap.put("MEMBER_IDX", session_member_idx);*/
		
		commandMap.put("MEMBER_IDX", "12");
		ArrayList<Map<String, Object>> list = (ArrayList<Map<String, Object>>) mypageService.selectMy_ReserList(commandMap.getMap()); //예약목록 리스트 
		
		mv.addObject("list", list);		
		
		return mv;
	}
	//*숙소목록->예약관리->예약상세보기 
	@RequestMapping(value="/houseReserDetail.do", method=RequestMethod.POST)
	public ModelAndView houseReserDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("houseReserDetail");
		
		int house_idx = Integer.parseInt(request.getParameter("HOUSE_IDX"));
		int hr_idx = Integer.parseInt(request.getParameter("HR_IDX"));
		commandMap.put("HOUSE_IDX", house_idx);
		commandMap.put("HR_IDX", hr_idx);
		
		Map<String, Object> map = mypageService.selectReserDetail(commandMap.getMap());
		Map<String, Object> countDate = mypageService.countDate(commandMap.getMap());
		
		mv.addObject("map", map);
		mv.addObject("countDate", countDate);
		return mv;
	}
	
	//숙소목록->예약관리 ->예약 상세->예약취소 요청
	@RequestMapping(value="H_reserDeleteOk.do", method=RequestMethod.POST)
	public ModelAndView reserDeleteOk(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("redirect:/mypage/H_reserDelete.do");
		
		int house_idx = Integer.parseInt(request.getParameter("HOUSE_IDX"));  //예약취소할 house_idx 값을 jsp에서 받는다
		int hr_idx = Integer.parseInt(request.getParameter("HR_IDX"));
		commandMap.put("HOUSE_IDX", house_idx); //받은 house_idx값을 map에 저장  
		commandMap.put("HR_IDX", hr_idx);
		
		mypageService.updateHr_delete_state_1(commandMap.getMap()); //hr_delete_state를 1로 update
		mypageService.updateHr_delete_date(commandMap.getMap());  //hr_delete_date 를 sysdate로 update 
		
		return mv;
	}
	
	//숙소목록->예약관리-> 예약 취소 리스트 
	@RequestMapping("H_reserDelete.do")
	public ModelAndView reserDelete(CommandMap commandMap, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView("H_reserDelete");
		
		/*session_member_idx = (Integer)session.getAttribute("MEMBER_IDX");
		commandMap.put("MEMBER_IDX", session_member_idx);
		*/
		commandMap.put("MEMBER_IDX", "12");
		ArrayList<Map<String, Object>> list = (ArrayList<Map<String, Object>>) mypageService.selectH_ReserDeleteList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	//숙소목록->예약관리->예약취소리스트-> 예약취소상세보기 폼이
	@RequestMapping(value="houseReserD_Detail.do", method=RequestMethod.POST)
	public ModelAndView houseReserD_Detail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("houseReserD_Detail");
		
		int house_idx =Integer.parseInt(request.getParameter("HOUSE_IDX")) ;
		int hr_idx= Integer.parseInt(request.getParameter("HR_IDX"));
		
		commandMap.put("HOUSE_IDX", house_idx);
		commandMap.put("HR_IDX", hr_idx);
		
		Map<String, Object> map = mypageService.selectReserDetail(commandMap.getMap());
		
		mv.addObject("map", map);
		return mv;

	}
	
	//숙소목록->예약관리->예약취소리스트-> 예약취소상세보기에서 리스트 목록 삭제 삭제
	@RequestMapping(value="H_reserD_DeleteOk.do", method=RequestMethod.POST)
	public ModelAndView H_reserD_Delete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("redirect:/mypage/H_reserDelete.do");
		
		int house_idx =Integer.parseInt(request.getParameter("HOUSE_IDX")) ;
		int hr_idx= Integer.parseInt(request.getParameter("HR_IDX"));
		
		commandMap.put("HOUSE_IDX", house_idx);
		commandMap.put("HR_IDX", hr_idx);
		
		mypageService.deleteReserDelete(commandMap.getMap());
		
		return mv;
	}
	
//--------------------------------------------트립목록 시작---------------------------------------------
	
	//*트립목록=>트립목록 리스트 
	@RequestMapping("/trip.do")
	public ModelAndView tripForm(CommandMap commandMap, HttpSession session) throws Exception{
		
		ModelAndView mv = new  ModelAndView("tripForm");
		
		/*session_member_idx=(Integer)session.getAttribute("MEMBER_IDX");
		commandMap.put("MEMBER_IDX", session_member_idx);
		*/
		commandMap.put("MEMBER_IDX", "12");
		ArrayList<Map<String, Object>> list = (ArrayList<Map<String, Object>>)mypageService.selectTripList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	
	//*트립목록 ->트립목록 상세보기 
	@RequestMapping("/tripDetail.do")
	public ModelAndView tripDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("myTripDetail");
		
		int trip_idx = Integer.parseInt(request.getParameter("TRIP_IDX"));
		int index = Integer.parseInt(request.getParameter("index"));
		commandMap.put("TRIP_IDX", trip_idx);
		commandMap.put("index", index);
		
		Map<String, Object> map = mypageService.selectTripDetail(commandMap.getMap()); //해당 트립 상세보기 
		ArrayList<Map<String, Object>> reserList = (ArrayList<Map<String, Object>>) mypageService.selectT_MsgList(commandMap.getMap());
		ArrayList<Map<String, Object>> msgList = (ArrayList<Map<String, Object>>) mypageService.selectT_MsgList(commandMap.getMap());
		
		mv.addObject("map", map);
		mv.addObject("reserList", reserList);
		mv.addObject("msgList", msgList);
		mv.addObject("index", index);
		return mv;
	}
	//*트립목록=>예약관리리스트 
	@RequestMapping("/tripReser.do")
	public ModelAndView tripReserForm(CommandMap commandMap, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView("tripReserForm");
		
//		session_member_idx = (Integer)session.getAttribute("MEMBER_IDX");
//		commandMap.put("MEMBER_IDX", session_member_idx);
//		
		commandMap.put("MEMBER_IDX", "12");
		ArrayList<Map<String, Object>> list = (ArrayList<Map<String, Object>>) mypageService.selectMy_TReserList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	//트립목록->예약관리->예약상세보기 
	@RequestMapping(value="tripReserDetail.do", method=RequestMethod.POST)
	public ModelAndView tripReserDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("tripReserDetail");
		
		int trip_idx = Integer.parseInt(request.getParameter("TRIP_IDX"));
		int tr_idx = Integer.parseInt(request.getParameter("TR_IDX"));
		
		commandMap.put("TRIP_IDX", trip_idx);
		commandMap.put("TR_IDX", tr_idx);
		
		Map<String, Object> map= mypageService.selectT_ReserDetail(commandMap.getMap());

		mv.addObject("map", map);
		return mv;
	}
	//트립목록 ->예약관리->예약관리 상세보기-> 예약취소 요청
	@RequestMapping(value="/T_reserDeleteOk.do", method=RequestMethod.POST)
	public ModelAndView T_reserDeleteOk(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("redirect:/mypage/T_reserDelete.do");

		int trip_idx = Integer.parseInt(request.getParameter("TRIP_IDX"));
		int tr_idx=Integer.parseInt(request.getParameter("TR_IDX"));
		commandMap.put("TRIP_IDX", trip_idx);
		commandMap.put("TR_IDX", tr_idx);
		
		mypageService.updateTr_delete_state1(commandMap.getMap());
		mypageService.updateTr_delete_date(commandMap.getMap());
		
		return mv;
	}
	//트립목록->예약관리->예약 취소 리스트 
	@RequestMapping("/T_reserDelete.do")
	public ModelAndView T_reserDelete(CommandMap commandMap, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView("T_reserDelete");
		
		/*session_member_idx = (Integer)session.getAttribute("MEMBER_IDX");
		commandMap.put("MEMBER_IDX", session_member_idx);*/
		
		commandMap.put("MEMBER_IDX", "12");
		
		ArrayList<Map<String, Object>> list = (ArrayList<Map<String, Object>>) mypageService.selectT_ReserDeleteList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	//트립목록->예약관리->예약 취소 리스트 ->예약취소 상세보기 
	@RequestMapping(value="tripReserD_Detail.do", method=RequestMethod.POST)
	public ModelAndView tripReserD_Detail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("tripReserD_Detail");
		
		int trip_idx = Integer.parseInt(request.getParameter("TRIP_IDX"));
		int tr_idx = Integer.parseInt(request.getParameter("TR_IDX"));
		
		commandMap.put("TRIP_IDX", trip_idx);
		commandMap.put("TR_IDX", tr_idx);
		
		Map<String, Object> map = mypageService.selectT_ReserDetail(commandMap.getMap());
		
		mv.addObject("map", map);
		
		return mv;
	}
	
	//트립목록->예약관리->예약 취소 리스트 ->예약취소 상세보기 ->예약취소 목록에서 해당트립 삭제 
	@RequestMapping(value="T_reserD_DeleteOk.do", method=RequestMethod.POST)
	public ModelAndView T_reserD_DeleteOk(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("redirect:/mypage/T_reserDelete.do");
		
		int trip_idx = Integer.parseInt(request.getParameter("TRIP_IDX"));
		int tr_idx=Integer.parseInt(request.getParameter("TR_IDX"));
		commandMap.put("TRIP_IDX", trip_idx);
		commandMap.put("TR_IDX", tr_idx);
		
		mypageService.deleteT_ReserDelete(commandMap.getMap());
		
		return mv;
	}

	
//-------------------------------------------위시리스트 시작---------------------------------------------
	
	//숙소 위시리스트 목록
	@RequestMapping(value="/houseWishList.do" , method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView houseWishListForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("houseWishList");
		
		/*session_member_idx = (Integer)session.getAttribute("MEMBER_IDX");
		commandMap.put("MEMBER_IDX", session_member_idx);*/
		commandMap.put("MEMBER_IDX", "12");
		
		Map<String, Object> resultMap = mypageService.selectMy_HouseList(commandMap.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));
		mv.addObject("wishType", "house");
		
		return mv;
	}
	
	//트립위시리스트 목록 
	@RequestMapping("/tripWishList.do")
	public ModelAndView tripWishListForm(CommandMap commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("tripWishList");
		
		/*session_member_idx = (Integer)session.getAttribute("MEMBER_IDX");
		commandMap.put("MEMBER_IDX", session_member_idx);*/
		commandMap.put("MEMBER_IDX", "12");
		
		Map<String, Object> resultMap = mypageService.selectMy_TripList(commandMap.getMap());
		
		mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));
		mv.addObject("wishType", "trip");
		
		return mv;
	}
	
	/*//리스트에서 사진정보 ajax로 가져옴 
	@RequestMapping(value="/housePhotoInfo.do", method=RequestMethod.POST)
	public ModelAndView housePhotoInfo(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/potoInfo");
		String house_idx = request.getParameter("HOUSE_IDX");
		
		String images = mypageService.selectImage(house_idx);
		System.out.println("images: " + images);
		
		String[] imgs = images.split("\\|");
		mv.addObject("img", imgs);
		return mv;
	}
	*/

	
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
