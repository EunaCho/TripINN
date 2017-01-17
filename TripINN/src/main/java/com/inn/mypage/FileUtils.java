package com.inn.mypage;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("memberFileUtils")
public class FileUtils {
   private static final String filePath = "C:\\Java\\git\\TripINN\\TripINN\\src\\main\\webapp\\images\\member\\";
   
   public String parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception {
      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
      Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
      
      MultipartFile multipartFile = null;
      String originalFileName = null;
      String originalFileExtension = null;
      String storedFileName = null;
      
      String member_image = "";
      File file = new File(filePath);
      if(!file.exists()) {
         file.mkdirs();
      }
      
      while(iterator.hasNext()) {
         multipartFile = multipartHttpServletRequest.getFile(iterator.next());
         if(!multipartFile.isEmpty()) {
            originalFileName = multipartFile.getOriginalFilename();
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            storedFileName = getRandomString() + originalFileExtension;
            System.out.println("storedFileName : " + storedFileName);
            file = new File(filePath + storedFileName);
            multipartFile.transferTo(file);
            
            member_image = member_image + storedFileName ; 
           
         }
      }
      return member_image;
   }
   
   public static String getRandomString(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
















