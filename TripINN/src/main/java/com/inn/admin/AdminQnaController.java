package com.inn.admin;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminQnaController {

   @RequestMapping("/admin/qnaList.do")
      public String memberList() {
         
         return "qnaList";
   }
}
