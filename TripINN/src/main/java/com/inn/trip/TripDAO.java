package com.inn.trip;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;
import com.common.common.CommandMap;

@Repository("tripDAO")
public class TripDAO extends AbstractDAO {
	public void tripRegist(Map<String, Object> map) throws Exception {
		insert("trip.tripRegist", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTripList(Map<String, Object> map) throws Exception{
		String trip_area = (String) map.get("area");
		if(trip_area == null || trip_area.equals("")) {
			map.put("trip_area", "서울");
		}
		return selectPagingList("trip.tripList", map);
	}

	public String selectImages(String trip_idx) {
		return (String) selectOne("trip.getImages", trip_idx);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTripDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("trip.tripDetail", map);
	}

	public void tripReserve(Map<String, Object> map) {
		insert("trip.tripReserve", map);
	}

	public void tripReview(Map<String, Object> map) {
		insert("trip.tripReview", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewList(Map<String, Object> map) {
		return selectPagingList("trip.reviewList", map);
	}

	public void reviewLike(Map<String, Object> map) {
		update("trip.reviewLike", map);
	}

	public String getLikeCnt(String parameter) {
		return (String) selectOne("trip.getLikeCnt", parameter);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getReviewInfoSub(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("trip.getReviewInfoSub", map);
	}

	public void deleteLike(Map<String, Object> map) {
		delete("trip.deleteLike", map);
	}

	public void insertLike(Map<String, Object> map) {
		insert("trip.insertLike", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> likeCheckList(Map<String, Object> map) {
		return selectList("trip.likeCheckList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTripListSearch(Map<String, Object> map) {
		return selectPagingList("trip.selectTripListSearch", map);
	}

	public void insertBookMark(Map<String, Object> map) {
		insert("trip.insertBookMark", map);
	}

	public void deleteBookMark(Map<String, Object> map) {
		delete("trip.deleteBookMark", map);
	}
}
