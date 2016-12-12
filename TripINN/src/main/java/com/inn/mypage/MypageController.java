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
	public ModelAndView noticeForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("noticeForm");
		
		return mv;
	}
	
	
	//*메시지
	@RequestMapping("/message.do")
	public void messageForm(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
	}
	
	//*숙소목록
	@RequestMapping("/house.do")
	public void houseForm(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
	}
	
	//*트립목록
	@RequestMapping("/trip.do")
	public void tripForm(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
	}

	//*위시리스트
	@RequestMapping("/wishList.do")
	public void wishListForm(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
	}
	
	//*프로필 
	@RequestMapping("/profile.do")
	public void profileForm(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
	}

}
