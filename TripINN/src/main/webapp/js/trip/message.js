
function message(){
  
   var receive_member_email = $("#receiveEmail").val();
   var msg_content = document.getElementById('msg_content').value;
   var msg_title = document.getElementById('msg_title').value;
   var trip_idx = $("#trip_idx").val();
   
   $.ajax({
      type:'GET',
      url: '/TripINN/trip/sendMssg.do',
      async : true,
      dataType: "Text", 
      data : {"receive_member_email" : receive_member_email, "trip_idx" : trip_idx, "msg_title" : msg_title, "msg_content" : msg_content},
      success: function(data){
         alert("메세지를 보냈습니다.");
         $(".modal-backdrop").attr("class", " ");
         $(".fade").attr("style", "display:none");
         $("body").attr("class","");
         $("body").attr("style","width:100%; height:100%; margin: 0 px; padding:0px;");
      }
   });
}