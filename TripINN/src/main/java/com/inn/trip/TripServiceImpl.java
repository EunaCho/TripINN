package com.inn.trip;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service("tripService")
public class TripServiceImpl implements TripService {
	
	@Resource(name="tripDAO")
	private TripDAO tripDAO;
	
	@Resource(name="tripFileUtils")
	private FileUtils fileUtils;
	
	@Override
	public void tripRegist(Map<String, Object> map, HttpServletRequest request) throws Exception {
		String trip_image = fileUtils.parseInsertFileInfo(map, request); // 파일 업로드 시키고 파일 명 가져옴.
		
		System.out.println("trip_iamge : " + trip_image);
		map.put("trip_image", trip_image);
		tripDAO.tripRegist(map);
	}

	@Override
	public List<Map<String, Object>> selectTripList(Map<String, Object> map) throws Exception{
		return tripDAO.selectTripList(map);
	}

	@Override
	public String selectImages(String trip_idx) throws Exception {
		return tripDAO.selectImages(trip_idx);
	}

	@Override
	public Map<String, Object> selectTripDetail(Map<String, Object> map) {
		return tripDAO.selectTripDetail(map);
	}

}
