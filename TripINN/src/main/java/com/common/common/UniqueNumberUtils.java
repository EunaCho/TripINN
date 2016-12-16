package com.common.common;

import java.util.UUID; //Unique 고유키 반환.

public class UniqueNumberUtils {
	
	public static String getUniqueString(){
		return UUID.randomUUID().toString().replaceAll("-","");
	}
}
