package com.inn.admin;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
	public class AdminQnaController {
	
	@Resource
	private QnAService qnAService;
	private int searchNum;//검색유형 1. 제목 2. 내용 등
	private String replyNum;//답변번호??
	private String isSearch;

	private int currentPage = 1; //처음 표시되는 페이지
	private int totalCount;		//총 글 갯수인듯
	private int blockCount = 10;//1페이지당 글 몇개 할건지
	private int blockPage = 5;  //한 화면에 페이지번호 몇개까지 띄우고  이전 다음 처리할껀지
	private String pagingHtml;  //
	private Paging page;        //

	private int comment_count; //코멘트 번호?
	private int commupdate1;   //코멘트 조회수?
	private String commenter;  //코멘트작성자

	@ModelAttribute("qnaModel") //모델객체 필요
	public QnAModel formBack() {
		return new QnAModel(); // 객체 생성후 반환
	}
	
	
	
	
	@RequestMapping("/admin/qnaList.do")
	public ModelAndView qnaList(HttpServletRequest request, QnAModel qnaModel) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
	     
		//현재페이지 1 또는 클릭한 페이지
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		List<QnAModel> list;
		list = qnAService.QnAList();
		
		/* 게시판 검색 */
		String isSearch = request.getParameter("isSearch");
		if(isSearch != null) isSearch = new String(isSearch.getBytes("8859_1"), "UTF-8");

		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if (searchNum == 0) {
				list = qnAService.QnASearch0(isSearch);
			} else if (searchNum == 1) {
				list = qnAService.QnASearch1(isSearch);
			} else if (searchNum == 2) {
				list = qnAService.QnASearch2(isSearch);
				
			}
		}
		
		//페이징관련?
		totalCount = list.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "QnAList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		list = list.subList(page.getStartCount(), lastCount);

		//??
		int no = qnaModel.getNo();
		commupdate1 = qnAService.QnAcommUpdate1(no);

		mav.addObject("QnAModel", qnaModel);
		mav.setViewName("QnAView");

		mav.addObject("isSearch", isSearch);
		mav.addObject("searchNum", searchNum);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("list", list);
		mav.addObject("commupdate1", commupdate1);
		mav.setViewName("QnAList");
		return mav;
		
	      return "qnaList";
	   
	}

}
