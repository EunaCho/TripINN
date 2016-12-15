package com.common.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator; //배열 반복 처리를 할때 사용
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.common.common.UniqueNumberUtils;

@Component("fileUtils")//어너테이션을 활용하여 객체의 관리를 스프링이 담당하도록 설정.
public class FileUtils {
	private static final String filePath = "D:\\upload\\"; //업로드할 파일 경로
	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String, Object> map,
			HttpServletRequest request) throws Exception{
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); //파일의 이름을 iterator 객체에 저장
		
		MultipartFile multipartFile = null; // 객체 생성
		String originalFileName = null; // 실제 파일 명
		String originalFileExtension = null; //확장자 명
		String saveFileName = null; //저장된 파일 명
		
		List<Map<String,Object>> houseList = new ArrayList<Map<String, Object>>(); //list type map
		
		Map<String, Object> houseMap = null;// 숙소 map 초기값 선언
		String houseIdx = (String)map.get("HOUSE_IDX"); //file 게시판 idx 값
		
		String requestName = null;
		String house_idx = null;
		
		File file = new File(filePath); //파일 경로
		if(file.exists() == false){
			file.mkdirs();
		}
		
		while(iterator.hasNext()){ //배열안에 저장된 데이터가 존재하면.
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				originalFileName = multipartFile.getOriginalFilename();
				//subString 함수 . 다음의 문자열 반환
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				saveFileName = UniqueNumberUtils.getUniqueString() + originalFileExtension; //저장될 파일명 = 랜덤 함수 + 확장자 명
				
				file = new File(filePath + saveFileName);
				
				multipartFile.transferTo(file); //transferTo 파일 업로드를 지정한 파일로 저장.
				
				
				//키 설정
				houseMap = new HashMap<String, Object>(); //객체 생성
				houseMap.put("HOUSE_IDX", houseIdx);
				houseMap.put("IF_O_NAME", originalFileName);
				houseMap.put("IF_S_NAME", saveFileName);
				houseMap.put("IF_TYPE", 1); // 회원 이미지 0, 숙소 이미지 1, 트립 이미지 2 
				houseList.add(houseMap);
			}
			else{
				requestName = multipartFile.getName();
				//0부터 _문자열이 오는 값까지 추출
            	house_idx = requestName.substring(0, requestName.indexOf("_")) + "_IDX"; //request jsp에서 받아온 데이터 명을 substring
            	
            	if(map.containsKey(house_idx) == true && map.get(house_idx) != null){ // containKey() key가 존재하면 true.
            		houseMap = new HashMap<String,Object>(); // 객체 생성
            		houseMap.put("FILE_IDX", map.get(house_idx));
//            		listMap.put("IS_NEW", "N");
            		houseList.add(houseMap);
            		}
            	}		
		}
		return houseList;
	}
}
