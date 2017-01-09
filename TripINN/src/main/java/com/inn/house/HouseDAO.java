package com.inn.house;

import java.util.List;
import java.util.Map; //DB 파라미터값 맵 형태로 처리.
//테스트

import org.springframework.stereotype.Repository; //DAO 클래스 등록 어너테이션
import org.springframework.beans.factory.annotation.Autowired;
import org.mybatis.spring.SqlSessionTemplate;
import com.common.common.AbstractDAO; //SQL 오버로딩

@Repository("houseDAO") // DAO 클래스 등록
public class HouseDAO extends AbstractDAO{
	/*
	@SuppressWarnings
	1. all : 모든 경고를 억제
	2. cast : 캐스트 연산자 관련 경고 억제
	3. dep-ann : 사용하지 말아야 할 주석 관련 경고 억제
	4. deprecation : 사용하지 말아야 할 메소드 관련 경고 억제
	5. fallthrough : switch문에서의 break 누락 관련 경고 억제
	6. finally : 반환하지 않는 finally 블럭 관련 경고 억제
	7. null : null 분석 관련 경고 억제
	8. rawtypes : 제네릭을 사용하는 클래스 매개 변수가 불특정일 때의 경고 억제
	9. unchecked : 검증되지 않은 연산자 관련 경고 억제
	10. unused : 사용하지 않는 코드 관련 경고 억제
	
	House 기능
	1. 숙소 메인(리스트)
	2. 간편 검색
	3. 상세 검색
	
	
	4. 지도위 가격 클릭

	*/

	//숙소 리스트 
	@SuppressWarnings("unchecked")//경고 제외 어너테이션
	public List<Map<String,Object>> selectHouseList(Map<String,Object> map){
		return (List<Map<String,Object>>)selectList("house.selectHouseList",map);
	}
	//숙소 검색시 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchHouseList(Map<String, Object> map) {
		return (List<Map<String,Object>>)selectList("house.searchHouseList",map);
	}
	
	//숙소 지도 리스트
	public List<Map<String,Object>> selectHouseMapList(Map<String,Object> map){
		return (List<Map<String,Object>>) selectList("house.selectHouseMapList", map);
	}
	
	
	//insert DAO
	//등록 페이지 1
	public void insertHouse(Map<String, Object> map) throws Exception{
		System.out.println(map.get("HOUSE_ADDR1")+"************************** 다오");
		insert("house.insertHouse", map);
	}
	//등록 페이지 2
	public void insertHouseInfo(Map<String, Object> map) throws Exception{
		insert("house.insertHouseInfo", map);
	}
	
	
	
	//update DAO
	public void updateHouse(Map<String, Object> map) throws Exception{
		update("house.updateHouse", map);
	}
	//delete DAO
	public void deleteHouse(Map<String, Object> map) throws Exception{
		delete("house.deleteHouse", map);
	}
	
	//detail DAO
	@SuppressWarnings("unchecked") //검증되지 않은 연산자 관련 경고 억제
	public Map<String, Object> selectHouseDetail(Map<String,Object> map) throws Exception{
		return (Map<String, Object>) selectOne("house.selectHouseDetail", map);
	}

	//조회수 증가
	public void updateHitCnt(Map<String,Object> map) throws Exception{
		update("house.updateHitCnt",map);
	}
	
	//							file upload
	//file 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("house.selectFileList", map);
	}
	
	//insert file
	public void insertFile(Map<String, Object> map) throws Exception{
		insert("house.insertFile", map);
	}

	//update file
	public void updateFile(Map<String, Object> map) throws Exception{
		update("house.updateFile", map);
	}
	
	//delete file
	public void deleteFileList(Map<String, Object> map) throws Exception{
		update("house.deleteFileList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("house.selectReviewList", map);
	}
	public void insertReview(Map<String, Object> map) {
		insert("house.insertReview", map);
		
	}
}
