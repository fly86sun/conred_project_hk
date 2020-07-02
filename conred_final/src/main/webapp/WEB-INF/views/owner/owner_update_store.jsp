<%@page import="com.hk.conred.dtos.SDto"%>
<jsp:include page="../all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 시간지정용 데이트피커 소스 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc283bd41dff040b5403d29f3172b43a&libraries=services,clusterer,drawing"></script>
<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
	.t1,.t2{transition:all .5s;}
	.greenbtn:hover{background-color: #04B404;color:white} 
	.redbtn:hover{background-color: #FE2E2E;color:white} 
	.clrboth{clear: both;}
	.flright{float: right;}
	.flleft{float: left;}
	.btn{background-color: grey;margin-left:10px;color:white;}
	.btn2{margin-left:0px;}
	
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#regist{font-weight: bold; font-size: 20px;margin-bottom: 40px;}
	 
	#tle{margin:0 auto;padding-top:40px;width: 800px;}
	.inputbox{margin-top:0px;margin-bottom:-5px; padding:26px 10px 26px;height:auto;width:800px; display: inline-block;border: 0px solid lightgrey;border-bottom-width: 1px;}
	.inputbox:hover{background-color: #f3f3f3;}
	.lastbox{border: 0px solid lightgrey;}
	.inputtitle{float:left;height:35px;line-height: 30px;padding-right:20px;width:500px;font-size:22px;}
	input{margin-top:2px;}
	textarea{margin-top:2px;resize: none;}
	select {position:relative;top:1px;height:26px;}
	.form-control{width:180px;}
	.inputs{width:780px;float: left;height:auto;}
	.width_500{width:500px;}
	
	
	textarea[name=store_time_other]{width:544px;}
	textarea[name=store_intro_simple]{width:500px;}
	textarea[name=store_intro]{width:500px;height:100px;}
 	textarea[name=store_address]{width:500px;} 
	
	.catechkboxes_big{width:150px;height:100px;float: left;}
	.catechkboxes{float: left;}
	.catechkbox{padding-bottom:10px;}
	input[name=category_code_small],input[name=category_code]{margin-left:10px;}
	
	.filebox input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
 	.filebox label { display: inline-block; padding: .5em .75em;  font-size: inherit; line-height: normal; 
 					vertical-align: middle; background-color: grey; cursor: pointer; border: 1px solid #ebebeb; 
					border-bottom-color: #e2e2e2; border-radius: .25em; margin-bottom: 0px;}
	.filebox .upload-name { display : inline-block; padding: .5em .75em; height:34px;/* label의 패딩값과 일치 */
						
						font-size: inherit; font-family: inherit; line-height: normal;
						vertical-align: middle; background-color: #f5f5f5; border: 1px solid #ebebeb;
						border-bottom-color: #e2e2e2; border-radius: .25em; -webkit-appearance: none;
						/* 네이티브 외형 감추기 */
						-moz-appearance: none; appearance: none; }
						
	#timeboxhead{line-height: 29px;}
	.timebox{display: inline-block;width:50px;text-align: center;margin-left:10px;margin-right:10px;}
	.timebox2{display: inline-block; width:140px;text-align: center;}
	.menubox{display: inline-block; width:310px;text-align: center;}
	ul{list-style: none;padding:0px;}
 	li{width:650px;} 
/* 	.hidmenu{display: none;} */
	
	.timepicker{width:140px;}
	
	#show_menu,#time_makesame,.hide_menu{margin-bottom:2.5px;}
	
	input[name=store_maxdate],input[name=store_maxman]{width:30px;background-color: #f0f0f0;border:1px solid grey}
	input[name=store_address_detail]{width:407.5px;float: left;}
	.subinfo{font-size:12px;color: grey;}
	.firstsub{margin-top:5px;}
	#bot{margin:30px 10px 30px;}
	
	/*--파일업로드관련--*/
	#preview img {width: 180px;height: 100px;overflow: hidden;}
	#preview p {text-overflow: ellipsis;overflow: hidden;}
	.preview-box {border: 0px solid grey;padding: 5px;border-radius: 2px;margin-bottom: 5px;margin-right:5px;
				display: inline-block;
    			border-radius: 5px;
					}
	.thumbnail{margin-bottom:0px;}
/* 	.del_btn{float: right;display: inline-block;} */
/* 	.f_name{float:left;display: inline-block;margin-left:0px;} */
	.f_insert{margin:0px;display: inline-block;float: left;}
	.attach_count{display: inline-block;margin:5px 10px 15px;font-size:18px;}
/* 	.attach_count::after{clear:both;} */
	/*-------------*/
	
	/*주소찾기*/
	.addrsearch{margin-top:3px;}
	#search{width:500px;padding-bottom: 10px;}
	#searchbar{width: 444px;margin-top: 0.5px;}
	#magnifyglass{width:20px;}
	#mapbox{border:1px solid grey; width:500px;height:500px;}
	.pickedaddr{float:left;text-align: left;}
	.picklat,.picklng{display: none;}
/* 	.modal-content{min-width:530.5px} */
	.modal-content{width:531px}

	.greenfont{color:#3ADF00;}
	
/* 	진행창 */
	.progressBox{width:700px; height:220px; margin: 0 auto;}
	.progress_each{
		width:150px; height:150px; background-color: #f2f2f2; border-radius: 50%; float:left;border:1px solid #fff;margin-left:20px;margin-top:40px;
		text-align: center;line-height: 150px;
		position:relative;
	}
	.progress_this{
		width:150px; height:150px; background-color: #f2f2f2; border-radius: 50%;float:left;border:1px solid #333;margin-left:20px;margin-top:40px;
		text-align: center;line-height: 150px;
		box-shadow: 4px 4px 4px #aaa;
		animation: animate-shadow 1s ease-in infinite;
	}
	.progress_ok{opacity:0.5;background-image: url("./img/check.png");background-size: 70px 70px;background-repeat: no-repeat;background-position: center;}
	@keyframes animate-shadow {
	     50% {box-shadow: 8px 8px 8px #aaa;}
	}
</style>
<script type="text/javascript">
	
	$(document).ready(function(){
		var fileTarget = $('.filebox .upload-hidden');
		fileTarget.on('change', function(){
			// 값이 변경되면
			if(window.FileReader){ // modern browser
				var filename = $(this)[0].files[0].name;
			} else { // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} // 추출한 파일명 삽입
			$(this).siblings('.upload-name').val(filename);
		});

		$("#time_makesame").on('click',function(){

			for (var i = 0; i < 5; i++) {//평일값이 월화수목금에 똑같이 들어가게
				var t1val=$("#t1").val();
				$(".t1").eq(i).val(t1val);
				var t2val=$("#t2").val();
				$(".t2").eq(i).val(t2val);
				$(".t1").eq(i).css("background-color","yellow");
				$(".t2").eq(i).css("background-color","yellow");
			}
		        setTimeout(function() {
					$(".t1").css("background-color","white");
					$(".t2").css("background-color","white");
		        }, 100 );
				
		});
		
		$("body").on("change","input:checkbox[name=store_time_break]",function(){
			if($(this).is(':checked') == true){
				$(this).attr('value', 'Y');
				$(this).parent().find("input:hidden[name=store_time_break]").attr("disabled",true);
			}
			if($(this).is(':checked') == false){
				$(this).attr('value', 'N');
				$(this).parent().find("input:hidden[name=store_time_break]").attr("disabled",false);
			}
		});
		
		$("#show_menu").click(function(){
			$("#menuboxes").append('<li>'+
			'<input class="timebox2 t1" type="text" name="menu_name" style="width:110px;"/> '+
			'<input class="menubox t1" type="text" name="menu_content"/> '+
			'<input class="timebox2 t2" type="text" name="menu_price"/> '+
			'<select class="settime" name="menu_state" style="width:70px;">'+
			'<option value="N">미사용</option><option value="T">시간제</option><option value="S">숙박제</option>'+
			'</select> '+
			'<span class="btn btn2 timebox2 hide_menu" style="height:24px; width:48px;line-height: 10px">-</span>'+
			'</li> ');
		});
		
		$("body").on("click",".hide_menu",function(){
			$(this).parent("li").remove();
		});

		//만약 메뉴등록에서 예약 셀렉트박스에 시간제, 숙박제가 있다가 없어질 경우
		//readonly 다시 주기
		$("body").on("change",".settime",function(){
			var n=0;
			var t=0;
			var s=0;
			for (var i = 0; i < $("input[name=menu_name]").length; i++) {
				if($(".settime").eq(i).val()=="S"){
					s++;
				}else if($(".settime").eq(i).val()=="T"){
					t++;
				}else if($(".settime").eq(i).val()=="N"){
					n++;
				}
			}
			if(s>0){ //'숙박제'가 0보다크면 readonly 없애기
// 				alert("숙박제가 입력가능해집니다");
				$("input[name=store_maxdate]").removeAttr("readonly");
				$("input[name=store_maxdate]").css("background-color","white");
			}
			if(t>0){ //'시간제'가 0보다크면 readonly 없애기
// 				alert("시간제가 입력가능해집니다");
				$("input[name=store_maxman]").removeAttr("readonly");
				$("input[name=store_maxman]").css("background-color","white");
			}

			if(s==0){ //'숙박제'가 0이면 안에 값 지우고readonly 처리
// 				alert("숙박제가 리드온리처리됩니다.");
				$("input[name=store_maxdate]").val("");
				$("input[name=store_maxdate]").attr("readonly","readonly");
				$("input[name=store_maxdate]").css("background-color","#f2f2f2");
			}
			if(t==0){ //'시간제'가 0이면 안에 값 지우고 readonly 처리
// 				alert("시간제가 리드온리처리됩니다.");
				$("input[name=store_maxman]").val("");
				$("input[name=store_maxman]").attr("readonly","readonly");
				$("input[name=store_maxman]").css("background-color","#f2f2f2");
			}
		}); 
// 		$('.timepicker').timepicker({
// 		    timeFormat: 'HH:mm ',
// 		    interval: 30,
// 		    minTime: '0',
// 		    maxTime: '23:50pm',
// 		    defaultTime: '9',
// 		    startTime: '00:00',
// 		    dynamic: false	,
// 		    dropdown: true,
// 		    scrollbar: true
// 		});
		
		//여기에 기존값 뿌려주는거 만들기 (defalutTime부분에 )
		var list_stime_open = 
			"<c:forEach var='list' items='${list_stime}'>"+
				"<c:out value='${list.store_time_open}'/>"+
			"</c:forEach>";
		var lt_open=list_stime_open.split(" ");
		var c1=0;
		for (var i = 0; i < 8; i++) {//1,2,3,4,5,6,7,8
			var list_stime1= "<c:out value='${list_stime[0].store_time_open}'/>";
	 		$('.timepicker').eq(c1).timepicker({
			    timeFormat: 'HH:mm ',
			    interval: 30,
			    minTime: '0',
			    maxTime: '23:50pm',
			    defaultTime: lt_open[i],
			    startTime: '00:00',
			    dynamic: false	,
			    dropdown: true,
			    scrollbar: true
	 		});
		 	c1=c1+2;//0,2,4,6,8,10,12
	 	};
	 	
	 	var list_stime_close = 
			"<c:forEach var='list2' items='${list_stime}'>"+
				"<c:out value='${list2.store_time_close}'/>"+
			"</c:forEach>";
		var lt_close=list_stime_close.split(" ");
// 			alert(lt_close[0]);
		var c2=1;
		for (var i = 0; i < 8; i++) {//1,2,3,4,5,6,7,8
	 		$('.timepicker').eq(c2).timepicker({
			    timeFormat: 'HH:mm ',
			    interval: 30,
			    minTime: '0',
			    maxTime: '23:50pm',
			    defaultTime: lt_close[i],
			    startTime: '00:00',
			    dynamic: false,
			    dropdown: true,
			    scrollbar: true
	 		});
		 	c2=c2+2;//1,3,5,7,9,11
	 	};
		
		// <input type=file> 태그 기능 구현
		$('#attach input[type=file]').change(function() {
			addPreview($(this)); //preview form 추가하기
			$(".attach_count").text();
		});
	    $(".addrsearch").click(function(){
	        $("div.modal").modal();
	        setTimeout(function() {
	        	map.relayout();
	        }, 300 );
	    });
	    
	    var form=$("form")[0];
	    form.onsubmit=function(){ 
	    	if($(".inputbox").eq(0).find($(".form-control")).val()==""||$(".inputbox").eq(0).find($(".form-control")).val()==" "||$(".inputbox").eq(0).find($(".form-control")).val()==null){
				swal("매장이름을 입력해주세요.","", "info"); 
				document.getElementsByClassName("inputbox")[0].scrollIntoView({behavior: "smooth"});
				setTimeout(function() {
					$(".inputbox").eq(0).find($(".form-control")).focus();
				},1000);
				return false;
			}
	    	if($(".preview-box").length<5){
				swal("사진은 최소 5장을 넣어주세요.","", "info"); 
	    		setTimeout(function() {
					document.getElementsByClassName("inputbox")[3].scrollIntoView({behavior: "smooth"});
				},30);
				return false;
			}
	    	if($(".inputbox").eq(4).find($(".form-control")).val()==""||$(".inputbox").eq(4).find($(".form-control")).val()==" "||$(".inputbox").eq(4).find($(".form-control")).val()==null){
				swal("매장의 간단소개를 입력해주세요.","", "info"); 
				document.getElementsByClassName("inputbox")[4].scrollIntoView({behavior: "smooth"});
				setTimeout(function() {
					$(".inputbox").eq(4).find($(".form-control")).focus();
				},900);
				return false;
			}
			if($(".inputbox").eq(5).find($(".form-control")).val()==""||$(".inputbox").eq(5).find($(".form-control")).val()==" "||$(".inputbox").eq(5).find($(".form-control")).val()==null){
				swal("매장의 소갯글를 입력해주세요.","", "info"); 
				setTimeout(function() {
					document.getElementsByClassName("inputbox")[5].scrollIntoView({behavior: "smooth"});
				},30);
				setTimeout(function() {
					$(".inputbox").eq(5).find($(".form-control")).focus();
				},850);
// 				swal("매장의 소갯글를 입력해주세요."); 
				return false;
			}
			
			if($(".inputbox").eq(7).find($(".form-control")).val()==""||$(".inputbox").eq(7).find($(".form-control")).val()==" "||$(".inputbox").eq(7).find($(".form-control")).val()==null){
				swal("매장의 전화번호를 입력해주세요.","", "info"); 
				setTimeout(function() {
					document.getElementsByClassName("inputbox")[7].scrollIntoView({behavior: "smooth"});
				},30);
				setTimeout(function() {
					$(".inputbox").eq(7).find($(".form-control")).focus();
				},750);
				return false;
			}
			if($(".inputbox").eq(8).find($(".form-control")).val()==""||$(".inputbox").eq(8).find($(".form-control")).val()==" "||$(".inputbox").eq(8).find($(".form-control")).val()==null){
				swal("담당자의 전화번호를 입력해주세요.","", "info"); 
				document.getElementsByClassName("inputbox")[8].scrollIntoView({behavior: "smooth"});
				setTimeout(function() {
					$(".inputbox").eq(8).find($(".form-control")).focus();
				},750);
				return false;
			}
			if($("input[name=store_latitude]").val()==""||$("input[name=store_latitude]").val()==" "||$("input[name=store_latitude]").val()==null){
				swal("지도에서 주소를 찾아 선택해주세요.","", "info");  
				document.getElementsByClassName("inputbox")[9].scrollIntoView({behavior: "smooth"});
				setTimeout(function() {
					$(".inputbox").eq(9).find($(".form-control")).eq(0).focus();
				},750);
				return false;
			}
			if($("input[name=store_address_detail]").val()==""||$("input[name=store_address_detail]").val()==" "||$("input[name=store_address_detail]").val()==null){
				swal("상세주소를 적어주세요.","", "info");
				document.getElementsByClassName("inputbox")[9].scrollIntoView({behavior: "smooth"});
				setTimeout(function() {
					$(".inputbox").eq(9).find($(".form-control")).eq(1).focus();
				},750);
				return false;
			}
			if($(".lastbox").find($(".form-control")).eq(0).val()=="none"){
				swal("은행정보를 입력해주세요.","", "info"); 
				document.getElementsByClassName("inputbox")[11].scrollIntoView({behavior: "smooth"});
				setTimeout(function() {
					$(".inputbox").eq(11).find($(".form-control")).eq(0).focus();
				},750);
				return false;
			}
			if($("input[name=store_account]").val()==""||$("input[name=store_account]").val()==" "||$("input[name=store_account]").val()==null){
				swal("계좌번호를 입력해주세요.","", "info"); 
				document.getElementsByClassName("inputbox")[11].scrollIntoView({behavior: "smooth"});
				setTimeout(function() {
					$(".inputbox").eq(11).find($(".form-control")).eq(1).focus();
				},750);
				return false;
			}
		}
	    
	});
	
	/////////-------------------파일업로드관련
	
    //임의의 file object영역
    var files = {};
    var previewIndex = 0;
    $(document).ready(function(){//기존사진들에게 미리 imgNum을 넣어주기위하 처리
	    previewIndex =$(".preview-box").length;
    });
    
	// image preview 기능 구현
    // input = file object[]
    function addPreview(input) {
        if (input[0].files) {
            //파일 선택이 여러개였을 시의 대응
            for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                var file = input[0].files[fileIndex];
                if(validation(file.name)) continue;
                setPreviewForm(file);
            }
        } else
            alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
    }
    
    function setPreviewForm(file, img){
        var reader = new FileReader();
        
        //div id="preview" 내에 동적코드추가.
        //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
        reader.onload = function(img) {
            var imgNum = previewIndex++;
            $("#preview").append(
                    "<div class=\"preview-box\" value=\"" + imgNum +"\">" +
                    "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>" +
                    "<p class=\"f_name\">" + file.name + "</p>" +
                    "<div class=\"f_name\"><input class=\"form-control\" type=\"text\" name=\"store_photo_title\" placeholder=\"사진제목/이름\"></div>" +
                    "<a class=\"del_btn\" href=\"#a\" value=\"" + imgNum + "\" onclick=\"deletePreview(this)\">" +
                    "삭제" + "</a>"
                    + "</div>"
            );
            files[imgNum] = file;   
            $(".attach_count").text($(".preview-box").length+"/30");
        };
        
        reader.readAsDataURL(file);
    }

    //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
    //(와 동시에 해당 삭제된 사진의 seq를 배열안에 저장)
    var del_list = new Array();
    function deletePreview(obj) {
    	if(obj.attributes['value_seq']){
    		
//     		alert(obj.attributes['value_seq'].value);
//     		alert("지우는 사진 seq : "+obj.attributes['value_seq'].value);
    		$(".del_list").append('<input type="hidden" name="del" value="'+obj.attributes['value_seq'].value+'">')
    	}
        var imgNum = obj.attributes['value'].value;
        delete files[imgNum];
        $(".attach_count").text($(".preview-box").length-1+"/30");
        $("#preview .preview-box[value=" + imgNum + "]").remove();
//         resizeHeight();
    }

    //client-side validation
    //always server-side validation required
    function validation(fileName) {
        fileName = fileName + "";
        var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
        var fileNameExtension = fileName.toLowerCase().substring(
                fileNameExtensionIndex, fileName.length);
        if (!((fileNameExtension === 'jpg')
                || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
            alert('jpg, gif, png 확장자만 업로드 가능합니다.');
            return true;
        } else {
            return false;
        }
    }
    
    /////////-------------------
</script>
</head>
<%
	SDto sdto=(SDto)request.getAttribute("sdto");
// 	sdto.getStore_seq();
	SDto asd=(SDto)session.getAttribute("asdf");
%>
<body>
<div id="container">
	<div class="progressBox">
		<div class="progress_each progress_ok">사업자등록번호 인증</div>
		<div class="progress_each progress_this">매장정보 입력</div>
		<div class="progress_each">메뉴정보 입력</div>
		<div class="progress_each">신청완료</div>
	</div>
<!-- <div class="modal fade" id="layerpop" > -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       header -->
<!--       <div class="modal-header"> -->
<!--         닫기(x) 버튼 -->
<!--         <button type="button" class="close" data-dismiss="modal">×</button> -->
<!--         header title -->
<!--         <h4 class="modal-title">Header</h4> -->
<!--       </div> -->
<!--       body -->
<!--       <div class="modal-body"> -->
<!--             flkqnwkrtj -->
<!--       </div> -->
<!--       Footer -->
<!--       <div class="modal-footer"> -->
<!--         Footer -->
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
<!--       body -->
      <div class="modal-body">
       	<div id="search" action="">
		  <input onkeypress="if( event.keyCode==13 ){goSearch();}" type="text" id="searchbar" class="form-control pull-left" placeholder="ex) 영등포구 양산로 53, 양평동 3가 15-1">
		  <button type="submit" id="searchbtn" class="btn"><img id="magnifyglass" src="./img/magnifyglass.png"></button>
		</div>
		<div class="subinfo">*도로명주소 혹은 번지수로 검색</div> 
		<div class="subinfo">*검색 후 정확한 위치(주소)를 지도상에서 클릭해주세요</div> 
		<div class="subinfo">*스크롤시 확대/축소 됩니다</div> 
		<div id="mapbox">
		</div>
			<script>
			var search_val ="";
			
			function goSearch() {
				$("#searchbtn").click();
			}
			$(function() {
			    $(".setaddr").click(function name() {
// 					alert($("textarea[name=store_address]").val());
// 					alert($(".realaddr").text());
			    	$("textarea[name=store_address]").val($(".realaddr").text());
			    	$("input[name=store_latitude]").val($(".picklat").text());
			    	$("input[name=store_longitude]").val($(".picklng").text());
				});
				
				$("#searchbtn").click(function() {
					
					search_val=$("#searchbar").val();
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
						
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(search_val, function(result, status) {
					     if (status === kakao.maps.services.Status.OK) {

					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					        
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.panTo(coords);
//	 				        map.setCenter(coords);

					    }else{  
					    	 var coords = new kakao.maps.LatLng(37.526944462562646, 126.88344188869179);
					    	 map.panTo(coords);    
					    }
					    
					});    
					
				});
			});
			var container = document.getElementById('mapbox'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
	// 			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				center: new kakao.maps.LatLng(37.525026023695375, 126.8888353907293), //지도의 중심좌표.
				level: 4 //지도의 레벨(확대, 축소 정도)
			};
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			kakao.maps.event.addListener(map, 'idle',  function() {
				map.relayout();
			});	
			
			
			// 주소-좌표 변환 객체를 생성합니다
		 	var geocoder = new kakao.maps.services.Geocoder();
			
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
			function searchDetailAddrFromCoords(coords, callback) {
		    	geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}
			 
			var marker1 = new kakao.maps.Marker();
		    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		        searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		            if (status === kakao.maps.services.Status.OK) {
		                var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		                detailAddr += '<div>지번 주소 : <span class="realaddr">' + result[0].address.address_name + '</span></div>';
		                var latlng = mouseEvent.latLng;
		                
		                var content = '<div class="bAddr">' + 
		                                detailAddr + 
		                            '</div>';
		                var lat = latlng.getLat();
		                var lng = latlng.getLng();
		                	
		                // 마커를 클릭한 위치에 표시합니다 
		                marker1.setPosition(mouseEvent.latLng);
		                marker1.setMap(map);	
		
		                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		                $(".pickedaddr").html(content);
		                $(".picklat").html(lat);
		                $(".picklng").html(lng);
// 		                document.getElementsByClassName("modal-footer")[0].value=content;
// 		                infowindow.setContent(content);
// 		                infowindow.open(map, marker);
		            }   
		        });
		    });
			
			</script>
      </div>
<!--       Footer -->
      <div class="modal-footer">
      	<div class="pickedaddr"></div>
      	<div class="picklat" title="위도"></div>
      	<div class="picklng" title="경도"></div>
        <button type="button" class="btn setaddr" data-dismiss="modal">등록</button>
        <button type="button" class="btn" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
	<form action="owner_update_store.do" method="post" enctype="multipart/form-data">
		<div id="tle">
			<div id="regist" class="testmod">
				매장 정보 입력
			</div> 
			<div>
				<div class="inputbox">
					<div class="inputtitle">매장명</div> 
					<div class="inputs"><input class="form-control" type="text" name="store_name" value="${sdto.store_name}" placeholder="예)양평 동물병원" /></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">대표명</div>
					<div class="inputs"><input class="form-control" type="text" value="${sdto.store_owner_name}" readonly/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">홈페이지 링크</div>
					<div class="inputs">
						<input class="width_500 form-control" type="text" name="store_path" value="${sdto.store_path}" placeholder="http://www.naver.com"/>
						<div class="subinfo firstsub">*자사 홈페이지 링크를 입력할 수 있어요.(선택사항)</div>
						<div class="subinfo">*http://까지 정확히 입력해주세요</div>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">사진업로드</div>
					<div class="inputs">
					<!-- 파일업로드 관련 -->
					    <div class="wrapper">
					        <div class="body">
					            <!-- 첨부 버튼 -->
					            <div id="attach">
					                <label class="btn f_insert" for="uploadInputBox">사진 첨부하기</label>
					                <input id="uploadInputBox" style="display: none" type="file" name="photos" multiple="multiple" />
					            </div>
					            <div class="attach_count">
					            	0/30
					            </div>
					            <!-- 미리보기 영역 -->
					            <div id="preview" class="content">
<!-- 					            	<input class="del_list" type="hidden" name="del"/> -->
					            	<div class="del_list" style="display:none;"></div>
						            <c:choose>
						            	<c:when test="${not empty list_sphoto}">
						            		<c:forEach var="photos" items="${list_sphoto}" varStatus="status">
					            		        <div class="preview-box" value="${status.index}">
								                    <img class="thumbnail" src="./upload_sphoto/${photos.store_photo_stored}"/>
								                    <p class="f_name">${photos.store_photo_origin}</p>
								                    <div class="f_name"><input class="form-control" type="text" name="store_photo_title_before" value="${photos.store_photo_title}" placeholder="사진제목/이름(선택사항)"></div>
								                    <input class="form-control" type="hidden" name="before_seq" value="${photos.store_photo_seq}">
								                    <a class="del_btn" href="#a" value="${status.index}" value_seq="${photos.store_photo_seq}" onclick="deletePreview(this)">
								                   	삭제</a>
							                    </div>
						                    </c:forEach>
						            	</c:when>
						            	<c:otherwise>
						            		
						            	</c:otherwise>
						            </c:choose>
					            </div>
					            <!-- multipart 업로드시 영역 -->
<!-- 					            <form id="uploadForm" style="display: none;" /> -->
					        </div>
					        <div class="footer">
<!-- 					            <button class="submit"><a href="#" title="등록" class="btnlink">등록</a></button> -->
					        </div>
					    </div>
					    
<!-- 					성수가만든거 -->
<!-- 						<div class="imgs_wrap">     -->
				          
<!-- 					    </div>           -->
<!-- 					    <div class="input_wrap">   -->
<!-- 					        <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a> -->
<!-- 				    		<div class="upload_message"></div> -->
<!-- 					        <input type="file" id="input_imgs" multiple/> -->
<!-- 					    </div>   -->
<!-- 					내가만든거 -->
<!-- 						<div class="filebox"> -->
<!-- 							<input class="upload-name" value="파일선택" disabled="disabled"> -->
<!-- 							<label class="btn" for="filename02">업로드</label> -->
<!-- 							<input type="file" id="filename02" class="upload-hidden"> -->
<!-- <!-- 							<input type="file" id="filename02" class="upload-hidden" required="required"> --> 
						<div class="subinfo">
							<br>
							* 매장의 사진을 최소 5개 업로드해주세요.
						</div>
						<div class="subinfo">
							* 메뉴의 사진을 올리고싶다면 해당 사진 입력란에 메뉴명을 적어주세요.
						</div>
						<div class="subinfo">
							* 가로1200px*세로400px에 가까운 사진일수록 매장사진이 이쁘게 들어갑니다.
						</div>
						</div>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">간단소개 (30자이내)</div>
					<div class="inputs">
						<textarea class="form-control" name="store_intro_simple" placeholder="매장이름과 함께 지도에 노출될 간단 소개글을 입력해주세요. (40자 이내)">${sdto.store_intro_simple}</textarea>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">매장소개 (500자이내)</div>
					<div class="inputs">
						<textarea class="form-control" name="store_intro" placeholder="매장의 상세소개글을 입력해주세요. (500자 이내)">${sdto.store_intro}</textarea>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">영업상태</div>
					<div class="inputs">
						<select class="form-control" name="store_state">
							<option value="O" <c:if test="${sdto.store_state eq 'O'}">selected</c:if>>영업중</option>
							<option value="B" <c:if test="${sdto.store_state eq 'B'}">selected</c:if>>휴업중</option>
							<option value="C" <c:if test="${sdto.store_state eq 'C'}">selected</c:if>>폐점</option>
						</select>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">매장 전화번호</div>
					<div class="inputs"><input class="form-control" type="text" name="store_phone" value="${sdto.store_phone}" placeholder="'-' 없이 입력"/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">담당자 전화번호</div>
					<div class="inputs"><input class="form-control" type="text" name="store_phone_manager" value="${sdto.store_phone_manager}" placeholder="'-' 없이 입력"/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">주소</div>
					<div class="inputs">
						<textarea name="store_address" class="flleft form-control" rows="1" placeholder="주소" readonly>${sdto.store_address}</textarea>
						<div class="inputs">
							<input class="form-control" name="store_address_detail" value="${sdto.store_address_detail}" placeholder="상세주소"/>
							<input type="hidden" name="store_latitude" value="${list_sloca[0].store_latitude}" title="위도"/>
							<input type="hidden" name="store_longitude" value="${list_sloca[0].store_longitude}" title="경도"/>
							<button type="button" class="btn flleft addrsearch">주소찾기</button>
						</div>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">영업시간</div>
					<div class="inputs">
					<div class="subinfo">*<span class="greenfont">24시간</span>영업의 경우에는 <span class="greenfont">24시간</span>영업하는 요일의 영업시간을 00:00시~ 00:00시 로 맞춰주세요!</div>
					<div class="subinfo">*평일맞추기를 누르시면 월요일부터 금요일까지 시간이 통일됩니다!</div>
							<br>
							<ul>
								<li id="timeboxhead">
									<span class="timebox" style="margin:0px">휴점일</span>
									<span class="timebox mar_right1">요일</span>
									<span class="timebox2">오픈시간</span>
									<span class="timebox2">&nbsp;&nbsp;마감시간</span>
								</li> 
							</ul>
							<ul>
								<li>
									<input class="timebox" type="checkbox" name="store_time_break" <c:if test="${list_stime[0].store_time_break eq 'Y'}">checked value="Y"</c:if>/>
									<input type="hidden" name="store_time_break" value="N" <c:if test="${list_stime[0].store_time_break eq 'Y'}">disabled="disabled"</c:if>/>
									<span class="timebox weekbox mar_right1">월요일</span>
									<input type="hidden" name="store_time_day" value="월요일">
									<input id="t1" class="timebox2 ronly timepicker form-control" name="store_time_open"/> - <input id="t2" class="timebox2 ronly timepicker form-control" name="store_time_close"/>
									<span id="time_makesame" class="btn timebox2" style="height:24px; width:100px;line-height: 10px">
										평일 맞추기
									</span>
									<span class="subinfo">*월요일기준</span>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break" <c:if test="${list_stime[1].store_time_break eq 'Y'}">checked value="Y"</c:if>/>
									<input type="hidden" name="store_time_break" value="N" <c:if test="${list_stime[1].store_time_break eq 'Y'}">disabled="disabled"</c:if>/>
									<span class="timebox">화요일</span>
									<input type="hidden" name="store_time_day" value="화요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_open" value="5"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break" <c:if test="${list_stime[2].store_time_break eq 'Y'}">checked value="Y"</c:if>/>
									<input type="hidden" name="store_time_break" value="N" <c:if test="${list_stime[2].store_time_break eq 'Y'}">disabled="disabled"</c:if>/>
									<span class="timebox">수요일</span>
									<input type="hidden" name="store_time_day" value="수요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_open"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox " type="checkbox" name="store_time_break" <c:if test="${list_stime[3].store_time_break eq 'Y'}">checked value="Y"</c:if>/>
									<input type="hidden" name="store_time_break" value="N" <c:if test="${list_stime[3].store_time_break eq 'Y'}">disabled="disabled"</c:if>/>
									<span class="timebox">목요일</span>
									<input type="hidden" name="store_time_day" value="목요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_open"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break" <c:if test="${list_stime[4].store_time_break eq 'Y'}">checked value="Y"</c:if>/>
									<input type="hidden" name="store_time_break" value="N" <c:if test="${list_stime[4].store_time_break eq 'Y'}">disabled="disabled"</c:if>/>
									<span class="timebox">금요일</span>
									<input type="hidden" name="store_time_day" value="금요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_open"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break" <c:if test="${list_stime[5].store_time_break eq 'Y'}">checked value="Y"</c:if>/>
									<input type="hidden" name="store_time_break" value="N" <c:if test="${list_stime[5].store_time_break eq 'Y'}">disabled="disabled"</c:if>/>
									<span class="timebox">토요일</span>
									<input type="hidden" name="store_time_day" value="토요일">
									<input class="timebox2 timepicker form-control" name="store_time_open"/> - <input class="timebox2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break" <c:if test="${list_stime[6].store_time_break eq 'Y'}">checked value="Y"</c:if>/>
									<input type="hidden" name="store_time_break" value="N" <c:if test="${list_stime[6].store_time_break eq 'Y'}">disabled="disabled"</c:if>/>
									<span class="timebox">일요일</span>
									<input type="hidden" name="store_time_day" value="일요일">
									<input class="timebox2 timepicker form-control" name="store_time_open"/> - <input class="timebox2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break" <c:if test="${list_stime[7].store_time_break eq 'Y'}">checked value="Y"</c:if>/>
									<input type="hidden" name="store_time_break" value="N" <c:if test="${list_stime[7].store_time_break eq 'Y'}">disabled="disabled"</c:if>/>
									<span class="timebox">공휴일</span>
									<input type="hidden" name="store_time_day" value="공휴일">
									<input class="timebox2 timepicker form-control" name="store_time_open"/> - <input class="timebox2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<br>
									<div class="inputs"><textarea class="form-control" name="store_time_other" placeholder="영업시간 관련된 공지사항이 추가로 있으실경우 이곳에 적어주세요.">${sdto.store_time_other}</textarea></div>
								</li>
							</ul>
					</div>
				</div>
				<div class="inputbox lastbox">
					<div class="inputtitle">계좌</div>
					<div class="inputs">
						은행
						<select class="form-control" name="store_bank" >
							<option value="none">--은행선택--</option>
							<option value="신한" <c:if test="${sdto.store_bank eq '신한'}">selected</c:if>>신한</option>
							<option value="기업" <c:if test="${sdto.store_bank eq '기업'}">selected</c:if>>기업</option>
							<option value="하나" <c:if test="${sdto.store_bank eq '하나'}">selected</c:if>>하나</option>
							<option value="우리" <c:if test="${sdto.store_bank eq '우리'}">selected</c:if>>우리</option>
							<option value="농협" <c:if test="${sdto.store_bank eq '농협'}">selected</c:if>>농협</option>
							<option value="국민" <c:if test="${sdto.store_bank eq '국민'}">selected</c:if>>국민</option>
							
							<option value="수협" <c:if test="${sdto.store_bank eq '수협'}">selected</c:if>>수협</option>
							<option value="신협" <c:if test="${sdto.store_bank eq '신협'}">selected</c:if>>신협</option>
							<option value="씨티" <c:if test="${sdto.store_bank eq '씨티'}">selected</c:if>>씨티</option>
							<option value="SC" <c:if test="${sdto.store_bank eq 'SC'}">selected</c:if>>SC</option>
							<option value="새마을금고" <c:if test="${sdto.store_bank eq '새마을금고'}">selected</c:if>>새마을금고</option>
							<option value="카카오뱅크" <c:if test="${sdto.store_bank eq '카카오뱅크'}">selected</c:if>>카카오뱅크</option>
							<option value="우체국" <c:if test="${sdto.store_bank eq '우체국'}">selected</c:if>>우체국</option>
						</select>
						<br>
						계좌번호
						<input class="form-control" name="store_account" value="${sdto.store_account}" placeholder="'-' 없이 입력"/>
					</div>
					
				</div>
				<br>
				<div id="bot" class="flright" >
					<input class="btn greenbtn" value="전단계로" onclick="location.href='owner_toUpdate_certify.do'" type="button"/>
					<input class="btn redbtn" value="취소" onclick="location.href='index.do'" type="button"/>
					<input class="btn greenbtn" value="다음 단계로" type="submit"/>
				</div>
				<br>
				<br>
				<br><br>
				<br>
				<br>
				
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />