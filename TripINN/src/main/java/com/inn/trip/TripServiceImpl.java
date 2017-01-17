package com.inn.trip;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.common.common.CommandMap;

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
	public Map<String, Object> selectTripList(Map<String, Object> map) throws Exception{
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

	@Override 
	public void tripReserve(Map<String, Object> map) {
		tripDAO.tripReserve(map);
	}

	@Override
	public void tripReview(Map<String, Object> map) {
		tripDAO.tripReview(map);
	}

	@Override
	public Map<String, Object> reviewList(Map<String, Object> map) {
		return tripDAO.reviewList(map);
	}

	@Override
	public void reviewLike(Map<String, Object> map) {
		tripDAO.reviewLike(map);
	}

	@Override
	public String getLikeCnt(String parameter) {
		return tripDAO.getLikeCnt(parameter);
	}

	@Override
	public Map<String, Object> getReviewInfoSub(Map<String, Object> map) {
		return tripDAO.getReviewInfoSub(map);
	}

	@Override
	public void deleteLike(Map<String, Object> map) {
		tripDAO.deleteLike(map);
	}

	@Override
	public void insertLike(Map<String, Object> map) {
		tripDAO.insertLike(map);
	}

	@Override
	public List<Map<String, Object>> likeCheckList(Map<String, Object> map) {
		return tripDAO.likeCheckList(map);
	}

	@Override
	public Map<String, Object> selectTripListSearch(Map<String, Object> map) {
		return tripDAO.selectTripListSearch(map);
	}

	@Override
	public void insertBookMark(Map<String, Object> map) {
		tripDAO.insertBookMark(map);
	}

	@Override
	public void deleteBookMark(Map<String, Object> map) {
		tripDAO.deleteBookMark(map);
	}

	@Override
	public void tripReport(Map<String, Object> map) {
		tripDAO.tripReport(map);
	}

	@Override
	public void reviewDel(String parameter) {
		tripDAO.reviewDel(parameter);
	}

	@Override
	public void sendMssg(Map<String, Object> map) {
		tripDAO.sendMsg(map);
	}

}
