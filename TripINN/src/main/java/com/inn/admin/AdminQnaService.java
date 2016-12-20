package com.inn.admin;

import java.util.List;
import java.util.Map;

public interface AdminQnaService {

	  List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
}
