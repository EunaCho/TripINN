package com.inn.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;

@Controller
@RequestMapping("/member") //"/action"을 받고 "tiles"를 리턴
public class MemberController {
	
	Logger log = Logger.getLogger(this.getClass()); //????
	
	@Resource(name="memberService") //"memberService"로 @Service명이 정의된 MemberServiceImpl.java파일을 Resource로 연결
	private MemberService memberService; 	//Member 관련 메서드 받아옴
											// sql문은 Service내 연결된 memberDAO에서 받아옴
	
	ModelAndView mav = new ModelAndView(); // ModelnView 타입으로 리턴하기 위해 정의
	  

	
	//회원가입
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.POST)
	public ModelAndView memberJoin(CommandMap commandMap) throws Exception {
		
		int chk = (int)memberService.memberEmailCheck(commandMap.getMap());
		
		//기존 DB에 이메일이 없으면
		if (chk == 0) {
			memberService.memberJoin(commandMap.getMap()); //회원정보 MEMBER 테이블에 insert
			//회원가입 완료 후 이전페이지로 돌아감
			mav.setViewName("member/joinSuccess"); 
		} else {
			//회원정보가 없으면 에러 페이지 출력
			mav.setViewName("member/joinError");
		}
		return mav; 
	}   
	
	/*//가입된 이메일인지 체크
	@RequestMapping(value="/memberEmailCheck.do", method=RequestMethod.POST)
	public int memberEmailCheck(CommandMap commandMap) throws Exception {
	
		System.out.println("이메일체크 : chk 값");
		int chk = (int)memberService.memberEmailCheck(commandMap.getMap());
		System.out.println(chk);
		System.out.println("체크완료");
				
				
		return chk;
	}
*/
	//로그인
	@RequestMapping(value="/memberLogin.do", method=RequestMethod.POST) //'memberLogin.do' 명령을 받을 경우 실행되는 로직
	public ModelAndView memberLogin(HttpServletRequest request, CommandMap commandMap) throws Exception {
	
		Map<String, Object> memberMap = (Map<String, Object>)memberService.memberLogin(commandMap.getMap());
		//view에서 commandMap에 입력받아 넘어온 값을 MemberService의 memberLogin 메서드를 돌린 후 memberMap 객체에 저장
		
		//기존에 회원정보가 있으면
		if(memberMap != null) { 
		
			HttpSession session = request.getSession();

			session.setAttribute("member_idx", memberMap.get("MEMBER_IDX"));
			session.setAttribute("member_email", memberMap.get("MEMBER_EMAIL"));
			session.setAttribute("member_name", memberMap.get("MEMBER_NAME"));
			session.setAttribute("member_level", memberMap.get("MEMBER_LEVEL"));
			session.setAttribute("member_phone", memberMap.get("MEMBER_PHONE"));
			//로그인 완료 후 메인페이지로 돌아감
			mav.setViewName("redirect:/main.do"); 
			//System.out.println(memberMap.get("MEMBER_IDX"));
			return mav;
			
		}
		//회원정보가 없으면 에러 페이지 출력
		mav.setViewName("member/loginError");
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value="/memberLogout.do")
	public ModelAndView memberLogout(HttpServletRequest request, CommandMap commandMap) throws Exception {
		System.out.println(1);
		HttpSession session = request.getSession();//세션값 불러옴
		System.out.println(2);
		System.out.println(session);
		if(session != null){ //세션에 값이 있으면
			session.invalidate(); //세션 값 비우기
			System.out.println("로그아웃");
		}
		//로그아웃 완료 후 메인페이지로 돌아감
		mav.setViewName("redirect:/main.do");
		return mav;
	}
}




