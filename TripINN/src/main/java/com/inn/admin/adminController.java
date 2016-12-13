package com.inn.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
	@RequestMapping("/admin/main.do")
	public String main() {
		
		return "adminmain";
	}
	
<<<<<<< HEAD
	@RequestMapping("/admin/qnaList.do")
=======
	@RequestMapping("/admin/qnalist.do")
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
	public String qnaList() {
		
		return "qnaList";
	}
	
<<<<<<< HEAD
	@RequestMapping("/admin/memberList.do")
=======
	@RequestMapping("/admin/memberlist.do")
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
	public String memberList() {
		
		return "memberList";
	}
	
	
<<<<<<< HEAD
	@RequestMapping("/admin/faqList.do")
=======
	@RequestMapping("/admin/faqlist.do")
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
	public String faqList() {
		
		return "faqList";
	}

}
