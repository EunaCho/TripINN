package com.inn.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHouseController {
	@RequestMapping("/admin/houseList.do")
	   public String memberList() {
	      
	      return "houseList";
	   }
}