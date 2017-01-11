<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

 <style>
    	
    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left; position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info a {font-size: 14px; display: block; background: #d95050;padding:12px 36px 12px 14px; text-decoration: none; color: #fff;}
    .overlay_info a strong {background:url('http://icon-icons.com/icons2/508/PNG/512/home_house_icon-icons.com_49851.png') no-repeat; background-size:17px; padding-left: 27px;}
    .overlay_info .desc {padding:14px;position: relative; min-width: 190px; height: 80px;}
    .overlay_info img {vertical-align: top;}
    .overlay_info .address {font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 24px; white-space: normal}
    .overlay_info .address2{font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 80px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
    
    #closebtn {float: left; color: white; font-size: xx-large;}
    #diva{float: left;}
    .overlay_info #head{border-radius: 6px 6px 0 0; height: 43px; width: 100%; background: #d95050;}
</style>
<body>sdf
	
	
	<div class="overlay_info">
	<div id="head">
	<div id="diva">
    <a href="#" target="_blank"><strong>월정리 해수욕장</strong></a>
    </div>
    <div id="closebtn" onclick="closeOverlay('+i+')">X</div>
    </div>
    <div class="desc">
    <img src="#" alt=""><!-- 이미지 -->
    <span class="address"> 주소 : 제주특별자치도 제주시 구좌읍 월정리 33-3</span>
    <span class="address2"> 건물명 : 건물명 없음</span>
    </div>
    </div>
</body>
</html>