package com.inn.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
   
   @RequestMapping("/admin/main.do")
   public String main() {
      
      return "adminmain";
   }

}