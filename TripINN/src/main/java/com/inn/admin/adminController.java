package com.inn.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
	@RequestMapping("/admin/main.do")
	public String main() {
		
		return "adminmain";
	}
	
	@RequestMapping("/admin/qnaList.do")
	public String qnaList() {
		
		return "qnaList";
	}
	
	@RequestMapping("/admin/memberList.do")
	public String memberList() {
		
		return "memberList";
	}
	
	
	@RequestMapping("/admin/faqList.do")
	public String faqList() {
		
		return "faqList";
	}

}
