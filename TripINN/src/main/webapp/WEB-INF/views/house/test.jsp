<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="/TripINN/css/house/message.css">

<div class="container">
 <h2>모달</h2>
  <!-- 버튼 -->
   <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >
    Launch demo modal
     </button> 
     
     
     <!-- 모달 팝업 -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" > 
      <div class="modal-dialog"> 
      
      <div class="modal-content"> 
    
      <div class="modal-header header">
      <button type="button" class="close" data-dismiss="modal">
      <span aria-hidden="true">×</span>
      <span class="sr-only">Close</span>
      </button> 
      <img id="member_img" src="/TripINN/images/공유.png"/><label class="modal-title" id="myModalLabel">김종서 에게</label>
      </div> 
      
      <div class="modal-body">
      		<textarea class="form-control col-sm-5" rows="5"></textarea>
      </div> 
      
      <div class="modal-footer"> 
      <button type="button" class="buttonSetting sendBtn">보내기</button>
      <button type="button" class="buttonSetting closeBtn" data-dismiss="modal">닫기</button>
      </div>
      </div>
       
      
       </div>
       </div>
       </div>
       
      <div class="modal-content"> 
    
      <div class="modal-header header">
      <button type="button" class="close" data-dismiss="modal">
      <span aria-hidden="true">×</span>
      <span class="sr-only">Close</span>
      </button> 
      <img id="member_img" src="/TripINN/images/공유.png"/><label class="modal-title" id="myModalLabel">김종서 에게</label>
      </div> 
      
      <div class="modal-body">
      		<textarea class="form-control col-sm-5" rows="5"></textarea>
      </div> 
      
      <div class="modal-footer"> 
      <button type="button" class="btn btn-primary">보내기</button>
      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
      </div>
       