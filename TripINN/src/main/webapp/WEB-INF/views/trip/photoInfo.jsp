<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="popWarp" style="width:637px; align:center;">
    <h1><img src="http://openimage.interpark.com/tourpark/tour/popup/h1_photo_gallery.gif" alt="포토갤러리"></h1>
    <a href="javascript:;" onclick="javascript:parent.HideLayer('HotelPhotoView');HideBackLayer();" class="btn-close"><img src="http://openimage.interpark.com/tourpark/tour/common/button/btn_close.gif" alt="닫기"></a>

    <div class="photo-block">
        <div class="photo-view">
        <c:forEach items="${imgs}" var="img" varStatus="status">
        	<c:if test="${status.index == 0}">
            <p class="photo"><img src="/TripINN/images/trip/${img}" id="img_photo_big_image" alt=""></p>
            </c:if>
		</c:forEach>            
        </div>
        <div class="movement">
            <a href="javascript:parent.fnGoodsPhotoGalleryPrev('1000034820','1','14');" class="btn-pre"><img src="http://openimage.interpark.com/tourpark/tour/common/button/btn_pre1.gif" alt="이전"></a>
            <ul class="photo-list">
            	  <c:forEach items="${imgs}" var="img" varStatus="status">
                  <li><a href="javascript:parent.fnGoodsPhoto1('${status.index + 1 }','/TripINN/images/trip/${img}','','','')"><img src="/TripINN/images/trip/${img}" ></a></li>
                  </c:forEach>
            </ul>
            <a href="javascript:parent.fnGoodsPhotoGalleryNext('1000034820','1','14');" class="btn-next"><img src="http://openimage.interpark.com/tourpark/tour/common/button/btn_next1.gif" alt="다음"></a>
        </div>
    </div>

</div>