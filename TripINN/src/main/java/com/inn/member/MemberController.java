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
@RequestMapping("/member") //"/action"�� �ް� "tiles"�� ����
public class MemberController {
	
	Logger log = Logger.getLogger(this.getClass()); //????
	
	@Resource(name="memberService") //"memberService"�� @Service���� ���ǵ� MemberServiceImpl.java������ Resource�� ����
	private MemberService memberService; 	//Member ���� �޼��� �޾ƿ�
											// sql���� Service�� ����� memberDAO���� �޾ƿ�
	
	ModelAndView mav = new ModelAndView(); // ModelnView Ÿ������ �����ϱ� ���� ����
	
	//�α���
	@RequestMapping(value="/memberLogin.do", method=RequestMethod.POST) //'memberLogin.do' ����� ���� ��� ����Ǵ� ����
	public ModelAndView memberLogin(HttpServletRequest request, CommandMap commandMap) throws Exception {
	
		Map<String, Object> memberMap = (Map<String, Object>)memberService.memberLogin(commandMap.getMap());
		//view���� commandMap�� �Է¹޾� �Ѿ�� ���� MemberService�� memberLogin �޼��带 ���� �� memberMap ��ü�� ����
		
		//������ ȸ�������� ������
		if(memberMap != null) { 
		
			HttpSession session = request.getSession();
	
			session.setAttribute("member_email", memberMap.get("MEMBER_EMAIL"));
			session.setAttribute("member_name", memberMap.get("member_name"));
			session.setAttribute("member_level", memberMap.get("MEMBER_LEVEL"));
			//�α��� �Ϸ� �� ������������ ���ư�
			mav.setViewName("redirect:/main.do"); 

			return mav;
			
		}
		//ȸ�������� ������ ���� ������ ���
		//mav.setViewName("member/loginError");
		return mav;
	}
	
	//ȸ������
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.POST)
	public ModelAndView memberJoin(CommandMap commandMap) throws Exception {
		//Validate Binding ??
		//new MemberValidator().validate(member, result);
		//memberService�� �Ѿ�� memberJoin �޼��� ����
		System.out.println(commandMap.getMap());
		memberService.memberJoin(commandMap.getMap());
		//ȸ������ �Ϸ� �� ������������ ���ư�
		mav.setViewName("redirect:/main.do"); 
		return mav;
	}   

}


