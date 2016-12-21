package com.inn.admin;

import java.util.List;
import java.util.Map;


public interface AdminFaqService {

	List<Map<String, Object>> FaqBoardList(Map<String, Object> map) throws Exception;

}