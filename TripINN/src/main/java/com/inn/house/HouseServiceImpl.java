package com.inn.house;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;//등록된 DAO 클래스 사용. 필요한 자원을 자동으로 연결될때 사용하는 어너테이션
/*
 @Autowried와 @Resource를 사용할 수 있는 위치.
 @Autowried : 필드, 생성자, 입력파라미터가 여러개인 메소드에 적용가능
 @Resource : 필드, 입력파라미터가 한 개인 빈 프로퍼티 setter 메소드에 적용가능
 * */

import javax.servlet.http.HttpServletRequest; //jsp 파라미터 값 송수신 하기 위함.

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.inn.house.FileUtils; //Service 클래스 등록


//서비스 클래스 등록
@Service("houseService")
public class HouseServiceImpl implements HouseService{
	
	@Resource(name = "houseDAO") //@Repository로 등록된 DAO 클래스를 연결.
	private HouseDAO houseDAO;
	
	@Resource(name = "houseFileUtils") //@Component로 등록된 Utils 클래스를 연결.
	private FileUtils fileUtils; //file Upload를 하기위한 객체 생성.
	
	// service 인터페이스 구현.
	// DAO클래스에 명시된 sql문을 이용하여 구현.
	
	//house list
	@Override
	public List<Map<String, Object>> selectHouseList(Map<String, Object> map) throws Exception {
		return houseDAO.selectHouseList(map);
	}
	
	@Override
	public List<Map<String, Object>> searchHouseList(Map<String, Object> map) throws Exception {
		return houseDAO.searchHouseList(map);
	}
	//house 지도 리스트
	@Override
	public List<Map<String, Object>> selectHouseMapList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		return houseDAO.selectHouseMapList(map);
	}

	//house 첫번째 등록
	@Override
	public void insertHouse(Map<String, Object> map, HttpServletRequest request) throws Exception{
		util(map);
//		file img 등록
		String HouseImgList = fileUtils.parseInsertFileInfo(map, request);
		map.put("HOUSE_IMAGE", HouseImgList);
//		System.out.println(map.get("HOUSE_ADDR1")+"************************** 서비스 임플");
		houseDAO.insertHouse(map); // HOUSE 등록
		houseDAO.insertHouseInfo(map); // HOUSEINFO 등록
	}

	//house update
	@Override
	public void updateHouse(Map<String, Object> map, HttpServletRequest request) throws Exception {
		houseDAO.updateHouse(map);
	}

	//house delete
	@Override
	public void deleteHouse(Map<String, Object> map) throws Exception {
	}

	//house detail
	@Override
	public Map<String, Object> selectHouseDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	//hi_space, hi_cspace 문자열 변경 기능
	public void util(Map<String, Object> map){
		
		//편의 시설
		if(map.get("HI_SPACE") != null && map.get("HI_SPACE") instanceof String[] && !(map.get("HI_SPACE") instanceof String)){
		String space = "";
//		String[] space_list = request.getParameterValues("HI_SPACE");
		String[] space_list = (String[]) map.get("HI_SPACE");
		String[] space_info = new String[space_list.length];
		
		for(int i=0; i<space_list.length; i++){
			space_info[i] = space_list[i]+",";
			space += space_info[i];
		}
		space = space.substring(0, space.length()-1);
		map.put("HI_SPACE", space);
		/*
		System.out.println("space*************" + space);
		System.out.println("HI*************" + map.get("HI_SPACE"));
		*/
		}
		
		//이용 공간
		if(map.get("HI_CSPACE") != null && map.get("HI_CSPACE") instanceof String[] && !(map.get("HI_CSPACE") instanceof String)){
		String cspace = "";
		String[] cspace_list = (String[]) map.get("HI_CSPACE");
		String[] cspace_info = new String[cspace_list.length];
		
		for(int i=0; i<cspace_list.length; i++){
			cspace_info[i] = cspace_list[i]+",";
			cspace += cspace_info[i];
		}
		cspace = cspace.substring(0, cspace.length()-1);
		map.put("HI_CSPACE", cspace);
		
		/*
		System.out.println("cspace************" + cspace);
		System.out.println("cspace************" + map.get("HI_CSPACE"));
		*/
		}
	}

	

}
