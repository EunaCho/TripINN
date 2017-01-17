package com.inn.trip;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.common.common.CommandMap;

public interface TripService { 

	void tripRegist(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectTripList(Map<String, Object> map) throws Exception;

	String selectImages(String trip_idx) throws Exception;

	Map<String, Object> selectTripDetail(Map<String, Object> map);

	void tripReserve(Map<String, Object> map);

	void tripReview(Map<String, Object> map);

	Map<String, Object> reviewList(Map<String, Object> map);

	void reviewLike(Map<String, Object> map);

	String getLikeCnt(String parameter);

	Map<String, Object> getReviewInfoSub(Map<String, Object> map);

	void deleteLike(Map<String, Object> map);

	void insertLike(Map<String, Object> map);

	List<Map<String, Object>> likeCheckList(Map<String, Object> map);

	Map<String, Object> selectTripListSearch(Map<String, Object> map);

	void insertBookMark(Map<String, Object> map);

	void deleteBookMark(Map<String, Object> map);

	void tripReport(Map<String, Object> map);

	void reviewDel(String parameter);

	void sendMssg(Map<String, Object> map);

	
}
