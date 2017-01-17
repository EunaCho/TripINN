<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<script>
	function fnMove(seq) {
		var offset = $("#tripDiv" + seq).offset();
		$("html, body").animate({scrollTop:offset.top-60}, 400);
	}
	function tripRegist() {
		var t_form = document.tripForm;
		var trip_area = t_form.trip_area.value;
		var trip_type = t_form.trip_type.value;
		
		if(trip_area == "") {
			alert("지역 정보를 입력해주세요.");
			return;
		}
		if(trip_type == "") {
			alert("유형 정보를 입력해주세요.");
			return;
		}
		
		t_form.submit();
	}
</script>
<style>
	.tripDiv { height: 1000px; }
	#wrap { width:100%;text-align:center;}
	/* #headerWrap { background:url('/TripINN/images/pix3.png') repeat; } */
	#tripHeader {  background-image: url('https://a1.muscache.com/airbnb/static/launch_platform/experience-hosting/hero_paola-ef7396a9cc13bbd2788ec6e5f553aad1.png');
				background-position: 85% 100% !important;
			    background-repeat: no-repeat !important;
			    background-size: contain !important;
			    background-color: #AAB9FF;
			    height: 200px;
			    width: 100%; }
	#ment1 { top: 10% !important; left:10% !important; position: absolute !important; max-width: 350px !important; }
	#ment1 span { font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif; font-size:13px; }
	#ment1 a { height:30px;border-radius:20px; border:2px solid black; text-decoration: none; color:#000; margin-top:50px; padding:7px; font-size:13px;}
	
	#tripMiddle .leftRight { margin: 20px; float:left; }
	#tripMiddle #tripLeft { width:36%;height:300px;border:0px solid black; }
	#tripMiddle #tripRight { width:56%;height:310px;border:0px solid red; }
	
	#tripInfo2 { width:98%;margin-left:10px; height:150px; }
	#tripInfo2 .start { width:23%; float:left; margin:5px; }
	#tripInfo2 div { font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif; font-size:11px; }
	#tripInfo2 .start h4 { height:10px; font-size:13px; margin-top:-2px;}
	.number {
		    border: 2px solid #a6a6a6;
		    padding-top:6px;
		    width: 28px;
		    height: 22px;
		    border-radius: 18px;
		    position: relative;
	}
	
	#make-trip { width:98%;margin-left:10px; height:170px; border:1px solid black; background:#007D83; }
	#make-trip h4{ color:#fff; }
	#make-trip span { color:#fff; font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif; font-size:13px; }
	#make-trip div { background:#fff; width:96%; height: 50px; margin: 5px auto; padding-top:10px;}
	#make-trip select {
	    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif;
	    font-size: 14px;
	    color: #484848 ;
	    margin: 5px;
	    margin-left:25px;
	    border: 1px solid #a6a6a6;
	    padding-left: 12px;
	    padding-right: 40px;
	    height: 30px;
	    display: block;
	    width: 25%;
	    float:left;
	}
	
	.imageContainer { width:47%; height:298px; margin: 5px; float:left;}
	.imageContainer #img1 { background-image:url('http://i.huffpost.com/gen/3862042/thumbs/o-TRAVELER-570.jpg?7'); }
	.imageContainer #img2 { background-image:url('https://a1.muscache.com/airbnb/static/launch_platform/experience-hosting/immersion-feature-0e11092c5aee5846df29bedc0ddc7225.jpg');}
	.imageContainer .imgDiv{ width: 99%; height: 150px; background-size: 100%; background-repeat: no-repeat; }
	.imageContainer .imgMent{ width: 99%; height: 148px; }
	.imageContainer .imgMent span { font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif; font-size:11px; }
	
</style>
<div id="wrap"> 
	<!-- <div>
		<input type="button" value="div1" onclick="fnMove('1')"/>
		<input type="button" value="div2" onclick="fnMove('2')"/>
		<input type="button" value="div3" onclick="fnMove('3')"/>
	</div> -->
	<form action="<%=cp%>/tripRegistForm.do" name="tripForm" method="post">
	<div id="headerWrap">
	<div id="tripHeader" >
		<div id="ment1">
			<h4>열정을 가진 분야를 전 세계와 나누세요.</h4>
			<span>회원님의 도시에서 체험할 수 있는 이색적인 트립을 호스팅하여 부수입을 올려보세요.</span> <br /><br />
			<a href="javascript:fnMove('3')">트립 만들기</a>
		</div>
	</div>
	</div>
	<div id="tripMiddle">
		<div class="leftRight" id="tripLeft">
			<div class="imageContainer">
				<div class="imgDiv" id="img1"></div>
				<div class="imgMent">
					<h4>트립</h4>
					<span>트립은 짧은 시간 동안 회원님만의 세계로 게스트를 초대하는 것입니다.
					워크숍을 열 수도 있고 회원님이 좋아하는 동네를 보여줄 수도 있습니다.</span>
				</div>
			</div>
			<div class="imageContainer">
				<div class="imgDiv" id="img2"></div>
				<div class="imgMent">
					<h4>멀티트립</h4>
					<span>트립을 하루 만에 끝내고 싶지 않으시면, 여러 날에 걸쳐 트립을 호스팅해 보세요.
					멀티트립은 게스트와 친해지고 회원님의 세계를 좀더 깊이 있게 공유할 수 있는 가장 좋은 방법입니다.</span>
				</div>
			</div>
		</div>
		<div class="leftRight" id="tripRight" >
			<div id="tripInfo2">
				<div class="start">
					<div style="width:150px;"><div class="number">1</div></div>
					<h4>호스팅에 대해 파악</h4>
					<span>에어비앤비의 품질 기준을 보시고 다른 호스트는 어떻게 하는지, 호스트에게 무엇이 요구되는지 파악해 보세요.</span>
				</div>
				<div class="start">
					<div class="number">2</div>
					<h4>디자인 및 제출</h4>
					<span>트립을 구성하여 제출해 보세요. 품질 기준에 부합하면, 에어비앤비 담당 팀이 회원님께 연락하여 다음 단계를 밟을 수 있도록 도와드립니다.</span>
				</div>
				<div class="start">
					<div class="number">3</div>
					<h4>원하는 대로 호스팅</h4>
					<span>트립이 사이트에 게시되면, 가능한 시간에 호스팅하실 수 있습니다. 그룹당 인원과 가격을 설정할 수도 있습니다.</span>
				</div>
				<div class="start">
					<div class="number">4</div>
					<h4>이동 중 트립 관리</h4>
					<span>앱에서 예약 관리, 게스트에게 메시지 보내기, 일정 업데이트를 할 수 있습니다.</span>
				</div>
			</div>
			<div style="clear:both;"></div>
			<div id="make-trip" >
				<h4>트립 호스트가 될 준비가 되셨나요?</h4>
				<span>원하는 트립을 디자인하는 것으로 시작하세요. 각 단계별로 안내해 드리겠습니다. <br />
				 회원님의 트립이 품질 기준에 부합하면 다음 단계에 대해 알려드립니다.</span>
				<div>
					<select name="trip_area" id="">
						<option value="">도시 선택</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="충청">충청</option>
						<option value="전라">전라</option>
						<option value="경상">경상</option>
						<option value="제주">제주</option>
					</select>
					
					<select name="trip_type" id="" >
						<option value="">유형 선택</option>
						<option value="엔터테인먼트">엔터테인먼트</option>
						<option value="예술 및 디자인">예술 및 디자인</option>
						<option value="패션">패션</option>
						<option value="스포츠">스포츠</option>
						<option value="웰빙">웰빙</option>
						<option value="자연">자연</option>
						<option value="음료 및 식사">음료 및 식사</option>
						<option value="라이프스타일">라이프스타일</option>
						<option value="역사">역사</option>
						<option value="음악">음악</option>
						<option value="비즈니스">비즈니스</option>
						<option value="바/클럽">바/클럽</option>
					</select>
					
					<div style="width:20%;height:18px;background:#95D09F;color:#fff;
					text-align:center; float:left; margin-left:20px; border-radius: 15px; padding:6px;
					cursor:pointer" onclick="tripRegist();">
						<b>트립 만들기</b>
					</div>
				</div>
					
			</div>
		</div>
	</div>
	<div style="clear:both;"></div>
	</form>
</div> 