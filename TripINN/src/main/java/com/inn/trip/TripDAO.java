package com.inn.trip;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.common.AbstractDAO;

@Repository("tripDAO")
public class TripDAO extends AbstractDAO {
	public void tripRegist(Map<String, Object> map) throws Exception {
		insert("trip.tripRegist", map);
	}
}
