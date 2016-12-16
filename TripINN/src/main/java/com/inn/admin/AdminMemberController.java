package com.inn.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class AdminMemberController {
	@RequestMapping("/admin/memberList.do")
	   public String memberList() {
	      
	      return "memberList";
	   }
	
	@RequestMapping("/admin/memberView.do")
	   public String memberView() {
	      
	      return "memberView";
	   }
	
	@RequestMapping("/admin/memberModify.do")
	   public String memberModify() {
	      
	      return "memberModify";
	   }
	
	
}
