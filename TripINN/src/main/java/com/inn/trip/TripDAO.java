package com.inn.trip;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("tripDAO")
public class TripDAO extends AbstractDAO {
	public void tripRegist(Map<String, Object> map) throws Exception {
		insert("trip.tripRegist", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTripList(Map<String, Object> map) throws Exception{
		String trip_area = (String) map.get("area");
		if(trip_area == null || trip_area.equals("")) {
			map.put("trip_area", "서울");
		}
		return selectList("trip.tripList", map);
	}

	public String selectImages(String trip_idx) {
		return (String) selectOne("trip.getImages", trip_idx);
	}

	public Map<String, Object> selectTripDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("trip.tripDetail", map);
	}

	public void tripReserve(Map<String, Object> map) {
		insert("trip.tripReserve", map);
	}

	public void tripReview(Map<String, Object> map) {
		insert("trip.tripReview", map);
	}

	public List<Map<String, Object>> reviewList(Map<String, Object> map) {
		return selectList("trip.reviewList", map);
	}

	public void reviewLike(Map<String, Object> map) {
		update("trip.reviewLike", map);
	}

	public String getLikeCnt(String parameter) {
		return (String) selectOne("trip.getLikeCnt", parameter);
	}
}
