package com.inn.mypage;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	//*알림판
	@RequestMapping("/notice.do")
	public String noticeForm(CommandMap commandMap) throws Exception{
		
		
		return "noticeForm";
	}
	
	
	//*메시지
	@RequestMapping("/message.do")
	public String messageForm(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
		return "msgList";
	}
	
	//*숙소목록
	@RequestMapping("/house.do")
	public String houseForm(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
		return "houseForm";
	}
	
	//*트립목록
	@RequestMapping("/trip.do")
	public String tripForm(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
		return "tripForm";
	}

	//*위시리스트
	@RequestMapping("/wishList.do")
	public String wishListForm(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
		return "listForm";
	}
	
	//*프로필 
	@RequestMapping("/profile.do")
	public String profileForm(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
		return "proForm";
	}

}
