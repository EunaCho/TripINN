package com.inn.house;

import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.common.common.CommandMap;

//DAO 기능 구현
public interface HouseService {
	//리스트 목록 보기 기능
	List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception;

	//하우스검색 정렬
	List<Map<String, Object>> searchHouseList(Map<String, Object> map) throws Exception;

	//삽입 기능
	void insertHouse(Map<String, Object> map, HttpServletRequest request) throws Exception;
		
	//수정 기능
	void updateHouse(Map<String, Object> map, HttpServletRequest request) throws Exception;
	//삭제 기능
	void deleteHouse(Map<String, Object> map) throws Exception;
	//상세보기 기능
	Map<String, Object> selectHouseDetail(Map<String, Object> map) throws Exception;

	//하우스 리뷰 리스트
	List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception;

	void insertReview(Map<String, Object> map) throws Exception;

	void deleteReview(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectHouseMapList(Map<String, Object> map) throws Exception;
	
	void insertWish(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void deleteWish(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	String selectWishIdx(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMember(Map<String, Object> map);
	
	void houseReserve(Map<String, Object> map);

	//리뷰 좋아요 기능
	void deleteLike(Map<String, Object> map);

	void insertLike(Map<String, Object> map);

	void reviewLike(Map<String, Object> map);

	String selectLikeCnt(String parameter);

	List<Map<String, Object>> likeCheckList(Map<String, Object> map);
	
	void sendMssg(Map<String, Object> map) throws Exception;

	void increaseHouseCnt(Map<String, Object> map);

	void insertReportHouse(Map<String, Object> map);

	void updateTotalPrice(Map<String, Object> map);


}
