package com.inn.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class AdminMemberController {
	@RequestMapping("/admin/memberList.do")
	   public String memberList() {
	      
	      return "memberList";
	   }
}
