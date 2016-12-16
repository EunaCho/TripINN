package com.inn.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminFaqController {
	@RequestMapping("/admin/faqList.do")
	   public String memberList() {
	      
	      return "faqList";
	   }
}
<<<<<<< HEAD




=======
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
