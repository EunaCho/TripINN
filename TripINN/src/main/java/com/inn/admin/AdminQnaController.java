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
import com.inn.admin.AdminQnaService;
import com.inn.admin.AdminPaging;


@Controller
public class AdminQnaController {
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="adminQnaService")
    private AdminQnaService adminQnaService;
    
    //검색 구현을 위해 추가한 변수들
	private int searchNum;			//검색유형  0.제목  1.내용 2.작성자 
	private String isSearch; 

	//페이징 구현을 위해 추가한 변수들
	private int currentPage = 1; 	//처음 표시되는 페이지 
	private int totalCount;			//총 글 갯수
	private int blockCount = 10;	//1페이지당 글 몇개 할건지 정하는 변수
	private int blockPage = 5;  	//한 화면에 페이지번호 몇개까지 띄울 것인지 정하는 변수
	private String requestName;
	private String pagingHtml;  
	private AdminPaging page;  

    
    //리스트
    @RequestMapping(value="/admin/qnaList.do")
    public ModelAndView adminQnaList(HttpServletRequest request, CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("qnaList");

        if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
        
        
        List<Map<String,Object>> list;
        list = adminQnaService.qnaBoardList(commandMap.getMap());
        
        
        /* 게시판 검색 */
		String isSearch = request.getParameter("isSearch");  //jsp로부터 값을 받아와서
		
		commandMap.put("isSearch", isSearch);				//isSearch값을 맵에 집어넣는다.

		if (isSearch != null) {
			
			isSearch = new String(isSearch.getBytes("8859_1"), "UTF-8");
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			commandMap.put("searchNum", searchNum);		//searchNum값을 맵에 집어넣는다.

			if (searchNum == 0) {
				list = adminQnaService.search0(commandMap.getMap()); //제목
			}else if (searchNum == 1) {
				list = adminQnaService.search1(commandMap.getMap()); //내용
			}else if (searchNum == 2) {							
				list = adminQnaService.search2(commandMap.getMap()); //작성자
			}
		}
		
		totalCount = list.size();
		page = new AdminPaging(currentPage, totalCount, blockCount, blockPage,"qnaList", searchNum, isSearch);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
				
		list = list.subList(page.getStartCount(), lastCount);

		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("list", list);
		mv.setViewName("qnaList");  
		
        return mv;
    }
    
    //글쓰기 폼
    @RequestMapping(value="/admin/qnaWrite.do")
    public ModelAndView adminQnaWrite(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("qnaWrite");
         
        return mv;
    }
    
    //글쓰기 처리
    @RequestMapping(value="/admin/qnaInsertPro.do")
    public ModelAndView adminQnaInsertPro(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/admin/qnaList.do");
         
        adminQnaService.adminQnaInsertPro(commandMap.getMap());
         
        return mv;
    }
    
    
    //상세보기
    //1. 모델 대신 맵으로
    //2. 댓글리스트는 리스트로
    @RequestMapping(value="/admin/qnaDetail.do")
    public ModelAndView adminQnaDetail(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("qnaDetail");        
        
        Map<String,Object> map = adminQnaService.adminQnaSelectDetail(commandMap.getMap());

        //댓글리스트
        List<Map<String,Object>> list = adminQnaService.qnaCommList(commandMap.getMap());
        
        mv.addObject("map", map);     //맵을 모델앤뷰 객체에 담음
        mv.addObject("commList", list);	  //리스트(댓글리스트)를 모델앤뷰 객체에 담음
        return mv;
    }	
    
    	//댓글쓰기
    	@RequestMapping(value="/admin/qnaCommWrite.do" , method = RequestMethod.POST)
    	public ModelAndView qnaCommWrite(CommandMap commandMap) throws Exception{	
    		ModelAndView mv = new ModelAndView("redirect:/admin/qnaDetail.do");
    		
    		
    		adminQnaService.qnaCommWrite(commandMap.getMap());
    		mv.addObject("QNA_IDX", commandMap.get("QNA_IDX"));
    		
    		return mv;
    	}
    	
    	//댓글삭제
    	@RequestMapping(value="/admin/qnaCommDelete.do")
        public ModelAndView qnaCommDelete(CommandMap commandMap) throws Exception{
        	ModelAndView mv = new ModelAndView("redirect:/admin/qnaDetail.do");
 
        	System.out.println(commandMap.getMap());
        	
            adminQnaService.qnaCommDelete(commandMap.getMap());
            
            mv.addObject(commandMap.getMap());
            
          //해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
            mv.addObject("QNA_IDX", commandMap.get("QNA_IDX"));
            return mv;
        }

    
    //수정폼
    @RequestMapping(value="/admin/qnaUpdate.do")
    public ModelAndView adminQnaUpdate(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("qnaUpdate");
         
        Map<String,Object> map = adminQnaService.adminQnaSelectDetail(commandMap.getMap());
        mv.addObject("map", map);
         
        return mv;
    }
    
    //수정처리(저장)
    @RequestMapping(value="/admin/qnaUpdatePro.do")
    public ModelAndView adminQnaUpdatePro(CommandMap commandMap) throws Exception{

    	
        ModelAndView mv = new ModelAndView("redirect:/admin/qnaDetail.do");
         
        adminQnaService.adminQnaUpdatePro(commandMap.getMap());

        //해당 게시글의 글 번호를 mv.addObject 메서드를 이용하여 다시 전송
        mv.addObject("QNA_IDX", commandMap.get("QNA_IDX"));
        return mv;
    }
    
    //삭제하기
    @RequestMapping(value="/admin/qnaDelete.do")
    public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
        
    	ModelAndView mv = new ModelAndView("redirect:/admin/qnaList.do");	
        adminQnaService.adminQnaDelete(commandMap.getMap());

        return mv;
    }

}