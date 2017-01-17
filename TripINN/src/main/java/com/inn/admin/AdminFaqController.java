package com.inn.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
import com.inn.admin.AdminFaqService;

@Controller
public class AdminFaqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminFaqService")
    private AdminFaqService adminFaqService;
	
	//faq 리스트 이용방법 리스트
	@RequestMapping(value="/admin/faqList.do")
	public ModelAndView adminFaqList(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("howToUse");
        List<Map<String,Object>> list = adminFaqService.faqBoardList(commandMap.getMap());
        mv.addObject("list", list);
        
        return mv;
    }
	
	//faq 여행방법 리스트
			@RequestMapping(value="/admin/faqList1.do")
			public ModelAndView adminFaqList1(CommandMap commandMap) throws Exception{
		        ModelAndView mv = new ModelAndView("howToTrip");
		        List<Map<String,Object>> list = adminFaqService.faqBoardList(commandMap.getMap());
		        mv.addObject("list", list);
		        
		        return mv;
		    }
			//faq 내 정보 리스트
			@RequestMapping(value="/admin/faqList2.do")
			public ModelAndView adminFaqList2(CommandMap commandMap) throws Exception{
		        ModelAndView mv = new ModelAndView("myInfo");
		        List<Map<String,Object>> list = adminFaqService.faqBoardList2(commandMap.getMap());
		        mv.addObject("list", list);
		        
		        return mv;
		    }
			//faq 보안과 비밀번호 리스트
		  	@RequestMapping(value="/admin/faqList3.do")
		  	public ModelAndView adminFaqList3(CommandMap commandMap) throws Exception{
		  	    ModelAndView mv = new ModelAndView("securityPassword");
		  	    List<Map<String,Object>> list = adminFaqService.faqBoardList2(commandMap.getMap());
		  	    mv.addObject("list", list);
		  	        
		  	    return mv;
		  	    }
		  	
		  //faq 숙소 찾기 리스트
		  	@RequestMapping(value="/admin/faqList4.do")
		  	public ModelAndView adminFaqList4(CommandMap commandMap) throws Exception{
		  	    ModelAndView mv = new ModelAndView("findPlace");
		  	    List<Map<String,Object>> list = adminFaqService.faqBoardList2(commandMap.getMap());
		  	    mv.addObject("list", list);
		  	    return mv;
		 }
		  //faq 숙소 예약 리스트
		  	@RequestMapping(value="/admin/faqList5.do")
		  	public ModelAndView adminFaqList5(CommandMap commandMap) throws Exception{
		  	    ModelAndView mv = new ModelAndView("rsvPlace");
		  	    List<Map<String,Object>> list = adminFaqService.faqBoardList2(commandMap.getMap());
		  	    mv.addObject("list", list);
		  	    return mv;
		 }
		  //faq 트립 참가 리스트
		  	@RequestMapping(value="/admin/faqList6.do")
		  	public ModelAndView adminFaqList6(CommandMap commandMap) throws Exception{
		  	    ModelAndView mv = new ModelAndView("tripJoin");
		  	    List<Map<String,Object>> list = adminFaqService.faqBoardList2(commandMap.getMap());
		  	    mv.addObject("list", list);
		  	    return mv;
		 }
		  //faq 트립호스팅  리스트
		  	@RequestMapping(value="/admin/faqList7.do")
		  	public ModelAndView adminFaqList7(CommandMap commandMap) throws Exception{
		  	    ModelAndView mv = new ModelAndView("tripHosting");
		  	    List<Map<String,Object>> list = adminFaqService.faqBoardList2(commandMap.getMap());
		  	    mv.addObject("list", list);
		  	    return mv;
		 }
		  //faq 리뷰  리스트
		  	@RequestMapping(value="/admin/faqList8.do")
		  	public ModelAndView adminFaqList8(CommandMap commandMap) throws Exception{
		  	    ModelAndView mv = new ModelAndView("review");
		  	    List<Map<String,Object>> list = adminFaqService.faqBoardList2(commandMap.getMap());
		  	    mv.addObject("list", list);
		  	    return mv;
		 }
		  	
		  	
		  	
		  	
	//faq 이용방법 글쓰기폼
		@RequestMapping(value="/admin/faqWrite.do")
	    public ModelAndView adminFaqWrite(CommandMap commandMap,HttpServletRequest request) throws Exception{
	        ModelAndView mv = new ModelAndView("faqWrite");
	        
	        mv.addObject("faq_type",request.getParameter("faq_type"));
	        return mv;
	    }
		
		
		
		
		
	//faq 이용방법 글쓰기 처리
	@RequestMapping(value="/admin/faqWriteInsert.do")
	public ModelAndView adminFaqInsert(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do");   
	    	adminFaqService.adminFaqInsert(commandMap.getMap());     
	    return mv;
	    }
	
	//faq 여행방법 글쓰기 처리
			@RequestMapping(value="/admin/faqWriteInsert1.do")
			public ModelAndView adminFaqInsert1(CommandMap commandMap) throws Exception{
			    ModelAndView mv = new ModelAndView("redirect:/admin/faqList1.do");   
			    	adminFaqService.adminFaqInsert(commandMap.getMap());     
			    return mv;
			    }
			//faq 내 정보 글쓰기 처리
			@RequestMapping(value="/admin/faqWriteInsert2.do")
			public ModelAndView adminFaqInsert2(CommandMap commandMap) throws Exception{
			    ModelAndView mv = new ModelAndView("redirect:/admin/faqList2.do");   
			    	adminFaqService.adminFaqInsert(commandMap.getMap());     
			    return mv;
			    }
			//faq 보안과 비밀번호 글쓰기 처리
			  @RequestMapping(value="/admin/faqWriteInsert3.do")
			  public ModelAndView adminFaqInsert3(CommandMap commandMap) throws Exception{
				  ModelAndView mv = new ModelAndView("redirect:/admin/faqList3.do");   
			  		adminFaqService.adminFaqInsert(commandMap.getMap());     
			  		return mv;
			  }
			  
			//faq 여행파트 숙소찾기 글삽입
			  @RequestMapping(value="/admin/faqWriteInsert4.do")
			  public ModelAndView adminFaqInsert4(CommandMap commandMap) throws Exception{
				  ModelAndView mv = new ModelAndView("redirect:/admin/faqList4.do");   
			  		adminFaqService.adminFaqInsert(commandMap.getMap());     
			  		return mv;
			  }
			  
			//faq 여행파트 숙소예약 글삽입
			  @RequestMapping(value="/admin/faqWriteInsert5.do")
			  public ModelAndView adminFaqInsert5(CommandMap commandMap) throws Exception{
				  ModelAndView mv = new ModelAndView("redirect:/admin/faqList5.do");   
			  		adminFaqService.adminFaqInsert(commandMap.getMap());     
			  		return mv;
			  }
			//faq 트립파트 트립참가 글삽입
			  @RequestMapping(value="/admin/faqWriteInsert6.do")
			  public ModelAndView adminFaqInsert6(CommandMap commandMap) throws Exception{
				  ModelAndView mv = new ModelAndView("redirect:/admin/faqList6.do");   
			  		adminFaqService.adminFaqInsert(commandMap.getMap());     
			  		return mv;
			  }
			  
			//faq 트립파트 트립호스팅 글삽입
			  @RequestMapping(value="/admin/faqWriteInsert7.do")
			  public ModelAndView adminFaqInsert7(CommandMap commandMap) throws Exception{
				  ModelAndView mv = new ModelAndView("redirect:/admin/faqList7.do");   
			  		adminFaqService.adminFaqInsert(commandMap.getMap());     
			  		return mv;
			  }
			//faq 리뷰파트 글삽입
			  @RequestMapping(value="/admin/faqWriteInsert8.do")
			  public ModelAndView adminFaqInsert8(CommandMap commandMap) throws Exception{
				  ModelAndView mv = new ModelAndView("redirect:/admin/faqList8.do");   
			  		adminFaqService.adminFaqInsert(commandMap.getMap());     
			  		return mv;
			  }
	
			  
			  
	//faq 이용방법 수정폼
    @RequestMapping(value="/admin/faqUpdate.do")
    public ModelAndView adminFaqUpdate(CommandMap commandMap , HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("faqUpdate");
 
        Map<String,Object> map = adminFaqService.adminFaqSelectDetail(commandMap.getMap()); 
        mv.addObject("map", map);     //맵을 모델앤뷰 객체에 담음
         
        return mv;
    }
    
    
    
    
   //faq 이용방법 수정처리(저장)
    @RequestMapping(value="/admin/faqUpdatePro.do")
    public ModelAndView adminFaqUpdate(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do");
        adminFaqService.adminFaqUpdate(commandMap.getMap());

        //해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
        mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
        return mv;
    }
  //faq 여행방법 수정처리(저장)
  	@RequestMapping(value="/admin/faqUpdatePro1.do")
  	public ModelAndView adminFaqUpdate1(CommandMap commandMap) throws Exception{
  	    ModelAndView mv = new ModelAndView("redirect:/admin/faqList1.do");
  	    adminFaqService.adminFaqUpdate(commandMap.getMap());

  	    //해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
  	    mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
  	    return mv;
  	}
  //faq 내 정보 수정처리(저장)
  		@RequestMapping(value="/admin/faqUpdatePro2.do")
  		public ModelAndView adminFaqUpdate2(CommandMap commandMap) throws Exception{
  		    ModelAndView mv = new ModelAndView("redirect:/admin/faqList2.do");
  		    adminFaqService.adminFaqUpdate(commandMap.getMap());

  		    //해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
  		    mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
  		    return mv;
  		}
  	//faq 보안과 비밀번호 수정처리(저장)
  		 @RequestMapping(value="/admin/faqUpdatePro3.do")
  		  	public ModelAndView adminFaqUpdate3(CommandMap commandMap) throws Exception{
  		  		ModelAndView mv = new ModelAndView("redirect:/admin/faqList3.do");
  		  		adminFaqService.adminFaqUpdate(commandMap.getMap());

  		  		//해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
  		  		mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
  		  		    return mv;
  		 }
  		//faq 숙소찾기 수정처리(저장)
  		 @RequestMapping(value="/admin/faqUpdatePro4.do")
  		  	public ModelAndView adminFaqUpdate4(CommandMap commandMap) throws Exception{
  		  		ModelAndView mv = new ModelAndView("redirect:/admin/faqList4.do");
  		  		adminFaqService.adminFaqUpdate(commandMap.getMap());

  		  		//해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
  		  		mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
  		  		    return mv;
  		 }
  		//faq 숙소예약 수정처리(저장)
  		 @RequestMapping(value="/admin/faqUpdatePro5.do")
  		  	public ModelAndView adminFaqUpdate5(CommandMap commandMap) throws Exception{
  		  		ModelAndView mv = new ModelAndView("redirect:/admin/faqList5.do");
  		  		adminFaqService.adminFaqUpdate(commandMap.getMap());

  		  		//해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
  		  		mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
  		  		    return mv;
  		 }
  		//faq 트립참가 수정처리(저장)
  		 @RequestMapping(value="/admin/faqUpdatePro6.do")
  		  	public ModelAndView adminFaqUpdate6(CommandMap commandMap) throws Exception{
  		  		ModelAndView mv = new ModelAndView("redirect:/admin/faqList6.do");
  		  		adminFaqService.adminFaqUpdate(commandMap.getMap());

  		  		//해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
  		  		mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
  		  		    return mv;
  		 }
  		//faq 트립호스팅 수정처리(저장)
  		 @RequestMapping(value="/admin/faqUpdatePro7.do")
  		  	public ModelAndView adminFaqUpdate7(CommandMap commandMap) throws Exception{
  		  		ModelAndView mv = new ModelAndView("redirect:/admin/faqList7.do");
  		  		adminFaqService.adminFaqUpdate(commandMap.getMap());

  		  		//해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
  		  		mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
  		  		    return mv;
  		 }
  		//faq 리뷰 수정처리(저장)
  		 @RequestMapping(value="/admin/faqUpdatePro8.do")
  		  	public ModelAndView adminFaqUpdate8(CommandMap commandMap) throws Exception{
  		  		ModelAndView mv = new ModelAndView("redirect:/admin/faqList8.do");
  		  		adminFaqService.adminFaqUpdate(commandMap.getMap());

  		  		//해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
  		  		mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
  		  		    return mv;
  		 }
  		 
  		
  	
    
   //faq 삭제유형1
    @RequestMapping(value="/admin/faqDelete.do")
    public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do");	
        adminFaqService.adminFaqDelete(commandMap.getMap());
        return mv;
    }
    //faq 삭제유형2
    @RequestMapping(value="/admin/faqDelete1.do")
    public ModelAndView deleteBoard1(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/admin/faqList1.do");	
        adminFaqService.adminFaqDelete(commandMap.getMap());
        return mv;
    }
  //faq 삭제유형2
    @RequestMapping(value="/admin/faqDelete2.do")
    public ModelAndView deleteBoard2(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/admin/faqList2.do");	
        adminFaqService.adminFaqDelete(commandMap.getMap());
        return mv;
    }
  //faq 삭제유형2
    @RequestMapping(value="/admin/faqDelete3.do")
    public ModelAndView deleteBoard3(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/admin/faqList3.do");	
        adminFaqService.adminFaqDelete(commandMap.getMap());
        return mv;
    }
  //faq 삭제유형2
    @RequestMapping(value="/admin/faqDelete4.do")
    public ModelAndView deleteBoard4(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/admin/faqList4.do");	
        adminFaqService.adminFaqDelete(commandMap.getMap());
        return mv;
    }
    //faq 삭제유형2
    @RequestMapping(value="/admin/faqDelete5.do")
    public ModelAndView deleteBoard5(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/admin/faqList5.do");	
        adminFaqService.adminFaqDelete(commandMap.getMap());
        return mv;
    }
  //faq 삭제유형2
    @RequestMapping(value="/admin/faqDelete6.do")
    public ModelAndView deleteBoard6(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/admin/faqList6.do");	
        adminFaqService.adminFaqDelete(commandMap.getMap());
        return mv;
    }
    
    //faq 삭제유형2
    @RequestMapping(value="/admin/faqDelete7.do")
    public ModelAndView deleteBoard7(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/admin/faqList7.do");	
        adminFaqService.adminFaqDelete(commandMap.getMap());
        return mv;
    }
  //faq 삭제유형2
    @RequestMapping(value="/admin/faqDelete8.do")
    public ModelAndView deleteBoard8(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/admin/faqList8.do");	
        adminFaqService.adminFaqDelete(commandMap.getMap());
        return mv;
    }
    
    
  //faq 내 정보 상세보기 유형 1
    @RequestMapping(value="/admin/faqDetail.do")
    public ModelAndView adminFaqDetail(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("faqDetail");        
        
        Map<String,Object> map = adminFaqService.adminFaqSelectDetail(commandMap.getMap());
        
        mv.addObject("map", map);     //맵을 모델앤뷰 객체에 담음
        return mv;
    }	
  //faq 상세보기 유형2
  	 @RequestMapping(value="/admin/faqDetail2.do")
  	  	public ModelAndView adminFaqDetail2(CommandMap commandMap) throws Exception{
  	  		 ModelAndView mv = new ModelAndView("faqDetail2");        
  	  		        
  	  		 Map<String,Object> map = adminFaqService.adminFaqSelectDetail(commandMap.getMap());
  	  		        
  	  		 mv.addObject("map", map);     //맵을 모델앤뷰 객체에 담음
  	  		 return mv;
  	  	}
	
}		  
	
		
	/*faq 여행방법 글쓰기폼
	@RequestMapping(value="/admin/faqWrite1.do")
	public ModelAndView adminFaqWrite1(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("faqWrite1");
			return mv;
		}*/	
		
	
	/*faq 여행방법 수정폼
	@RequestMapping(value="/admin/faqUpdate1.do")
	public ModelAndView adminFaqUpdate1(CommandMap commandMap , HttpServletRequest request) throws Exception{
	    ModelAndView mv = new ModelAndView("faqUpdate1");
	    Map<String,Object> map = adminFaqService.adminFaqSelectDetail(commandMap.getMap()); 
	    mv.addObject("map", map);     //맵을 모델앤뷰 객체에 담음
	         
	    return mv;
	    }*/
	
		
	
		
		
		/*faq 내 정보 글쓰기폼
		@RequestMapping(value="/admin/faqWrite2.do")
		public ModelAndView adminFaqWrite2(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("faqWrite2");
				return mv;
			}*/	
			
		
			
		
			
			
		/*faq 내 정보 수정폼
		@RequestMapping(value="/admin/faqUpdate2.do")
		public ModelAndView adminFaqUpdate2(CommandMap commandMap , HttpServletRequest request) throws Exception{
		    ModelAndView mv = new ModelAndView("faqUpdate2");
		    Map<String,Object> map = adminFaqService.adminFaqSelectDetail(commandMap.getMap()); 
		    mv.addObject("map", map);     //맵을 모델앤뷰 객체에 담음
		         
		    return mv;
		    }*/
			

		
	    

	  
	  /*faq 보안과 비밀번호 글쓰기폼
	  @RequestMapping(value="/admin/faqWrite3.do")
	  public ModelAndView adminFaqWrite3(CommandMap commandMap) throws Exception{
	  		ModelAndView mv = new ModelAndView("faqWrite3");
	  			return mv;
	  }	*/
	  			
	  
	  			
	 
	  			
	  			
	 /*faq 보안과 비밀번호 수정폼
	 @RequestMapping(value="/admin/faqUpdate3.do")
	  	public ModelAndView adminFaqUpdate3(CommandMap commandMap , HttpServletRequest request) throws Exception{
	  		ModelAndView mv = new ModelAndView("faqUpdate3");
	  		Map<String,Object> map = adminFaqService.adminFaqSelectDetail(commandMap.getMap()); 
	  		mv.addObject("map", map);     //맵을 모델앤뷰 객체에 담음
	  		         
	  		return mv;
	  }*/
	 
	 
	 
	 
	 //여행파트 숙소찾기
	
	 /*faq 여행파트 숙소찾기 글쓰기폼
	@RequestMapping(value="/admin/faqWrite4.do")
	public ModelAndView adminFaqWrite4(CommandMap commandMap) throws Exception{
		 ModelAndView mv = new ModelAndView("faqWrite4");
		  return mv;
	}*/
  	 
	  /*
	  //faq 상세보기 유형2
		 @RequestMapping(value="/admin/faqDetail3.do")
		  	public ModelAndView adminFaqDetail3(CommandMap commandMap) throws Exception{
		  		 ModelAndView mv = new ModelAndView("faqDetail3");        
		  		        
		  		 Map<String,Object> map = adminFaqService.adminFaqSelectDetail(commandMap.getMap());
		  		        
		  		 mv.addObject("map", map);     //맵을 모델앤뷰 객체에 담음
		  		 return mv;
		  	}
		 
		 
	//faq 여행파트 숙소찾기 수정폼
		 @RequestMapping(value="/admin/faqUpdate4.do")
		  	public ModelAndView adminFaqUpdate4(CommandMap commandMap , HttpServletRequest request) throws Exception{
		  		ModelAndView mv = new ModelAndView("faqUpdate4");
		  		Map<String,Object> map = adminFaqService.adminFaqSelectDetail(commandMap.getMap()); 
		  		mv.addObject("map", map);     //맵을 모델앤뷰 객체에 담음
		  		         
		  		return mv;
		  }*/
		 
		 

	  
	 
	 
	 
  
	    
		
		
		
		
		
		
		
		
	
		
	
	
	
	
    
    

    
    
    
    
   
    
    
    
    
    
    
    
 