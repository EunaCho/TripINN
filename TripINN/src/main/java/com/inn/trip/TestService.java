package com.inn.trip;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TestService {
	void insertTest(Map<String, Object> map, HttpServletRequest request) throws Exception;
}
