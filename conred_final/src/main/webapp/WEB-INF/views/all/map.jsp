<jsp:include page="../all/header_map.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
 <script src="//code.jquery.com/jquery-1.12.4.js"></script>
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <link href="./css/map.css" rel="stylesheet"> 
<!-- <script src="./js/map.js"></script> -->
<style type="text/css">
</style>
<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc283bd41dff040b5403d29f3172b43a&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">

	function divToFit() {
		var $bodyH = window.innerHeight-90;
// 		$('#container').css("height",$bodyH);
		$('#mapbox').css("height",$bodyH);
		$('#show').css("height",$bodyH); 
		
// 		var $bodyW = window.innerWidth-405;
		var $bodyW = window.innerWidth-19;
// 		$('#container').css("width",$bodyW);
		$('#mapbox').css("width",$bodyW);
// 		$(".righthider").css("top",$bodyH/2+45);
	} 
	$(document).ready(function(){//온로드실행
		//여기서 if문으로 무슨검색을 할건지 나눠주자
		//
		var markerv = [];
		var markers = [];
		var overlays = [];
		var totalcount=0;
		var keyword = '<c:out value="${keyword}"/>';
		var category_code = '<c:out value="${category_code}"/>';
		//1★★★★★if 카테고리검색으로 맵에 들어온경우: 온로드로 카테고리 뿌려줌(키워드:지역검색성공으로 들어온경우도 해당)
		var pnum= 1;
		if(category_code!=""){
// 			alert("카테고리검색실행!");
// 			ajax_cate();//카테고리 뿌려주는 매서드
			
			//내주변 검색의 경우
			if(category_code==="loca"){
				myLoca();
				ajax_cate("A,B,C,D,E,F,G,H,I");
				kakao.maps.event.addListener(map, 'idle', function () {       //드래그끝나면실행
					ajax_cate("A,B,C,D,E,F,G,H,I");
// 					ajax_checkbox();
				});
			//전체 검색의 경우(지하철,지역 검색은 각 해당위치에서 따로 실행 > 여기서 신경안써도 된다.)
			}else if(category_code=="all"){
				ajax_cate("A,B,C,D,E,F,G,H,I");
			//개별 검색의 경우
			}else if(category_code!="all"){
				ajax_cate();
			}
// 			jQuery(document).ready(function() {
// 				var bodyOffset = jQuery('body').offset();
// 				jQuery(window).scroll(function() {
// 					if (jQuery(document).scrollTop() > bodyOffset.top) {
// 						jQuery('header').addClass('scroll');
// 					} else {
// 						jQuery('header').removeClass('scroll');
// 					}
// 				});
// 			});
			
			var showOffset=$("#show").offset();
			
			$("#show").scroll(function() {
		        var scrollT = $("#show").scrollTop(); //스크롤바의 상단위치
		        var scrollH = $("#show").height(); //스크롤바를 갖는 div의 높이
		        var contentH = $("#rightbox").height(); //문서 전체 내용을 갖는 div의 높이
		        if(scrollT + scrollH -36 >= contentH) { // 스크롤바가 아래 쪽에 위치할 때 //-35는 화살표버튼의 높이 -1 : 그런게없으면 +1을하면된다.
// 		            $('#divContent').append(imgs);
			        pnum++//전역변수
			        ajax_cate("A,B,C,D,E,F,G,H,I");
		        }
			});
			//체크박스가변했을때
			$(".categories input[type='checkbox']").change(function() {
				pnum=1;//페이지넘버초기화
// 				alert(pnum);
				ajax_checkbox();
			});
			
			//영역이변햇을때
			kakao.maps.event.addListener(map, 'idle', function () {
				pnum=1;//페이지넘버초기화
// 				alert(pnum);
				ajax_checkbox();//얘는 체크했던적이 있으면, 체크박스 실행되게한다.
			});
			
		}

		//2★★★★★if 키워드검색으로 맵에 들어온경우: 온로드로 키워드 뿌려줌
		//★키워드검색시 idle 설정은 각 검색기능(지역, 지하철, 매장 검색쪽에 있다.)
		//지역,지하철 :draggable / 매장: undraggable
		if(keyword!=""){
// 			alert("키워드검색실행!");
			ajax_keyword(keyword);//검색하러가는 매서드(전체:지역->지하철->매장)
			
			//체크박스가변했을때
			$(".categories input[type='checkbox']").change(function() {
				ajax_checkbox();
			});
			
		}
		
		//최종 결과를 뿌려줄 땐 checkbox가 체크되어있는지 여부를 거친다.
		function ajax_checkbox(){
			var count= 0;
			var selected_cates ="";
			var labels=$(".categories input[type='checkbox'] + label");
			var inputs=$(".categories input[type='checkbox']");
			
			//카테고리박스 몇개 체크되어있는지 확인 후, 카테고리 모으기
			for (var i = 0; i < labels.length; i++) {
				if(inputs.eq(i).is(":checked")==true){//카테고리 체크되어있으면
					count++;//카운트++(누를때마다바뀜)
					selected_cates+=inputs.eq(i).val()+",";//A,B, 
					totalcount++;//전체카운트(누적해서 쌓임->한번이라도 누른적 있으면0보다큼)
				}
				if(inputs.eq(i).is(":checked")==false){//카테고리 체크되어있지않으면
					//얘는 없어도 될듯. 확실치않음
// 					selected_cates.replace(inputs.eq(i).val(),"");//
				}
			}
			
			//안에값이 비어있지 않을경우 마지막","를 떼준다.
			if(selected_cates!=""){
				selected_cates=selected_cates.slice(0,-1);
			}
			
//1 			alert("현재 체크된 카테고리가 몇개 있는지:"+count);
//2 			alert("이제껏 체크된적이 있었는지:"+totalcount);

			if(count>0){//체크된카테고리가있다면
//3 				alert("체크박스검색실행:"+selected_cates.toUpperCase());
				ajax_cate(selected_cates.toUpperCase());
			}else if(count==0&&totalcount==0){//전체검색으로 들어온후 아무것도 체크한적이 없다면? 전체 검색되게 해야한다.
				ajax_cate();
			}else if(count==0&&totalcount>0){//체크된카테고리가없다면
//4 				alert("카테고리전체검색실행");
				ajax_cate("none");
			}
			
		};
		
		//키워드 검색 로직(1): 지역검색 성공시 해당 지역의 모든카테고리값을 뿌려준다.(온로드로 한번만?ㄴㄴ 온로드 후 드래그까지 가능ㅇㅋ)
		function ajax_keyword(keyword){

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(keyword, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {									
					//지역출력 성공 : 화면으로 + allcate
					//1.setCenter()로 해당위치 이동
					//2.ajax_cate()로 화면안의매장가져오기(all)
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
	 				map.setCenter(coords); //여기서 panto 쓰면 화면안에 스토어가 하나라도 잡힐 경우, 화면 bound를 잘못잡는경우가 생긴다. 이유는 모른다.
																								//2
					ajax_cate();
					kakao.maps.event.addListener(map, 'idle', function () {       //드래그끝나면실행
						ajax_checkbox();
					});
				}else{//지역출력 실패 : if 지하철검색 else if 매장검색
			    	ajax_subway(keyword);
			    	//지역출력 실패: 지하철ajax + allcate																			
					//1.아작스 : 지하철 정보 검색 쿼리(반환값 subway좌표)
					//2.setCenter()로 해당위치 이동
					//3.ajax_cate()로 화면안의매장가져오기(all)																	
			    }
			});    
		}

		//키워드 검색 로직(2): 지역검색 실패시 지하철db에서 해당되는 데이터가 있는지 검색한다.
		function ajax_subway(keyword) {
// 			alert("지역명 검색 실패! 지하철명으로 검색합니다.");
// 			alert("키워드는 "+keyword);

			//ajax 지하철 검색쿼리
			$.ajax({
				url:"map_subway_ajax.do",
				method:"post",
				dataType:"json",
				async: false,
				data:{"keyword":keyword},
				success:function(obj){
// 					alert("해당 지하철 유무 여부를 확인하겠습니다.");
					if(obj.subway_info.subway_name!="false"){
// 						alert("지하철역: "+obj.subway_info.subway_name);
// 						alert("위도: "+obj.subway_info.subway_latitude);
// 						alert("경도: "+obj.subway_info.subway_longitude);
	 					var coords = new kakao.maps.LatLng(obj.subway_info.subway_latitude, obj.subway_info.subway_longitude);
						map.setCenter(coords);
						
						ajax_cate();
						kakao.maps.event.addListener(map, 'idle', function () {//드래그끝나면실행
							ajax_checkbox();
						});
					}else if(obj.subway_info.subway_name=="false"){
// 						alert("없는  지하철역입니다.");
						ajax_store(keyword);
					}

				},
				error: function(request,error){
					alert("서버통신실패!!"+request.status+","+error);
				}
			});
		}
		
		//키워드 검색 로직(3): 지하철검색 실패시 매장db에서 해당되는 데이터가 있는지 검색한다.
		function ajax_store(keyword){
// 			alert("지하철명 검색 실패! 매장명으로 검색합니다.");
// 			alert("키워드는 "+keyword);
			$.ajax({
				url:"map_store_ajax.do",
				method:"post",
				dataType:"json",
				async:false,
				data:{"keyword":keyword},
				success:function(obj){
// 					alert("가장 유사한 매장이름을 고르겠습니다.");
					if(obj.store_info.store_name!="false"){
// 						alert("매장번호: "+obj.store_info.store_seq);
// 						alert("매장이름: "+obj.store_info.store_name);
// 						alert("위도: "+obj.store_info.store_latitude);
// 						alert("경도: "+obj.store_info.store_longitude);
	 					var coords = new kakao.maps.LatLng(obj.store_info.store_latitude, obj.store_info.store_longitude);
						map.setCenter(coords);
						
						ajax_store_detail(obj.store_info);
						
						kakao.maps.event.addListener(map, 'idle', function () {//드래그끝나면실행
							var count= 0;
							var labels=$(".categories input[type='checkbox'] + label");
							var inputs=$(".categories input[type='checkbox']");
							for (var i = 0; i < labels.length; i++) {
								if(inputs.eq(i).is(":checked")==true){
									count++;
								}
								if(inputs.eq(i).is(":checked")==false){

								}
							}
//5 							alert(count);
							if(count>0){
								ajax_checkbox();
							}
						});
					}else if(obj.store_info.store_name=="false"){
// 						alert("검색결과가 존재하지 않습니다.");
						swal("조금 더 정확히 입력해보개!", "지역, 주소, 지하철, 매장명중 하나로 검색해주세요\n ex)당산역 / 영등포구 양평동1가 211-1", "error");
						
						if(pnum==1){
							$(".storelist").remove();
							$("#rightbox").append("<div class='storelist' style='height:170px;text-align:center;padding-top:70px;'>----------현재 지역에서 검색되는 결과가 없습니다----------</div>");
							var position = $(".storelist").eq(0).position();
							$("#show").stop().animate({scrollTop : position.top}, 400);
						}
					}
				},
				error:function(request,error){
					alert("서버통신실패!"+request+","+error);
				}
			});
		}
		
		//키워드 검색 로직(4): 매장db에서 검색 성공시 해당 매장의 세부 정보들을 가져온다.
		function ajax_store_detail(store_info){
			$.ajax({
				url:"map_storedetail_ajax.do",
				method:"post", 
				dataType:"json",
				async:false,
				data:{"store_seq":store_info.store_seq},
				success:function(obj){
					if(obj.catelist!=null){
						console.log(obj);
						var store_lists = store_info;
						var photo_lists = obj.photolist;
						var cate_lists = obj.catelist;
						var stime_lists = obj.stimelist;
						var sloca_lists = obj.slocalist;
						var today = obj.today;
						var store_detail;
						var rb =$("#rightbox");
						if(pnum==1){
						    markers.forEach(function (marker) { marker.setMap(null); });
						    markers.length = 0 // 마커 배열 초기화
						    overlays.forEach(function (overlay) { overlay.setMap(null); });
						    overlays.length = 0 // 오버레이 배열 초기화
						}
					    if(pnum==1){
							$(".storelist").remove();
						}
							var store_state="";
							if (store_lists.store_state==='O') {
								store_state='<div class="storestate s_state_color1"><b>영업중</b></div>';
							}else if (store_lists.store_state==='B') {
								store_state='<div class="storestate s_state_color2"><b>휴업중</b></div>';
							}else if (store_lists.store_state==='C') {
								store_state='<div class="storestate s_state_color3"><b>폐점</b></div>';
							}
							
							//메달색정해주기
							//4이상 금
							//3이상4이하 은
							//3이하 동
							var medal ="";
							if(photo_lists[0].all_avg==null){
								medal="gold";
							}else if(photo_lists[0].all_avg>=4){//금
								medal="gold"; 
							}else if(photo_lists[0].all_avg<4&&photo_lists[0].all_avg>=3){//은
								medal="silver";
							}else if(photo_lists[0].all_avg<3){//동
								medal="bronze";
							}
							
							store_detail=
								'<div class="storelist" onclick="event.stopPropagation(); location.href=\'store.do?store_seq='+store_lists.store_seq+'\'">'+
											'<div class="photobox" style="'+
											'background: url(\'./upload_sphoto/'+photo_lists[0].store_photo_stored+'\');'+
											'background-size: 140px 105px;'+
										    'background-repeat: no-repeat;"></div>'+//사진:단일
											store_state+
											'<div class="storename">'+store_lists.store_name+'<span class="tooltiptext">'+store_lists.store_name+'</span></div>'+
											'<div class="review"><img class="star" alt="" src="./img/star_fill.png">'+photo_lists[0].all_avg+'</div>'+//평균(매장사진이랑 같이 가져오기)
											'<div class="medal"><img class="medal" alt="" src="./img/'+medal+'.png"></div>'+
											'<div class="cate_big">'+store_lists.category_name+'</div>'+//대표카테고리
											'<div class="cate_small">'+cate_lists+'</div>'+//세부카테고리--------------따로1
											'<div class="storephone">'+store_lists.store_phone+'</div>'+//전화번호
											'<div class="address">'+store_lists.store_address+'</div>'+//주소
											'<div class="storetime">영업시간:'+
												'<div class="storetime_today"></div>'+
												'<div class="storetime_other"></div>'+
											'</div>'+//영업시간--------------따로2
											'<div class="reservebtn" onclick="event.stopPropagation(); location.href=\'user_store_reserve.do?store_seq='+store_lists.store_seq+'&store_name='+store_lists.store_name+'\'">예약</div>'+
										'</div>';
							
							rb.append(store_detail);
							
							var stime="";
							var stimeArray= new Array();
							$.each(stime_lists, function(j) {//전체 요일 개수
								if (stime_lists[j].store_seq==store_lists.store_seq&&stime_lists[j].store_time_break==="N") {
									var stime=
									stime_lists[j].store_time_day+' '+
									stime_lists[j].store_time_open+' ~ '+
									stime_lists[j].store_time_close
									stimeArray.push(stime);
								}else if (stime_lists[j].store_seq==store_lists.store_seq&&stime_lists[j].store_time_break==="Y") {
									var stime=
									stime_lists[j].store_time_day+' '+" <span style=\"color:red;\">휴점일</span>";
									stimeArray.push(stime);
								}
							});
							console.log("매장시간"+stimeArray);
							$(".storelist").eq(0).find($(".storetime_today")).append(stimeArray[today===0?7:today-1]);
// 							$(".storelist").eq(0).find($(".storetime_other")).append(stimeArray);
							$(".storetime_today").eq(0).mouseover(function() {
// 								$(".storetime_other").eq(0).removeAttr("style");
// 								$(".storetime_other").eq(0).css("visibility","visible"); 
// 								$(".storetime_today").eq(0).css("z-index","100");
							});
							$(".storetime_today").eq(0).mouseout(function() {
// 								$(".storetime_today").eq(0).css("z-index","100");
// 								$(".storetime_other").eq(0).css({"visibility":"hidden","z-index":"100"});
							});
						     
							var medal ="";
							if(photo_lists[0].all_avg>=4){//금
								medal="gold";
							}else if(photo_lists[0].all_avg<4&&photo_lists[0].all_avg>=3){//은
								medal="silver";
							}else if(photo_lists[0].all_avg<3){//동
								medal="bronze";
							}
// 							alert("latitude:"+store_lists.store_name);
// 							alert("latitude:"+store_lists.store_latitude);
// 							alert("longitude:"+store_lists.store_longitude);
							var lat =parseFloat(store_lists.store_latitude);
							var lng =parseFloat(store_lists.store_longitude);
							var coords = new kakao.maps.LatLng(lat, lng);
// 							alert("coords:"+coords);
								
							// 마커 이미지의 이미지 주소입니다
			 				var imageSrc = './img/icon/icon_map_'+store_lists.category_code+'.png'; 
									
		 					// 마커 이미지의 이미지 크기 입니다
		 					var imageSize = new kakao.maps.Size(60, 60); 
								    
		 					// 마커 이미지를 생성합니다    
						    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
								 
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: coords, // 마커를 표시할 위치
						        image : markerImage // 마커 이미지 
						    });
						    markers.push(marker);
						    marker.setMap(map);
							    
						    var content = '<div class="icon_info">'+
						     					'<div class="icon_text">'+
							     					'<img class="medal_in" alt="" src="./img/'+medal+'.png">'+
						     						store_lists.store_name+
							     					'<span class="bigcate_in"> | '+
														store_lists.category_name+
													'</span>'+
						     					'</div>'+
						     					'<div class="smallcate_in">'+cate_lists+'</div>'+
						     				'</div>';
						    var customOverlay = new kakao.maps.CustomOverlay({
					    	    position: coords,
					    	    content: content,
					    	    xAnchor: 0.5,
					    	    yAnchor: 2,
					    	    clickable: true
						    });
						     overlays.push(customOverlay);
							// 커스텀 오버레이를 지도에 표시합니다
							 customOverlay.setMap(map);
							 customOverlay.setVisible(false);
							

							// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
						    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
						    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, customOverlay));
						    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(customOverlay));

						}else if (obj.catelist==null){
							if(pnum==1){
								$(".storelist").remove();
								$("#rightbox").append("<div class='storelist' style='height:170px;text-align:center;padding-top:70px;'>----------현재 지역에서 검색되는 결과가 없습니다----------</div>");
								var position = $(".storelist").eq(0).position();
								$("#show").stop().animate({scrollTop : position.top}, 400);
							}
						}
								
				},
				error:function(request,error){
					if(pnum==1){
						$(".storelist").remove();
						$("#rightbox").append("<div class='storelist' style='height:100%'>----------현재 지역에서 검색되는 결과가없습니다----------</div>");
					}
					alert("서버통신실패!!"+request.status+","+error);
				}
					
			});
		};
		
		//카테고리 검색(+전체검색) 로직(1):화면의 크기를 구한 후, 전달받은 카테고리 값에따라(전체or개별카테고리) 화면안에 포함되는 매장들의 세부적인 데이터들을 가져온다.
		function ajax_cate(selected_cates) {//만약 파라미터값이 있다면 사용.
// 		alert("검색실행:"+pnum);
// 		(2번방법)	영역정보를 ajax로 전달해서 모든세부값 가져오기	
	    var bounds = map.getBounds();// 지도 영역정보를 얻어옵니다 
	    var sw = bounds.getSouthWest();// 영역정보의 남서쪽 정보를 얻어옵니다 
	    var ne = bounds.getNorthEast();// 영역정보의 북동쪽 정보를 얻어옵니다 
	    var nelat=ne.getLat();
	    var nelng=ne.getLng();
	    var swlat=sw.getLat();
	    var swlng=sw.getLng();
// 	    alert(nelat);
// 	    alert(nelng);
// 	    alert(swlat);
// 	    alert(swlng);
	    var category_code = '<c:out value="${category_code}"/>';
	    if(category_code==""){//키워드검색 -> 지역 or 지하철 일때
	    	category_code=="all";
	    }
		if(selected_cates!=undefined&&selected_cates!=""){
			if(selected_cates==="none"){
				category_code="";
			} 
//6 			alert("체크되었었다!"+selected_cates);
			category_code=selected_cates;
		}
//7 	    alert("카테고리 : "+category_code);
			$.ajax({//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@카테고리검색:all
				url:"searchCateAll_ajax.do",
				method:"post",
				dataType: "json",
				async: false,
				data:{"pnum":pnum,"category_code":category_code,"nelat":nelat,"nelng":nelng,"swlat":swlat,"swlng":swlng},
				success:function(obj) {
// 					if('' || null || undefined || 0 || NaN){

					if(obj.list!=null){
						if(pnum==1){
						    markers.forEach(function (marker) { marker.setMap(null); });
						    markers.length = 0 // 마커 배열 초기화
						    overlays.forEach(function (overlay) { overlay.setMap(null); });
						    overlays.length = 0 // 오버레이 배열 초기화
						}
						console.log(obj);
						var store_lists = obj.list;
						var photo_lists = obj.photolist;
						var cate_lists = obj.catelist;
						var stime_lists = obj.stimelist;
						var sloca_lists = obj.slocalist;
						var today = obj.today;
						var store_detail;
						var rb =$("#rightbox");
						if(pnum==1){
							$(".storelist").remove();
						}
						$.each(store_lists, function(i){
							var store_state="";
							if (store_lists[i].store_state==='O') {
								store_state='<div class="storestate s_state_color1"><b>영업중</b></div>';
							}else if (store_lists[i].store_state==='B') {
								store_state='<div class="storestate s_state_color2"><b>휴업중</b></div>';
							}else if (store_lists[i].store_state==='C') {
								store_state='<div class="storestate s_state_color3"><b>폐점</b></div>';
							} 
							
							//메달색정해주기
							//4이상 금
							//3이상4이하 은
							//3이하 동
							var medal ="";
							if(photo_lists[i].all_avg==null||photo_lists[i].all_avg==undefined){
								medal="gold";
							}else if(photo_lists[i].all_avg>=4){//금
								medal="gold";
							}else if(photo_lists[i].all_avg<4&&photo_lists[i].all_avg>=3){//은
								medal="silver";
							}else if(photo_lists[i].all_avg<3){//동
								medal="bronze";
							}
							
							store_detail=
								'<div class="storelist" onclick="event.stopPropagation(); location.href=\'store.do?store_seq='+store_lists[i].store_seq+'\'">'+
											'<div class="photobox" style="'+
											'background: url(\'./upload_sphoto/'+photo_lists[i].store_photo_stored+'\');'+
											'background-size: 140px 105px;'+
										    'background-repeat: no-repeat;"></div>'+//사진:단일
											store_state+
											'<div class="storename">'+store_lists[i].store_name+'<span class="tooltiptext">'+store_lists[i].store_name+'</span></div>'+
											'<div class="review"><img class="star" alt="" src="./img/star_fill.png">'+photo_lists[i].all_avg+'</div>'+//평균(매장사진이랑 같이 가져오기)
											'<div class="medal"><img class="medal" alt="" src="./img/'+medal+'.png"></div>'+
											'<div class="cate_big">'+store_lists[i].category_name+'</div>'+//대표카테고리
											'<div class="cate_small">'+cate_lists[i]+'</div>'+//세부카테고리--------------따로1
											'<div class="storephone">'+store_lists[i].store_phone+'</div>'+//전화번호
											'<div class="address">'+store_lists[i].store_address+'</div>'+//주소
											'<div class="storetime">영업시간:'+
												'<div class="storetime_today"></div>'+
												'<div class="storetime_other"></div>'+
											'</div>'+//영업시간--------------따로2
											'<div class="reservebtn" onclick="event.stopPropagation(); location.href=\'user_store_reserve.do?store_seq='+store_lists[i].store_seq+'&store_name='+store_lists[i].store_name+'\'">예약</div>'+
										'</div>';
							
							rb.append(store_detail);
							
						});
						$.each(store_lists, function(i){//매장 개수
							var stime="";
							var stimeArray= new Array();
							$.each(stime_lists, function(j) {//전체 요일 개수
								if (stime_lists[j].store_seq==store_lists[i].store_seq&&stime_lists[j].store_time_break==="N") {
									var stime=
									stime_lists[j].store_time_day+' '+
									stime_lists[j].store_time_open+' ~ '+
									stime_lists[j].store_time_close
									stimeArray.push(stime);
								}else if (stime_lists[j].store_seq==store_lists[i].store_seq&&stime_lists[j].store_time_break==="Y") {
									var stime=
									stime_lists[j].store_time_day+' '+" <span style=\"color:red;\">휴점일</span>";
									stimeArray.push(stime);
								}
							});
							console.log(i+"번째 매장"+stimeArray);
							$(".storelist").eq(i).find($(".storetime_today")).append(stimeArray[today===0?7:today-1].indexOf("00:00  ~ 00:00")!=-1?"24시간 영업":stimeArray[today===0?7:today-1]);
// 							$(".storelist").eq(i).find($(".storetime_other")).append(stimeArray);
							
							$(".storetime_today").eq(i).mouseover(function() {
// 								$(".storetime_other").eq(i).removeAttr("style");
// 								$(".storetime_other").eq(i).css("visibility","visible"); 
// 								$(".storetime_today").eq(i).css("z-index","100");
							});
							$(".storetime_today").eq(i).mouseout(function() {
// 								$(".storetime_today").eq(i).css("z-index","100");
// 								$(".storetime_other").eq(i).css({"visibility":"hidden","z-index":"100"});
							});
						});
						
						for (var i = 0; i < store_lists.length; i++) {
						     var coords = new kakao.maps.LatLng(sloca_lists[i].store_latitude, sloca_lists[i].store_longitude);
						 		
						     // 마커 이미지의 이미지 주소입니다
		 					 var imageSrc = './img/icon/icon_map_'+store_lists[i].category_code+'.png'; 
								
	//	 					 // 마커 이미지의 이미지 크기 입니다
		 					 var imageSize = new kakao.maps.Size(60, 60); 
								    
	//	 					 // 마커 이미지를 생성합니다    
						     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
							
						     // 마커를 생성합니다
						     var marker = new kakao.maps.Marker({
						         map: map, // 마커를 표시할 지도
						         position: coords, // 마커를 표시할 위치
						         image : markerImage // 마커 이미지 
						     });
						     markers.push(marker);
						     marker.setMap(map);
						    
							var medal ="";
							if(photo_lists[i].all_avg>=4){//금
								medal="gold";
							}else if(photo_lists[i].all_avg<4&&photo_lists[i].all_avg>=3){//은
								medal="silver";
							}else if(photo_lists[i].all_avg<3){//동
								medal="bronze";
							}
								
						    var content = '<div class="icon_info">'+
						     					'<div class="icon_text">'+
							     					'<img class="medal_in" alt="" src="./img/'+medal+'.png">'+
						     						store_lists[i].store_name+
							     					'<span class="bigcate_in"> | '+
														store_lists[i].category_name+
													'</span>'+
						     					'</div>'+
						     					'<div class="smallcate_in">'+cate_lists[i]+'</div>'+
						     				'</div>';
						    var customOverlay = new kakao.maps.CustomOverlay({
					    	    position: coords,
					    	    content: content,
					    	    xAnchor: 0.5,
					    	    yAnchor: 2,
					    	    clickable: true
						    });
						    overlays.push(customOverlay);
							// 커스텀 오버레이를 지도에 표시합니다
							customOverlay.setMap(map);
							customOverlay.setVisible(false);
	
							// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
						    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
						    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, customOverlay));
						    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(customOverlay));
						}
					}else if (obj.list==null){
// 						if(selected_cates==="none"){
//8 						     alert("selected!!!!2:"+selected_cates);
						if(pnum==1){
					    	markers.forEach(function (marker) { marker.setMap(null); });
						    markers.length = 0 // 마커 배열 초기화
						    overlays.forEach(function (overlay) { overlay.setMap(null); });
						    overlays.length = 0 // 오버레이 배열 초기화
						}
// 						}
					    if(pnum==1){
							$(".storelist").remove();
							$("#rightbox").append("<div class='storelist' style='height:170px;text-align:center;padding-top:70px;'>----------현재 지역에서 검색되는 결과가 없습니다----------</div>");
							var position = $(".storelist").eq(0).position();
							$("#show").stop().animate({scrollTop : position.top}, 400);
						}
					}
	
				},
				error: function(request,error) {
					if(pnum==1){
						$(".storelist").remove();
						$("#rightbox").append("<div class='storelist' style='height:170px;text-align:center;padding-top:70px;'>----------현재 지역에서 검색되는 결과가 없습니다----------</div>");
					}
					var position = $(".storelist").eq(0).position();
					$("#show").stop().animate({scrollTop : position.top}, 400);
					alert("서버통신실패!!"+request.status+","+error);
				}
			});//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%카테고리검색:all끝
		}//아작스담은 function 끝
	
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, customOverlay) {
		    return function() {
		    		customOverlay.setVisible(true);
		    		var icon_name_temp=customOverlay.a.innerText;
		    		var icon_name=customOverlay.a.innerText.substring(0,icon_name_temp.indexOf(" |"));
		    		for (var i = 0; i < $(".storelist").length; i++) {
			    		if($(".storelist").eq(i).css("background-color") == "rgb(238, 238, 238)"){
			    			$(".storelist").removeAttr("style");//여기서 말고 따로 펑션 만들어서 조건엔 이미 속성값이 (배경값) 있으면 없애고하기
			    		}
					}
			    	//true인데 만약 bool이 false이면==이미하나있으면 맵에표시안함
		    		for (var i = 0; i < $(".storelist").length; i++) {
						var right_name =$(".storelist").eq(i).find(".storename").find(".tooltiptext").text();		    			
						if(right_name===icon_name){
// 							$(".storelist").eq(i).css({"background-color":"#D9E6FE","border":"1px solid #5882FA"});
// 							$(".storelist").eq(i).css({"background-color":"#BDBDBD","border":"1px solid black"});
							$(".storelist").eq(i).css({"background-color":"#eee","border":"1px solid black"});
// 							$(".storelist").eq(i).css({"color":"#fff"});
// 							$(".storelist").eq(i).find($(".s_state_color1 b")).css({"background-color":"#fff"});
// 							$(".storelist").eq(i).find($(".storetime_today")).css({"background-color":"#fff","color":"#000"});
					        var position = $(".storelist").eq(i).position();
					        $("#show").stop().animate({scrollTop : position.top}, 400);
						}
					}
		    		
		    		console.log(customOverlay.a.innerText);
		    		console.log(customOverlay);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(customOverlay) {
		    return function() {
		    		customOverlay.setVisible(false);
		    };
		}
		
		//미구현기능------오른쪽 매장에 올렸을때 커스텀오버레이도 뜨게
		$(".storelist").hover(function() {
		}, function() {
		});

		
		divToFit();
		$(window).resize(function() {
			divToFit();
	    });
		
		$(".righthider").click(function() {
			$("#rightbox").toggle( "fold", 700 );
			if($(".arrow_down").length){
				$("#show").css("height",window.innerHeight-90);
				setTimeout(function() {
					$(".arrow_down").addClass('arrow_up');
					$(".arrow_down").removeClass('arrow_down');
			    }, 350 );
			}else if($(".arrow_up").length){
				setTimeout(function() {
				$(".arrow_up").addClass('arrow_down');
				$(".arrow_up").removeClass('arrow_up');
					$("#show").css("height","36px");
			    }, 700 );
			}
		});
		
		$(".mapbarbox_btn").click(function() {

			if($(".arrow_down2").length){
				$("#mapcategory").animate({
					height:225
				},500);
				$("#mapbarbox").animate({
					 height:330
				},500);
				setTimeout(function() {
					$(".arrow_down2").addClass('arrow_up2');
					$(".arrow_down2").removeClass('arrow_down2');
			    }, 350 );
			}else if($(".arrow_up2").length){
				$("#mapcategory").animate({
					height:0
				},500);
				$("#mapbarbox").animate({
					 height:100
				},500);
				setTimeout(function() {
					$(".arrow_up2").addClass('arrow_down2');
					$(".arrow_up2").removeClass('arrow_up2');
			    }, 350 );
			}
		});
		
		$(".categories input[type='checkbox']").change(function() {
// 			alert($(".categories input[type='checkbox'] + label").length);
			var count =0;
			for (var i = 0; i < $(".categories input[type='checkbox'] + label").length; i++) {
				if($(".categories input[type='checkbox']").eq(i).is(":checked")==true){
					count++;
				}
			}
			if(count>0){
				$(".categories input[type='checkbox'] + label").addClass("to_grey");
			}else if(count==0){
				$(".categories input[type='checkbox'] + label").removeClass("to_grey");
			}
		});
		
		
	});
	
	//현재위치 권한받아오기 function
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	function myLoca(){
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
		        
		        // 마커와 인포윈도우를 표시합니다
		        myLocaMarker(locPosition, message);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		        message = 'geolocation을 사용할수 없어요..'
		        
		    myLocaMarker(locPosition, message);
		}
// 		markerv==null;
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function myLocaMarker(locPosition, message) {
// 			if(pnum==1){
// 			    markerv.forEach(function (marker) { marker.setMap(null); });
// 			    markerv.length = 0 // 마커 배열 초기화
// 			}
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = './img/icon/pin.png'; 
					
			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(70, 70); 
				    
			// 마커 이미지를 생성합니다    
		    var markerImagev = new kakao.maps.MarkerImage(imageSrc, imageSize); 

		    // 마커를 생성합니다
		    var markerv = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition,
		        image : markerImagev,
		    }); 
		    
// 		    var iwContent = message, // 인포윈도우에 표시할 내용
// 		        iwRemoveable = true;

// 		    // 인포윈도우를 생성합니다
// 		    var infowindow = new kakao.maps.InfoWindow({
// 		        content : iwContent,
// 		        removable : iwRemoveable
// 		    });
		    
// 		    // 인포윈도우를 마커위에 표시합니다 
// 		    infowindow.open(map, marker);
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.panTo(locPosition);      
		 
// 		    markers.forEach(function (marker) { marker.setMap(null); });
// 		    markers.length = 0 // 마커 배열 초기화
// 		    overlays.forEach(function (overlay) { overlay.setMap(null); });
// 		    overlays.length = 0 // 오버레이 배열 초기화
		} 
	}
</script>
</head>
<body>
<div id="container">

<!-- 	<div id="mapbox" style="width:1500px;height:830px;"> 아직미정 -->
	<div id="mapbox">
		<img type="button" class="toMyLoca" src="./img/icon/mylocation2.png" title="내 현재위치로 이동" onclick="myLoca()"/>
<!-- 		<div class="toMyLoca"><img class="toMyLoca" src="./img/icon/mylocation2.png"/></div> -->
		<div id="mapbarbox">
		
<!-- 			<form id="search" action="map_keyword.do" onsubmit="return search_inMap()"> -->
			<form id="search" action="map_keyword.do">
				<input type="text" id="searchbar" class="form-control pull-left" name="keyword" placeholder="지역명, 지하철역, 매장명 검색">
				<button id="searchbtn" class="btn"><img id="magnifyglass" src="./img/magnifyglass.png"></button>
			</form>
			<div id="mapcategory">
				<div class="selectedbox">
					<div class="subinfo">(1) 지역, 주소, 지하철역 혹은 원하는 매장으로 검색해서 이동해요!</div>
					<div class="subinfo">(2) 이동한 지역에서 원하는 카테고리만 선택해서 보세요!</div>
				</div>
				<div class="categorybox">
					<div class="categories"><input type="checkbox" id="cate_all" value="a,b,c,d,e,f,g,h,i"/><label for="cate_all">all</label><div class="cate_text">전체</div></div>
<!-- 					<div class="categories"><input type="checkbox" id="cate_all" value=""/><label for="cate_all">all</label><div class="cate_text">전체</div></div> -->
					<div class="categories"><input type="checkbox" id="cate_a" value="a"/><label for="cate_a"></label><div class="cate_text">동물병원</div></div>
					<div class="categories"><input type="checkbox" id="cate_b" value="b"/><label for="cate_b"></label><div class="cate_text">카페/식당</div></div>
					<div class="categories"><input type="checkbox" id="cate_c" value="c"/><label for="cate_c"></label><div class="cate_text">식품/용품</div></div>
					<div class="categories"><input type="checkbox" id="cate_d" value="d"/><label for="cate_d"></label><div class="cate_text">숙박</div></div>
				</div>
				<div class="categorybox">
					<div class="categories"><input type="checkbox" id="cate_e" value="e"/><label for="cate_e"></label><div class="cate_text">돌봄서비스</div></div>
					<div class="categories"><input type="checkbox" id="cate_f" value="f"/><label for="cate_f"></label><div class="cate_text">미용/목욕</div></div>
					<div class="categories"><input type="checkbox" id="cate_g" value="g"/><label for="cate_g"></label><div class="cate_text">체험</div></div>
					<div class="categories"><input type="checkbox" id="cate_h" value="h"/><label for="cate_h"></label><div class="cate_text">분양/교배</div></div>
					<div class="categories"><input type="checkbox" id="cate_i" value="i"/><label for="cate_i"></label><div class="cate_text">장례</div></div>
				</div>
			</div>
			<div class="mapbarbox_btn">
				<div class="arrow_up2"></div>
			</div>
		</div>
	</div>

<!-- 	<div id="mapbox"> -->
<!-- 	지도용 스크립트 -->
<!-- 	<div id="map" style="width:2000px;height:800px;"></div> -->
	<script>
		var container = document.getElementById('mapbox'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
// 			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			center: new kakao.maps.LatLng(37.525026023695375, 126.8888353907293), //지도의 중심좌표.
		    minLevel: 1,
		    maxLevel: 7,
			level: 4 //지도의 레벨(확대, 축소 정도)
		};
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		
		kakao.maps.event.addListener(map, 'idle',  function() {
			map.relayout();
 		});
		
		
		//좌표뜨기 테스트용
// 		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
// 		    // 클릭한 위도, 경도 정보를 가져옵니다 
// 		    var latlng = mouseEvent.latLng;
		    
// 		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
// 		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
// 		    var resultDiv = document.getElementById('result'); 
// 		    alert(message);
// 		});
		
	</script>

	<div id="show">
		<div class="righthider">
			<div class="arrow_up"></div>
		</div>
		<div id="rightbox">
		</div>
	</div>
</div>
</body>
</html>
