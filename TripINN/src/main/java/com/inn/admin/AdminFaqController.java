package com.inn.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class AdminFaqController {
	 @RequestMapping("/admin/faqList.do")
	   public String faqList() {
	      
	      return "faqList";
	   }

}
