package com.inn.admin;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminQnaController {
	
	@Resource
	private QnAService qnAService;
	private int searchNum;//�˻����� 1. ���� 2. ���� ��
	private String replyNum;//�亯��ȣ??
	private String isSearch;

	private int currentPage = 1; //ó�� ǥ�õǴ� ������
	private int totalCount;		//�� �� �����ε�
	private int blockCount = 10;//1�������� �� � �Ұ���
	private int blockPage = 5;  //�� ȭ�鿡 ��������ȣ ����� ����  ���� ���� ó���Ҳ���
	private String pagingHtml;  //
	private Paging page;        //

	private int comment_count; //�ڸ�Ʈ ��ȣ?
	private int commupdate1;   //�ڸ�Ʈ ��ȸ��?
	private String commenter;  //�ڸ�Ʈ�ۼ���

	@ModelAttribute("qnaModel") //�𵨰�ü �ʿ�
	public QnAModel formBack() {
		return new QnAModel(); // ��ü ������ ��ȯ
	}
	
	
	
	
	@RequestMapping("/admin/qnaList.do")
	public ModelAndView qnaList(HttpServletRequest request, QnAModel qnaModel) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
	     
		//���������� 1 �Ǵ� Ŭ���� ������
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		List<QnAModel> list;
		list = qnAService.QnAList();
		
		/* �Խ��� �˻� */
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
		
		//����¡����?
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
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
