package com.inn.trip;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("tripDAO")
public class TripDAO extends AbstractDAO {
	public void tripRegist(Map<String, Object> map) throws Exception {
		insert("trip.tripRegist", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTripList(Map<String, Object> map) throws Exception{
		return selectList("trip.tripList", map);
	}
}
