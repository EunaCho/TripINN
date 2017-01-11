package com.common.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class ConvertAddress {
	
	public static String conAddr(String address) {
		String apiKey = "31244aa6795ca046e48d086d5b53f8c6";
		String inputLine;
		BufferedReader bufferedReader = null;
		String resultSet = null;
		try {
			
			String requestURL = "https://apis.daum.net/local/geo/addr2coord";
			requestURL += "?apikey=" + apiKey;
			requestURL += "&q=" + URLEncoder.encode(address, "UTF-8");
			requestURL += "&output=" + "JSON";
			System.out.println("requestURL : " + requestURL);
			URL url = new URL(requestURL);
			URLConnection conn = url.openConnection();
			bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
			//System.out.println("readLIne : " + bufferedReader.readLine());
			
			//resultSet = parseJSONData(bufferedReader);
			resultSet = bufferedReader.readLine();
			System.out.println("resultSet : " + resultSet);
		} catch(MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bufferedReader.close();
			} catch(IOException e) {
				
			}
			
		}
		return resultSet;
	}
	
	public static String decode(String uni){

		StringBuffer str = new StringBuffer();

		for( int i=uni.indexOf("\\u"); i > -1 ; i = uni.indexOf("\\u") ){

		str.append( uni.substring( 0, i ) );

		str.append( String.valueOf( (char)Integer.parseInt( uni.substring( i + 2, i + 6 ) ,16) ) );

		uni = uni.substring( i +6);

		}

		str.append( uni );

		return str.toString();

	}
}
