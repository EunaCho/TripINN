package com.inn.mypage;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	//**알림판
	@RequestMapping("/notice.do")
	public String noticeForm(CommandMap commandMap) throws Exception{
		
		return "noticeForm";
	}
	
	//**메시지
	//*메시지->보낸메시지(숙소/트립)
	@RequestMapping("/sendMessage.do")
	public String sendMsgForm(CommandMap commandMap) throws Exception{
		//보낸 메시지를 select박스를이용해서 숙소와 트립의 선택에 따라 리스트를 뽑는다. 
		return "sendMsgForm";
	}
	
	//*메시지->받은메시지(숙소/트립)
	@RequestMapping("/receiveMessage.do")
	public String receiveMsgForm(CommandMap commandMap) throws Exception{
		//받은 메시지를 select박스를 이용해 숙소와 트립의 선택에 따라 리스트를 뽑는다. 
		return "receiveMsgForm";
	}
	
	//**숙소목록
	//*숙소목록=>숙소목록 메인
	@RequestMapping("/house.do")
	public String houseForm(CommandMap commandMap) throws Exception{
		
		return "houseForm";
	}
	//*숙소목록=>예약관리
	@RequestMapping("/houseReser.do")
	public String houseReserForm(CommandMap commandMap) throws Exception{
		
		return "houseReserForm";
	}
	
	//**트립목록
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

	//*위시리스트
	@RequestMapping("/wishList.do")
	public String wishListForm(CommandMap commandMap) throws Exception{
		
		return "listForm";
	}
	
	//**프로필 
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
