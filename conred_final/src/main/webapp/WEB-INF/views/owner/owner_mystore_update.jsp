<%@page import="com.hk.conred.dtos.SDto"%>
<jsp:include page="../all/header2.jsp" />
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

<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 시간지정용 데이트피커 소스 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc283bd41dff040b5403d29f3172b43a&libraries=services,clusterer,drawing"></script>

<style type="text/css">
	.t1,.t2{transition:all .5s;}
	.greenbtn:hover{background-color: #04B404;color:white} 
	.redbtn:hover{background-color: #FE2E2E;color:white} 
	.clrboth{clear: both;}
	.flright{float: right;}
	.flleft{float: left;}
	.btn{background-color: grey;margin-left:10px;color:white;}
	.btn2{margin-left:0px;}
	/* 
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:auto;margin: 0 auto;}
	#sticky{z-index:200;position: sticky; top:71px;display: inline-block;}
	#navi2{width:999px;clear:both;position:relative;top:0px;text-align: center;line-height: 40px;border-top: 1px solid grey;display: inline-block;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.7px;height:40px;background-color: #f2f2f2;color: #000;}
	.navis2:hover{color:#000;transition:all .3s;border-bottom:1px solid white;background-color: white;cursor:pointer;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;border-right:1px solid grey;border-left:1px solid grey;color:black;}
	 */
	#container{ border:1px solid rgba(225,225,225,1.00);border-top-width:0px; border-bottom:1px solid #fff; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
   	#sticky{z-index:200;position: sticky; top:71px;display: inline-block;}
   	#navi2{width:998px;clear:both;position:relative;top:0px;text-align: center;line-height: 50px;display: inline-block;border-bottom: 1px solid #585858;}
   	.navis2{ font-size:18px; float:left;width:200px;height:50px;color: #000;background-color: #fff;}
   	.navis2:last-child{ font-size:18px; float:left;width:198px;height:50px;color: #000;background-color: #fff;}
   	.navis2:hover{color:#000;transition:all .3s;cursor:pointer;border-bottom: 5px solid #585858;}
	.home{background-color: white;color:black;border-bottom:5px solid #585858 ;}
	
	#regist{font-weight: bold; font-size: 20px;margin-bottom: 40px;}
	 
	#tle{margin:0 auto;padding-top:40px;width: 800px;}
	.inputbox{margin-top:0px;margin-bottom:-5px; padding:26px 10px 26px;height:auto;width:800px; display: inline-block;border: 0px solid lightgrey;border-bottom-width: 1px;}
	.inputbox:hover{background-color: #f3f3f3;}
	.lastbox{border: 0px solid lightgrey;}
	.inputtitle{float:left;height:auto;line-height: 200%;padding-right:20px;width:140px;}
	input{margin-top:2px;}
	textarea{margin-top:2px;resize: none;}
	select {position:relative;top:1px;height:26px;}
	.form-control{width:180px;}
	.inputs{width:600px;float: left;height:auto;}
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
	#bot{margin:30px 10px 30px;}
	
	/*--파일업로드관련--*/
	#preview img {width: 180px;height: 100px;overflow: hidden;}
	#preview p {text-overflow: ellipsis;overflow: hidden;}
	.preview-box {border: 0px solid grey;padding: 5px;border-radius: 2px;margin-bottom: 5px;margin-right:5px;
				display: inline-block;
    			border-radius: 5px;
    			border-right-width: 1px;
    			border-bottom-width: 1px;
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
	#search_2{width:500px;padding-bottom: 10px;}
	#searchbar_2{width: 444px;margin-top: 0.5px;}
	#magnifyglass{width:20px;}
	#mapbox{border:1px solid grey; width:500px;height:500px;}
	.pickedaddr{float:left;text-align: left;}
	.picklat,.picklng{display: none;}
/* 	.modal-content{min-width:530.5px} */
	.modal-content{width:531px}

	.greenfont{color:#3ADF00;}
	
/* 	여기부턴menu,category관련 */
	.greenbtn:hover{background-color: #04B404;color:white} 
	.redbtn:hover{background-color: #FE2E2E;color:white} 
	.clrboth{clear: both;}
	.flright{float: right;}
	.flleft{float: left;}
	.btn{background-color: grey;margin-left:10px;color:white;}
	.btn2{margin-left:0px;}

	
	#regist{font-weight: bold; font-size: 20px;margin-bottom: 40px;}
	 
	#tle{margin:0 auto;padding-top:40px;width: 800px;}
	.inputbox{margin-top:0px;margin-bottom:-5px; padding:26px 10px 26px;height:auto;width:800px; display: inline-block;border: 0px solid lightgrey;border-bottom-width: 1px;}
	.inputbox:hover{background-color: #f3f3f3;}
	.lastbox{border: 0px solid lightgrey;}
	.inputtitle{float:left;height:auto;line-height: 200%;padding-right:20px;width:140px;}
	textarea{margin-top:2px;resize: none;}
	.inputs{width:600px;float: left;height:auto;}
	
	.catechkboxes_big{width:150px;height:100px;float: left;}
	.catechkboxes{float: left;}
	.catechkbox{padding-bottom:10px;}
	input[name=category_code_small],input[name=category_code]{margin-left:10px;}
	
	.menu_name{vertical-align:middle; display: inline-block;width:100px;text-align: center;}
	.menu_price{vertical-align:middle;display: inline-block; width:100px;text-align: center;}
	.menu_price2{width: 150px;}
	.menu_reserve{width: 150px;margin-top: 5px;}
	.menubox_long{vertical-align:middle;display: inline-block; width:310px;text-align: center;}
	ul{list-style: none;padding:0px;display: inline-block;}
 	li{width:610px;float:left;padding:0px;margin:0px;} 
	.hidmenu{display: none;}
	
	.show_menu{margin-bottom:2.5px;position:relative;top:0px;height:24px; width:35px;line-height: 10px}
	.hide_menu{margin-bottom:2.5px;position:relative;top:0px;height:24px; width:35px;line-height: 10px}
	
	input[name=store_maxdate],input[name=store_maxman]{width:50px;background-color: #f0f0f0;border:1px solid grey}
	.subinfo{font-size:12px;color: grey;}
	#bot{margin:30px 10px 30px;}
	
	.big_cate{text-align:center;font-size:20px;font-weight:bold; height:30px;line-height: 30px;background-color: #f2f2f2;border-radius: 30px;}
	.subinfo{font-size:12px;color: grey;}
	
	/* 
	.toSubmit_text:hover #reserve_text{ transition:all .3s;line-height: 60px;}
	.toSubmit_text:hover{border-top-right-radius:10px;box-sizing:border-box;border:1px solid black;height:80px;}
	.toSubmit:hover{background-color: white;color:black;cursor: pointer;height:80px; transition:all .1s;}
	.toSubmit_text_first:hover{border-top-left-radius:10px;box-sizing:border-box;border:1px solid black;height:80px;}
 */	
	.toSubmit{text-align: center;z-index:100;position: sticky; bottom:0px;width:998px;height:60px;background-color: #f2f2f2;color: #000;border-radius: 10px 10px 0px 0px;border-bottom: 0px;line-height: 60px;}
	.toSubmit_text_box{margin:0 auto;display: inline-block;width:1000px;}
	
	.toSubmit_text{float:left ;width:450px;text-align: center;line-height: 60px;font-size:20px;}
	.toSubmit_text_first{float:left ;width:450px;text-align: center;line-height: 60px;font-size:20px;}
	.toSubmit_text:hover{height:60px;border-bottom:4px solid #585858;animation-play-state:paused;background-color:#f2f2f2;box-shadow: 0px 1px 4px grey;background-color: #fff;cursor: pointer; transition:all .1s;border-radius: 10px;}
	.toSubmit_text_first:hover{height:60px;border-bottom:4px solid #585858;animation-play-state:paused;background-color:#f2f2f2;box-shadow: 0px 1px 4px grey;background-color: #fff;cursor: pointer; transition:all .1s;border-radius: 10px;}
 	.toSubmit{animation: animate-updown 1s ease-out infinite;box-shadow: 0px 2px 4px grey;position: sticky; bottom:20px;width:900px;height:60px;background-color: #fff;color: #000;margin:0 auto;border-radius: 10px;line-height: 60px;margin-bottom: 70px;}
   	.toSubmit:hover{animation-play-state:paused;background-color:#f2f2f2;box-shadow: 0px 1px 4px grey;width:900px;background-color: #fff;cursor: pointer; transition:all .1s;}
  	#reserve_btn:hover #reserve_text{ transition:all .3s;color: #585858;}
  	#reserve_text{width:300px;margin:0 auto;text-align: center;line-height: 60px;font-size:20px;}
	@keyframes animate-shadow {
		50% {box-shadow: 0px 5px 5px grey;}
	}
	@keyframes animate-updown {
		50% {bottom:25px;}
		100% {bottom:20px;}
 	}
</style>
<script type="text/javascript">
	//store_info관련
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
		
		$("body").on("click",".deladd",function(){
			var del_menu= $(this).parent("li").find($("input[name=menu_seq_li]")).val();
			$("#del_menus").append('<input type=\"hidden\" name=\"del_menu\" value='+del_menu+'>');
			for (var i = 0; i < $("input[name=menu_seq]").length; i++) {
				if($("input[name=menu_seq]").eq(i).val()==del_menu){
					$("input[name=menu_seq]").eq(i).remove();
				}
			}
// 			$("#menu_seqs").find($("input[name=menu_seq]").val("")).remove();
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
			
// 			alert("d"+list_stime_open);
// 			alert(lt_open[i]);
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
		
	    //기존에있던거 넣어주기(값만, 어차피파일은 못넣음)
	    	 	
	    
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
                    "<div class=\"f_name\"><input class=\"form-control\" type=\"text\" name=\"store_photo_title\" placeholder=\"사진제목/이름\" required></div>" +
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
    		alert("d?");
    		
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
 	
	//카테고리, 메뉴관련
	$(document).ready(function(){
		//대표카테고리 하나만 골라지게
		$("body").on("click","input:checkbox[name=category_code]", function() {
			
			if($(this).prop("checked")){
				$("input:checkbox[name=category_code]").prop("checked",false);
				$(this).prop("checked",true);
			}
		});		
		//기존카테고리 체크박스에서 카테고리당 중복메뉴1개씩 없애버리기
		//각 .menuboxes안의 li.length가 5개 이상(와 같거나 많으면)이면
		//li.eq(4번째)를 remove
// 		alert($(".menuboxes").length);
		for (var i = 0; i < $(".menuboxes").length; i++) {
			if($(".menuboxes").eq(i).find("li").length>3){
// 				alert("4개넘음!!");
				$(".menuboxes").eq(i).find("li").eq(3).remove();
			}
		}
		//예외경우: 메뉴가 1개밖에 없는 매장의 경우 4개가 넘지 않고 딱 4개이다.
		//메뉴2개있으면 총 5개라서 
		//메뉴2개이상짜리
		//li(1)
		//li(2)
		//li(3)메뉴1
		//li(4)메뉴1
		//li(5)메뉴2
		//li(6)메뉴3
		//이렇게되어있어서 li(4)번째를 지워주면되는데
		//1개짜리일경우 
		//li(1)
		//li(2)
		//li(3)메뉴1
		//li(4)메뉴1
		//이렇게 되어있어서 5개가 안넘어서 실행안됨
		//만약 4개때부터 지워주면
		//ㅇㅏ 되는구 ㄴ ㅏ
		
		
		
		
		
		//기존 카테고리 체크박스에 뿌려주기
		//1.파라미터로 받은 clist 가져오기
		//2.맞는곳에 넣어주기(for문으로)

		var list1 = new Array();
		<c:forEach items="${list_clist}" var="item_c">
			list1.push("${item_c.category_code_small}");
		</c:forEach>
		
		var list_menu = new Array();
// 		var list_menu = new Object();
		<c:forEach items="${list_menu}" var="item_m">
			list_menu.push("${item_m.menu_name}");
			list_menu.push("${item_m.menu_content}");
			list_menu.push("${item_m.menu_price}");
			list_menu.push("${item_m.menu_state}");
			list_menu.push("${item_m.category_name}");
		</c:forEach>
		
		 
		var chkbox_c=$("input:checkbox[name=category_code_small]");
// 	 	alert(list1.length);
// 	 	alert(chkbox_c.length);
		
		for (var i = 0; i < list1.length; i++) {
// 		    alert(list1[i]);
		    for (var j = 0; j < chkbox_c.length; j++) {
		    	if(chkbox_c.eq(j).val()===list1[i]){
		    		chkbox_c.eq(j).attr("checked",true);
		    		var smallcate =chkbox_c.eq(j).val();//체크한 박스의 소분류
		    		var bigcate=["a","b","c","d","e","f","g","h","i"];
		    		var bigcatetext;//체크한 박스와 일치하는 대분류의 이름
		    		var cateval; 
		    		for(var k in bigcate){
		    			if(smallcate.indexOf(bigcate[k])!=-1){
		    				cateval=bigcate[k];
		    			}
		    		}
		    		switch(cateval){
		    			case "a": bigcatetext = "동물병원";
		    				break;
		    			case "b": bigcatetext = "카페/식당";
		    				break;
		    			case "c": bigcatetext = "식품/용품";
		    				break;
		    			case "d": bigcatetext = "숙박";
		    				break;
		    			case "e": bigcatetext = "돌봄서비스";
		    				break;
		    			case "f": bigcatetext = "미용";
		    				break;
		    			case "g": bigcatetext = "체험";
		    				break;
		    			case "h": bigcatetext = "분양/교배";
		    				break;
		    			case "i": bigcatetext = "장례";
		    				break;
		    		}
					
		    		
		    	}
			}
		    
		}


// 	    for (var i = 0; i < $(".menuboxes").length; i++) {
// 		    for(i in object_menu){
// 		    	console.log(object_menu[i][0]);//명
// 		    	console.log(object_menu[i][1]);//설명
// 		    	console.log(object_menu[i][2]);//가격
// 		    	console.log(object_menu[i][3]);//예약
// 		    	console.log(object_menu[i][4]);//카테고리명
// 		    	console.log(object_menu[i][5]);//카테고리코드
				
// 		    	//뿌려진 첫번째꺼 안에 기존것들 다 뿌려주기
// 		    	$(".menuboxes").eq(j).append(
// 					'<li>'+
// 						'<div class="big_cate">'+object_menu[i][4]+' 메뉴</div>'+
// 						'<input type="hidden" name="category_code_ex" value="'+object_menu[i][5]+'">'+
// 						'<br>'+
// 					'</li>'+
// 					'<li>'+
// 						'<span class="menu_name">메뉴명</span>'+
// 						'<span class="menubox_long">설명</span>'+
// 						'<span class="menu_price" style="width: 145px;">가격 / 예약</span>'+
// 						'<span class="menu_name"></span>'+
// 					'</li> '+
// 					'<li>'+
// 						'<input type="hidden" name="category_code_2" value="'+object_menu[i][5]+'">'+
// 						'<input class="menu_name form-control" type="text" name="menu_name" value="'+"dd"+'" placeholder="메뉴명"/> '+
// 						'<textarea rows="3" class="menubox_long form-control" type="text" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~"></textarea> '+
// 						'<div class="menu_price">'+
// 							'<div class="menu_price2">'+
// 							'가격'+
// 							' <input class="menu_price form-control" type="text" name="menu_price" placeholder="10000"/>'+
// 							'</div>'+
// 							'<div class="menu_reserve">'+
// 							'예약'+
// 							' <select class="settime form-control menu_price" name="menu_state">'+
// 								'<option value="N">미사용</option>'+
// 								'<option value="T">시간제</option>'+
// 								'<option value="S">숙박제</option>'+
// 							'</select>'+
// 							'</div>'+
// 						'</div>'+
// 						'<span class="show_menu flright btn btn2 menu_price btn" >'+
// 							'+'+
// 						'</span>'+
// 					'</li> ');
// 		    }
// 	    }
		//기존에 있던 박스들에 값 넣어주기
		
		//체크했을 때 : 같은값 없으면 추가, 같은값 있으면 추가안함
		//풀었을 때 : 같은값이 하나라도 없으면 그대로, 같은값이 하나라도 있어도 그대로
		//		새 방안 : 체크박스의 갯수를 세어야한다. 
		// 			추가하기:같은라인 div안에 체크된 박스가 하나라도 있다면 추가하고, 체크된 박스가 하나도 없으면 없애기
		// 			없애기:같은라인 div안에 체크된 박스가 하나라도 있다면 안없애고, 체크된 박스가 하나도 없으면 없애기
		$("body").on("click","input:checkbox[name=category_code_small]", function() {
			//체크한 박스와 일치하는 대분류를 찾아서 대분류의 이름을 변수에 저장해주는 실행문들 ---------------------------------------------
			cate_menu(this);
		});
		
		function cate_menu(scate){
			var smallcate =$(scate).val();//체크한 박스의 소분류
			var bigcate=["a","b","c","d","e","f","g","h","i"];
			var bigcatetext;//체크한 박스와 일치하는 대분류의 이름
			var cateval; 
			for(var i in bigcate){
				if(smallcate.indexOf(bigcate[i])!=-1){
					cateval=bigcate[i];
				}
			}
			switch(cateval){
				case "a": bigcatetext = "동물병원";
					break;
				case "b": bigcatetext = "카페/식당";
					break;
				case "c": bigcatetext = "식품/용품";
					break;
				case "d": bigcatetext = "숙박";
					break;
				case "e": bigcatetext = "돌봄서비스";
					break;
				case "f": bigcatetext = "미용";
					break;
				case "g": bigcatetext = "체험";
					break;
				case "h": bigcatetext = "분양/교배";
					break;
				case "i": bigcatetext = "장례";
					break;
			}
			//------------------------------------------------------------------------------------------
			
			//카테고리 체크여부에 따른 메뉴박스 표시/미표시
			var scate_all=$(scate).parent().find("input:checkbox[name=category_code_small]");
			var scateval=0;
// 			alert("같은줄 카테고리 갯수:"+scate_all.length);
			for (var i = 0; i < scate_all.length; i++) {//체크된 박스와 같은라인의 체크박스들을 둘러봄
				if(scate_all.eq(i).is(":checked")==true){
					scateval+=1; //체크된게 하나도 없으면 0, 하나라도 있으면 0보다 큼
				}
			}
// 			alert("체크된 갯수:"+scateval);//지금 체크된 갯수가 늘어나질 않는다.
			if(scateval==0){//체크된 박스가 하나도 없으면 (없애기)
// 				alert("체크된게 1개도 없어요");
				for (var i = 0; i < $(".big_cate").length; i++) {//현재 대분류의 갯수만큼 돌면서 내가 체크한 카테박스와 같은 이름의 대분류를 지워주기
					if($(".big_cate").eq(i).text().indexOf(bigcatetext)!=-1){//대분류중에 카테박스에 해당하는 대분류가 있으면
																			//다른말로는 :이번 턴의 대분류가 내가 체크한 박스의 대분류와 같으면
						var bc =$(".big_cate").eq(i);
						var del_menu= $(".big_cate").eq(i).parent().parent("ul").find($("input[name=menu_seq_li]")).val();
						
						$("#del_menus").append('<input type=\"hidden\" name=\"del_menu\" value='+del_menu+'>');
						for (var i = 0; i < $("input[name=menu_seq]").length; i++) {
							if($("input[name=menu_seq]").eq(i).val()==del_menu){
								$("input[name=menu_seq]").eq(i).remove();
							}
						}
// 						alert(bc.text());
						bc.parent().parent($("menuboxes")).remove();
// 						$(".big_cate").eq(i).parent().parent("ul").remove();
				
					}
				}
			}
			if(scateval==1){//체크된 박스가 하나 있으면 추가하기
// 				alert("1개가 체크되었습니다.");
				//지금 누른 체크박스가 체크되어있을 경우에만 해당: 체크를 풀때는 적용되지 않음
// 				if($(scate).is(":checked")==true){
// 				alert($(scate).prop("checked"));
				if($(scate).prop("checked")==true){
// 					alert("체크를 넣었습니다: 조건에 충족했으니 추가합니다.");
					$("#menubigbox").append(
							'<ul class="menuboxes">'+
								'<li>'+
								'<div class="big_cate">'+bigcatetext+' 메뉴</div>'+
								'<input type="hidden" name="category_code_ex" value="'+cateval.toUpperCase()+'">'+
								'<br>'+
							'</li>'+
							'<li>'+
								'<span class="menu_name">메뉴명</span>'+
								'<span class="menubox_long">설명</span>'+
								'<span class="menu_price" style="width: 145px;">가격 / 예약</span>'+
								'<span class="menu_name"></span>'+
							'</li> '+
							'<li>'+
								'<input type="hidden" name="category_code_3" value="'+cateval.toUpperCase()+'">'+
								'<input class="menu_name form-control" type="text" name="name_2" placeholder="메뉴명"/> '+
								'<textarea rows="3" class="menubox_long form-control" type="text" name="content_2" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~"></textarea> '+
								'<div class="menu_price">'+
									'<div class="menu_price2">'+
									'가격'+
									' <input class="menu_price form-control" type="text" name="price_2" placeholder="10000"/>'+
									'</div>'+
									'<div class="menu_reserve">'+
									'예약'+
									' <select class="settime form-control menu_price" name="state_2">'+
										'<option value="N">미사용</option>'+
										'<option value="T">시간제</option>'+
										'<option value="S">숙박제</option>'+
									'</select>'+
									'</div>'+
								'</div>'+
								'<span class="show_menu flright btn btn2 menu_price btn" >'+
									'+'+
								'</span>'+
							'</li> '+
						'</ul>');
				}
			}
			if(scateval>1){//체크된 박스가 2개 이상이면 아무기능도 안하기
// 				alert("이미 1개이상 체크되어있어요.");
			}
		};
		$("body").on("click",".show_menu", function() {
			var cateval = $(this).parent().parent().find("input[name=category_code_ex]").val();
// 			alert(cateval);
			$(this).parent().parent($(".menuboxes")).append(
			'<li>'+
				'<input type="hidden" name="category_code_3" value="'+cateval.toUpperCase()+'"/>'+
				'<input class="menu_name form-control" type="text" name="name_2" placeholder="멍멍개껌"/> '+
				'<textarea rows="3" class="menubox_long form-control" type="text" name="content_2" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~"></textarea> '+
				'<div class="menu_price">'+
					'<div class="menu_price2">'+
					'가격 '+
					'<input class="menu_price form-control" type="text" name="price_2" placeholder="10000"/>'+
					'</div>'+
					'<div class="menu_reserve">'+
					'예약 '+
					'<select class="settime form-control menu_price" name="state_2">'+
						'<option value="N">미사용</option>'+
						'<option value="T">시간제</option>'+
						'<option value="S">숙박제</option>'+
					'</select>'+
					'</div>'+
				'</div>'+
				'<span class="flright btn btn2 menu_price hide_menu">'+
					'-'+
				'</span>'+
			'</li>');
		});
		
		$("body").on("click",".hide_menu",function(){
			$(this).parent("li").remove();
		});
		
// 		$("body").on("click",".settime",function(){
// 			$('div.modal').modal();
// 		})

		//만약 메뉴등록에서 예약 셀렉트박스에 시간제, 숙박제가 있을 경우
		//readonly 풀어주기
// 		$("body").on("change",".settime",function(){
// 			if($(this).val()=="T"){
// 				alert("당일:시간제");
// 				$("input[name=store_maxman]").removeAttr("readonly");
// 			}else if($(this).val()=="S"){
// 				alert("숙박:숙박제");
// 				$("input[name=store_maxdate]").removeAttr("readonly");
// 			}
// 		});
		//만약 메뉴등록에서 예약 셀렉트박스에 시간제, 숙박제가 있다가 없어질 경우
		//readonly 다시 주기
		$("body").on("change",".settime",function(){
			settime();
		});
		//온로드시에도 실행
		settime();
		
		function settime(){
			
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
				$("input[name=store_maxdate]").val("0");
				$("input[name=store_maxdate]").attr("readonly","readonly");
				$("input[name=store_maxdate]").css("background-color","#f2f2f2");
			}
			if(t==0){ //'시간제'가 0이면 안에 값 지우고 readonly 처리
// 				alert("시간제가 리드온리처리됩니다.");
				$("input[name=store_maxman]").val("0");
				$("input[name=store_maxman]").attr("readonly","readonly");
				$("input[name=store_maxman]").css("background-color","#f2f2f2");
			}
		}
// 		alert("d");
// 		alert(form);
// 		var form=$("form")[0];
// 	    form.onsubmit=function(){ 
// 	    	alert("dfffff");
// 	    	if($(".inputbox").eq(0).find($(".form-control")).val()==""||$(".inputbox").eq(0).find($(".form-control")).val()==" "||$(".inputbox").eq(0).find($(".form-control")).val()==null){
// 				swal("매장이름을 입력해주세요.","", "info"); 
// 				document.getElementsByClassName("inputbox")[0].scrollIntoView({behavior: "smooth"});
// 				setTimeout(function() {
// 					$(".inputbox").eq(0).find($(".form-control")).focus();
// 				},1000);
// 				return false;
// 			}
// 	    	if($(".preview-box").length<5){
// 				swal("사진은 최소 5장을 넣어주세요.","", "info"); 
// 	    		setTimeout(function() {
// 					document.getElementsByClassName("inputbox")[3].scrollIntoView({behavior: "smooth"});
// 				},30);
// 				return false;
// 			}
// 			if($(".inputbox").eq(4).find($(".form-control")).val()==""||$(".inputbox").eq(4).find($(".form-control")).val()==" "||$(".inputbox").eq(4).find($(".form-control")).val()==null){
// 				swal("매장의 간단소개를 입력해주세요.","", "info"); 
// 				document.getElementsByClassName("inputbox")[4].scrollIntoView({behavior: "smooth"});
// 				setTimeout(function() {
// 					$(".inputbox").eq(4).find($(".form-control")).focus();
// 				},900);
// 				return false;
// 			}
// 			if($(".inputbox").eq(5).find($(".form-control")).val()==""||$(".inputbox").eq(5).find($(".form-control")).val()==" "||$(".inputbox").eq(5).find($(".form-control")).val()==null){
// 				swal("매장의 소갯글를 입력해주세요.","", "info"); 
// 				setTimeout(function() {
// 					document.getElementsByClassName("inputbox")[5].scrollIntoView({behavior: "smooth"});
// 				},30);
// 				setTimeout(function() {
// 					$(".inputbox").eq(5).find($(".form-control")).focus();
// 				},850);
// // 				swal("매장의 소갯글를 입력해주세요."); 
// 				return false;
// 			}
			
// 			if($(".inputbox").eq(7).find($(".form-control")).val()==""||$(".inputbox").eq(7).find($(".form-control")).val()==" "||$(".inputbox").eq(7).find($(".form-control")).val()==null){
// 				swal("매장의 전화번호를 입력해주세요.","", "info"); 
// 				setTimeout(function() {
// 					document.getElementsByClassName("inputbox")[7].scrollIntoView({behavior: "smooth"});
// 				},30);
// 				setTimeout(function() {
// 					$(".inputbox").eq(7).find($(".form-control")).focus();
// 				},750);
// 				return false;
// 			}
// 			if($(".inputbox").eq(8).find($(".form-control")).val()==""||$(".inputbox").eq(8).find($(".form-control")).val()==" "||$(".inputbox").eq(8).find($(".form-control")).val()==null){
// 				swal("담당자의 전화번호를 입력해주세요.","", "info"); 
// 				document.getElementsByClassName("inputbox")[8].scrollIntoView({behavior: "smooth"});
// 				setTimeout(function() {
// 					$(".inputbox").eq(8).find($(".form-control")).focus();
// 				},750);
// 				return false;
// 			}
// 			if($("input[name=store_latitude]").val()==""||$("input[name=store_latitude]").val()==" "||$("input[name=store_latitude]").val()==null){
// 				swal("지도에서 주소를 찾아 선택해주세요.","", "info");  
// 				document.getElementsByClassName("inputbox")[9].scrollIntoView({behavior: "smooth"});
// 				setTimeout(function() {
// 					$(".inputbox").eq(9).find($(".form-control")).eq(0).focus();
// 				},750);
// 				return false;
// 			}
// 			if($("input[name=store_address_detail]").val()==""||$("input[name=store_address_detail]").val()==" "||$("input[name=store_address_detail]").val()==null){
// 				swal("상세주소를 적어주세요.","", "info");
// 				document.getElementsByClassName("inputbox")[9].scrollIntoView({behavior: "smooth"});
// 				setTimeout(function() {
// 					$(".inputbox").eq(9).find($(".form-control")).eq(1).focus();
// 				},750);
// 				return false;
// 			}
// 			if($(".lastbox").find($(".form-control")).eq(0).val()=="none"){
// 				swal("은행정보를 입력해주세요.","", "info"); 
// 				document.getElementsByClassName("inputbox")[11].scrollIntoView({behavior: "smooth"});
// 				setTimeout(function() {
// 					$(".inputbox").eq(11).find($(".form-control")).eq(0).focus();
// 				},750);
// 				return false;
// 			}
// 			if($("input[name=store_account]").val()==""||$("input[name=store_account]").val()==" "||$("input[name=store_account]").val()==null){
// 				swal("계좌번호를 입력해주세요.","", "info"); 
// 				document.getElementsByClassName("inputbox")[11].scrollIntoView({behavior: "smooth"});
// 				setTimeout(function() {
// 					$(".inputbox").eq(11).find($(".form-control")).eq(1).focus();
// 				},750);
// 				return false;
// 			}
// 			return false;
// 		}
	});
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
<div id="sticky">
		<div id="navi2">
			<div class="navis2" onclick="location.href='store.do?store_seq=${sdto.store_seq}'">
				매장 홈
			</div>
			<div class="navis2 home" onclick="location.href=location.href='owner_toReupdate_store.do'">
				매장정보 수정
			</div>
			<div class="navis2" onclick="location.href='owner_mystore_reserve.do?store_seq=${sdto.store_seq}'">
				예약관리
			</div> 
			<div class="navis2" onclick="location.href='review.do?store_seq=${sdto.store_seq}'">
				리뷰관리
			</div>
			<div class="navis2" onclick="location.href='qna.do?store_seq=${sdto.store_seq}'">
				문의관리
			</div>
		</div>
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
       	<div id="search_2">
		  <input onkeypress="if( event.keyCode==13 ){goSearch();}" type="text" id="searchbar_2" class="form-control pull-left" placeholder="ex) 영등포구 양산로 53, 양평동 3가 15-1">
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
					
					search_val=$("#searchbar_2").val();
					
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

	<form id="udtform" action="owner_reupdate_store.do" method="post" enctype="multipart/form-data">
		<div id="tle">
			<div id="regist" class="testmod">
				매장 정보 수정
			</div> 
			<div>
				<div class="inputbox">
					<div class="inputtitle">매장명</div> 
					<div class="inputs"><input class="form-control" type="text" name="store_name" value="${sdto.store_name}" placeholder="예)양평 동물병원"/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">대표명</div>
					<div class="inputs"><input class="form-control" type="text" value="${sdto.store_owner_name}" readonly/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">홈페이지 링크</div>
					<div class="inputs">
						<input class="width_500 form-control" type="text" name="store_path" value="${sdto.store_path}" placeholder="http://www.naver.com"/>
						<br>
						<div class="subinfo">*자사 홈페이지 링크를 입력할 수 있어요.(선택사항)</div>
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
					<div class="inputtitle">간단소개<br>(30자이내)</div>
					<div class="inputs">
						<textarea class="form-control" name="store_intro_simple" placeholder="매장이름과 함께 지도에 노출될 간단 소개글을 입력해주세요. (40자 이내)">${sdto.store_intro_simple}</textarea>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">매장소개<br>(500자이내)</div>
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
					<div class="inputtitle">매장<br>전화번호</div>
					<div class="inputs"><input class="form-control" type="text" name="store_phone" value="${sdto.store_phone}" placeholder="'-' 없이 입력"/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">담당자<br>전화번호</div>
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
					<div class="inputtitle">영업시간등록</div>
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
					<div class="inputtitle">계좌등록</div>
					<div class="inputs">
						은행
						<select class="form-control" name="store_bank">
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
							<div id="regist" class="testmod">
							<br><br><br>
				서비스/메뉴 정보 수정
			</div> 
			<div>
				<div class="inputbox">
					<div class="inputtitle">매장종류</div>
					<div class="inputs">
						<div class="catechkboxes_big">
							<div class="catechkbox">
								<div>대표 매장종류</div>
								<div class="subinfo">*한가지만 선택</div>
								<div class="subinfo">*지도위의 아이콘용</div>
								
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A" <c:if test="${cmain.category_code eq 'A'}">checked</c:if>/>동물병원
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="B" <c:if test="${cmain.category_code eq 'B'}">checked</c:if>/>카페/식당
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="C" <c:if test="${cmain.category_code eq 'C'}">checked</c:if>/>식품/용품
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="D" <c:if test="${cmain.category_code eq 'D'}">checked</c:if>/>숙박
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="E" <c:if test="${cmain.category_code eq 'E'}">checked</c:if>/>돌봄서비스
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="F" <c:if test="${cmain.category_code eq 'F'}">checked</c:if>/>미용
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="G" <c:if test="${cmain.category_code eq 'G'}">checked</c:if>/>체험
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="H" <c:if test="${cmain.category_code eq 'H'}">checked</c:if>/>분양/교배
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="I" <c:if test="${cmain.category_code eq 'I'}">checked</c:if>/>장례
							</div>
						</div>
						<div class="catechkboxes">
							<div class="catechkbox">
								<div>해당되는 항목을 모두 체크해주세요</div>
								<div class="subinfo">*대표 매장종류에 해당되지 않아도 선택 가능합니다</div>
								<div class="subinfo">&nbsp;</div>
								
								
							</div> 
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="a1"/>종합
								<input type="checkbox" name="category_code_small" value="a2"/>내과
								<input type="checkbox" name="category_code_small" value="a3"/>외과
								<input type="checkbox" name="category_code_small" value="a4"/>치과
								<input type="checkbox" name="category_code_small" value="a5"/>24시
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="b1"/>동반가능 카페
								<input type="checkbox" name="category_code_small" value="b2"/>동반가능 식당
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="c1"/>용품
								<input type="checkbox" name="category_code_small" value="c2"/>식품
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="d1"/>글램핑/카라반
								<input type="checkbox" name="category_code_small" value="d2"/>펜션
								<input type="checkbox" name="category_code_small" value="d3"/>풀빌라
								<input type="checkbox" name="category_code_small" value="d4"/>호텔
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="e1"/>호텔
								<input type="checkbox" name="category_code_small" value="e2"/>펫시터
								<input type="checkbox" name="category_code_small" value="e3"/>유치원
								<input type="checkbox" name="category_code_small" value="e4"/>펫택시
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="f1"/>미용
								<input type="checkbox" name="category_code_small" value="f2"/>목욕
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="g1"/>놀이터
								<input type="checkbox" name="category_code_small" value="g2"/>운동장
								<input type="checkbox" name="category_code_small" value="g3"/>훈련
								<input type="checkbox" name="category_code_small" value="g4"/>수영장
								<input type="checkbox" name="category_code_small" value="g5"/>스튜디오
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="h1"/>분양 
								<input type="checkbox" name="category_code_small" value="h2"/>교배
								<input type="checkbox" name="category_code_small" value="h3"/>유기견
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="i1"/>장례
							</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="inputbox">
					<div class="inputtitle">메뉴등록</div>
					
					<!-- 새로짜보는중333!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
					<div id="menubigbox" class="inputs">
						<div id="menu_seqs" style="display:none">
							<c:forEach var="i" begin="0" end="${list_menu.size()-1}" step="1">
								<c:if test="${list_menu[i].menu_delflag=='N'}">
									<input type="hidden" name="menu_seq" value="${list_menu[i].menu_seq}">
								</c:if>
							</c:forEach>
						</div>
						<div id="del_menus" style="display:none"></div>
						
						<!-- 메뉴 수만큼 돌아가는 for문 -->
						<!-- Def==N인 메뉴 수만큼 돌아가는 for문으로 바꿔줘야한다. -->
						<c:forEach var="i" begin="0" end="${list_menu.size()-1}" step="1">
							
								<c:choose>
									<c:when test="${i==0}">
									<!-- if 맨처음이면 -->
									<!-- ::::::::::첫 카테고리의 첫 틀 + 각 카테고리의 첫 메뉴 -->
										<ul class="menuboxes">
											<li>
												<div class="big_cate">${list_menu[i].category_name}</div>
												<input type="hidden" name="category_code_ex" value="${list_menu[i].category_code}">
												<input type="hidden" name="category_code_ex" value="${list_menu[i].category_code}">
												<br>
											</li>
											<li>
												<span class="menu_name">메뉴명</span>
												<span class="menubox_long">설명</span>
												<span class="menu_price" style="width: 145px;">가격 / 예약</span>
												<span class="menu_name"></span>
											</li>
											<li>
												<input type="hidden" name="category_code_2" value="${list_menu[i].category_code}">
												<input type="hidden" name="menu_seq_li" value="${list_menu[i].menu_seq}"> 
												<input class="menu_name form-control" type="text" name="menu_name" value="${list_menu[i].menu_name}" placeholder="메뉴명"/>
												<textarea rows="3" class="menubox_long form-control" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~">${list_menu[i].menu_content}</textarea>
												<div class="menu_price">
													<div class="menu_price2">
													가격
													<input class="menu_price form-control" type="text" name="menu_price" value="${list_menu[i].menu_price}" placeholder="10000"/>
													</div>
													<div class="menu_reserve">
													예약
													<select class="settime form-control menu_price" name="menu_state">
														<option value="N" <c:if test="${list_menu[i].menu_state eq 'N'}">selected</c:if>>미사용</option>
														<option value="T" <c:if test="${list_menu[i].menu_state eq 'T'}">selected</c:if>>시간제</option>
														<option value="S" <c:if test="${list_menu[i].menu_state eq 'S'}">selected</c:if>>숙박제</option>
													</select>
													</div>
												</div>
												<span class="show_menu flright btn btn2 menu_price btn" >
													+
												</span>
											</li>
											<c:forEach var="j" begin="0" end="${list_menu.size()-1}" step="1">
											<!-- 첫 카테고리의 2번째 메뉴부터 출력 -->
<%-- 												<c:if test="${list_menu[j].menu_delflag=='N'}"> --%>
													<c:choose>
														<c:when test="${list_menu[i].category_code==list_menu[j].category_code}">
															<li>
																<input type="hidden" name="category_code_2" value="${list_menu[j].category_code}">
																<input type="hidden" name="menu_seq_li" value="${list_menu[j].menu_seq}"> 
																<input class="menu_name form-control" type="text" name="menu_name" value="${list_menu[j].menu_name}" placeholder="메뉴명"/>
																<textarea rows="3" class="menubox_long form-control" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~">${list_menu[j].menu_content}</textarea>
																<div class="menu_price">
																	<div class="menu_price2">
																	가격
																	<input class="menu_price form-control" type="text" name="menu_price" value="${list_menu[j].menu_price}" placeholder="10000"/>
																	</div>
																	<div class="menu_reserve">
																	예약
																	<select class="settime form-control menu_price" name="menu_state">
																		<option value="N" <c:if test="${list_menu[j].menu_state eq 'N'}">selected</c:if>>미사용</option>
																		<option value="T" <c:if test="${list_menu[j].menu_state eq 'T'}">selected</c:if>>시간제</option>
																		<option value="S" <c:if test="${list_menu[j].menu_state eq 'S'}">selected</c:if>>숙박제</option>
																	</select>
																	</div>
																</div>
																<span class="flright btn btn2 menu_price hide_menu deladd">
																	-
																</span>
															</li>
														</c:when>
													</c:choose>
<%-- 												</c:if> --%>
											</c:forEach>
										</ul>
									</c:when>
									<c:when test="${list_menu[i].category_code!=list_menu[i-1].category_code}">
									<!-- if 카테고리가 새로 바뀌었으면(전카테고리!=현재카테고리 라면) 새로 틀 만들기-->
									<!-- ::::::::::각 카테고리의 큰틀+첫 메뉴 -->
										<ul class="menuboxes">
											<li>
												<div class="big_cate">${list_menu[i].category_name}</div>
												<input type="hidden" name="category_code_ex" value="${list_menu[i].category_code}">
												<br>
											</li>
											<li>
												<span class="menu_name">메뉴명</span>
												<span class="menubox_long">설명</span>
												<span class="menu_price" style="width: 145px;">가격 / 예약</span>
												<span class="menu_name"></span>
											</li>
											<li>
												<input type="hidden" name="category_code_2" value="${list_menu[i].category_code}">
												<input type="hidden" name="menu_seq_li" value="${list_menu[i].menu_seq}"> 
												<input class="menu_name form-control" type="text" name="menu_name" value="${list_menu[i].menu_name}" placeholder="메뉴명"/>
												<textarea rows="3" class="menubox_long form-control" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~">${list_menu[i].menu_content}</textarea>
												<div class="menu_price">
													<div class="menu_price2">
													가격
													<input class="menu_price form-control" type="text" name="menu_price" value="${list_menu[i].menu_price}" placeholder="10000"/>
													</div>
													<div class="menu_reserve">
													예약
													<select class="settime form-control menu_price" name="menu_state">
														<option value="N" <c:if test="${list_menu[i].menu_state eq 'N'}">selected</c:if>>미사용</option>
														<option value="T" <c:if test="${list_menu[i].menu_state eq 'T'}">selected</c:if>>시간제</option>
														<option value="S" <c:if test="${list_menu[i].menu_state eq 'S'}">selected</c:if>>숙박제</option>
													</select>
													</div>
												</div>
												<span class="show_menu flright btn btn2 menu_price btn" >
													+
												</span>
											</li>
											<c:forEach var="j" begin="0" end="${list_menu.size()-1}" step="1">
												<!-- 각 카테고리의 2번째메뉴부터 출력 -->
<%-- 												<c:if test="${list_menu[j].menu_delflag=='N'}"> --%>
													<c:choose>
														<c:when test="${list_menu[i].category_code==list_menu[j].category_code}">
															<li>
																<input type="hidden" name="category_code_2" value="${list_menu[j].category_code}">
																<input type="hidden" name="menu_seq_li" value="${list_menu[j].menu_seq}"> 
																<input class="menu_name form-control" type="text" name="menu_name" value="${list_menu[j].menu_name}" placeholder="메뉴명"/>
																<textarea rows="3" class="menubox_long form-control" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~">${list_menu[j].menu_content}</textarea>
																<div class="menu_price">
																	<div class="menu_price2">
																	가격
																	<input class="menu_price form-control" type="text" name="menu_price" value="${list_menu[j].menu_price}" placeholder="10000"/>
																	</div>
																	<div class="menu_reserve">
																	예약
																	<select class="settime form-control menu_price" name="menu_state">
																		<option value="N" <c:if test="${list_menu[j].menu_state eq 'N'}">selected</c:if>>미사용</option>
																		<option value="T" <c:if test="${list_menu[j].menu_state eq 'T'}">selected</c:if>>시간제</option>
																		<option value="S" <c:if test="${list_menu[j].menu_state eq 'S'}">selected</c:if>>숙박제</option>
																	</select>
																	</div>
																</div>
																<span class="flright btn btn2 menu_price hide_menu deladd">
																	-
																</span>
															</li>
														</c:when>
													</c:choose>
<%-- 												</c:if> --%>
											</c:forEach>
										</ul>
										
										<!-- xxxxxxxxxxxxxxxxxxxxx -->
										
									</c:when>
								</c:choose>
							
						</c:forEach>
					</div>
				</div>
				
				
				
				<div class="inputbox lastbox">
					<div class="inputtitle">예약관련 설정</div>
					<div class="inputs">
						<div>※최대 예약일 : <input type="number" min="0" max="180" name="store_maxdate" value="${sdto.store_maxdate}" placeholder="0" value="0" readonly/>일</div>
						<div class="subinfo">*최대 몇 일까지 예약 가능한가요? 1박2일의 경우 : 2일</div>
						<div class="subinfo">*숙박제 예약메뉴가 있는경우에 한해 작성가능합니다.</div>
						<div class="subinfo">*모든 숙박제에 공통으로 적용됩니다.</div>
						<div class="subinfo">*최대 1개월(30일)까지 작성할 수 있습니다.</div>
						<br>
						<div>※시간당 최대 허용인원 : <input type="number" min="0" max="200" name="store_maxman" value="${sdto.store_maxman}" placeholder="0" value="0" readonly/>명</div>
						<div class="subinfo">*한시간에 몇 명의 예약을 받을 수 있나요?</div>
						<div class="subinfo">*시간제 예약메뉴가 있는경우에 한해 작성가능합니다.</div>
						<div class="subinfo">*모든 숙박제에 공통으로 적용됩니다.</div>
						<div class="subinfo">*최대 한시간당 200명까지 등록할 수 있습니다.</div>
					</div>
				</div>
			
				<br>
					<div id="bot" class="flright" >
<!-- 						<input class="btn redbtn" value="취소" onclick="location.href='index.jsp'" type="button"/> -->
<!-- 						<input class="btn greenbtn" value="입점신청" type="submit"/> -->
					</div>
					<br>
					<br>
					<br><br>
					<br>
					<br>
				
			</div>
				
		</div>
	</form>
	<div class="toSubmit">
		<div class="toSubmit_text_box">
			<div class="toSubmit_text_first" onclick="location.href='index.do'">취소</div>
			<div class="toSubmit_text" onclick="update()">수정완료</div>
		</div>
	</div>
	<script type="text/javascript">
		function update() {
// 			var boool=swal("정말 수정하시겠습니까?", {
// // 				buttons: ["아니오, 아직이예요.", "예, 수정합니다."],
// 				buttons: ["아니오, 아직이예요.", true],
// 			});
// 			alert(boool);
			
			
// 			if(boool){
// 				$("#udtform").submit();
// 			}
// 			}else{
// 				return false;
// 			}
			if($(".inputbox").eq(0).find($(".form-control")).val()==""||$(".inputbox").eq(0).find($(".form-control")).val()==" "||$(".inputbox").eq(0).find($(".form-control")).val()==null){
				swal("매장이름을 입력해주세요.","", "info"); 
				var scroll = $(".inputbox").eq(0).offset();
				$('html').animate({scrollTop : scroll.top-121}, 400);
				setTimeout(function() {
					$(".inputbox").eq(0).find($(".form-control")).focus();
				},1000);
				return false;
			}
			if($(".preview-box").length<5){
				swal("사진은 최소 5장을 넣어주세요.","", "info"); 
				var scroll = $(".inputbox").eq(3).offset();
				setTimeout(function() {
					$('html').animate({scrollTop : scroll.top-121}, 400);
				},30);
				return false;
			}
			if($(".inputbox").eq(4).find($(".form-control")).val()==""||$(".inputbox").eq(4).find($(".form-control")).val()==" "||$(".inputbox").eq(4).find($(".form-control")).val()==null){
				swal("매장의 간단소개를 입력해주세요.","", "info"); 
				var scroll = $(".inputbox").eq(4).offset();
				$('html').animate({scrollTop : scroll.top-121}, 400);
				setTimeout(function() {
					$(".inputbox").eq(4).find($(".form-control")).focus();
				},900);
				return false;
			}
			if($(".inputbox").eq(5).find($(".form-control")).val()==""||$(".inputbox").eq(5).find($(".form-control")).val()==" "||$(".inputbox").eq(5).find($(".form-control")).val()==null){
				swal("매장의 소갯글를 입력해주세요.","", "info"); 
				var scroll = $(".inputbox").eq(5).offset();
				$('html').animate({scrollTop : scroll.top-121}, 400);
				setTimeout(function() {
					$(".inputbox").eq(5).find($(".form-control")).focus();
				},850);
				return false;
			}
			
			if($(".inputbox").eq(7).find($(".form-control")).val()==""||$(".inputbox").eq(7).find($(".form-control")).val()==" "||$(".inputbox").eq(7).find($(".form-control")).val()==null){
				swal("매장의 전화번호를 입력해주세요.","", "info"); 
				var scroll = $(".inputbox").eq(7).offset();
				$('html').animate({scrollTop : scroll.top-121}, 400);
				setTimeout(function() {
					$(".inputbox").eq(7).find($(".form-control")).focus();
				},750);
				return false;
			}
			if($(".inputbox").eq(8).find($(".form-control")).val()==""||$(".inputbox").eq(8).find($(".form-control")).val()==" "||$(".inputbox").eq(8).find($(".form-control")).val()==null){
				swal("담당자의 전화번호를 입력해주세요.","", "info"); 
				var scroll = $(".inputbox").eq(8).offset();
				$('html').animate({scrollTop : scroll.top-121}, 400);
				setTimeout(function() {
					$(".inputbox").eq(8).find($(".form-control")).focus();
				},750);
				return false;
			}
			if($("input[name=store_latitude]").val()==""||$("input[name=store_latitude]").val()==" "||$("input[name=store_latitude]").val()==null){
				swal("지도에서 주소를 찾아 선택해주세요.","", "info");
				var scroll = $(".inputbox").eq(9).offset();
				$('html').animate({scrollTop : scroll.top-121}, 400);
				setTimeout(function() {
					$(".inputbox").eq(9).find($(".form-control")).eq(0).focus();
				},750);
				return false;
			}
			if($("input[name=store_address_detail]").val()==""||$("input[name=store_address_detail]").val()==" "||$("input[name=store_address_detail]").val()==null){
				swal("상세주소를 적어주세요.","", "info");
				var scroll = $(".inputbox").eq(9).offset();
				$('html').animate({scrollTop : scroll.top-121}, 400);
				setTimeout(function() {
					$(".inputbox").eq(9).find($(".form-control")).eq(1).focus();
				},750);
				return false;
			}
			if($(".lastbox").find($(".form-control")).eq(0).val()=="none"){
				swal("은행정보를 입력해주세요.","", "info"); 
				var scroll = $(".inputbox").eq(11).offset();
				$('html').animate({scrollTop : scroll.top-121}, 400);
				setTimeout(function() {
					$(".inputbox").eq(11).find($(".form-control")).eq(0).focus();
				},750);
				return false;
			}
			if($("input[name=store_account]").val()==""||$("input[name=store_account]").val()==" "||$("input[name=store_account]").val()==null){
				swal("계좌번호를 입력해주세요.","", "info"); 
				var scroll = $(".inputbox").eq(11).offset();
				$('html').animate({scrollTop : scroll.top-121}, 400);
				setTimeout(function() {
					$(".inputbox").eq(11).find($(".form-control")).eq(1).focus();
				},750);
				return false;
			}
			
			/////카테고리관련
			
			
			//대표카테고리 체크박스 수만큼 돌면서 체크되어있는 카테고리의 값을 담는다
			//만약체크가 되어있지않다면 return false
			var selectedCate="";
	    	var cateBoxes = $("input:checkbox[name=category_code]");
			for (var i = 0; i < cateBoxes.length; i++) {
				if(cateBoxes.eq(i).prop("checked")==true){
					selectedCate=cateBoxes.eq(i).val();
				}
			}
			if(selectedCate==""){
				swal("대표카테고리 항목을 선택해주세요.","*1가지만 선택할 수 있어요. \n*세부카테고리는 다중선택 가능해요.", "info");
				return false;
			}
// 			alert(selectedCate.toLowerCase());
	    	var cateCount=0;
	    	var cateMainCount=0;
	    	var cateBoxesSmall = $("input:checkbox[name=category_code_small]");
			for (var i = 0; i < cateBoxesSmall.length; i++) {
				//모든 세부카테들을 돌면서 체크되어있는 체크박스가 있으면
				if(cateBoxesSmall.eq(i).prop("checked")==true){
					//일단카운트업하고
					cateCount++;
					//체크된 박스 중 각 세부카테들의 value안에 위에 구한 큰카테가 포함되어있다면
					if(cateBoxesSmall.eq(i).val().indexOf(selectedCate.toLowerCase())!=-1){
						cateMainCount++;
					}
				}
			}
// 			alert(selectedCate);

			//만약 cateCount가 0이면 return false
// 			alert("체크된 카테 수 : "+cateCount);
			
			//만약 cateCount가 1보다 큰데  return false
// 			alert("체크된 카테 중 대표카테고리에 포함된 카테 수 :"+cateMainCount);
			
			//만약 체크된 카테가 없거나 대표카테고리에 해당하는 카테가 없으면, 둘중 어떤거든 누락이라면 return false
	    	if(cateCount==0||cateMainCount==0){
	    		swal("카테고리 항목을 확인해주세요.","대표종류에 해당하는 한가지 이상의 항목에 체크해주세요!", "info");
// 	    		document.getElementsByClassName("inputbox")[13].scrollIntoView({behavior: "smooth"});
	    		var scroll = $(".inputbox").eq(12).offset();
				$('html').animate({scrollTop : scroll.top-121}, 400);
				return false;
	    	}
			
			if($("input[name=store_maxman]").prop("readonly")==false){
// 				alert("최대인원수 readonly 풀린상태입니다.")
				if($("input[name=store_maxman]").val()==0){
// 					alert("최대인원수 readonly 풀린상태인데 값이 0입니다.")
					swal("시간당 최대인원수를 입력해주세요.","*설명을 잘 읽고 적어주세요", "info"); 
					setTimeout(function() {
						$("input[name=store_maxman]").focus();
					},1000);
					return false;
				}
			}
			if($("input[name=store_maxdate]").prop("readonly")==false){
// 				alert("최대예약일 readonly 풀린상태입니다.")
				if($("input[name=store_maxdate]").val()==0){
// 					alert("최대예약일 readonly 풀린상태인데 값이 0입니다.")
					swal("최대 예약일을 입력해주세요.","*설명을 잘 읽고 적어주세요", "info"); 
					setTimeout(function() {
						$("input[name=store_maxdate]").focus();
					},1000);
					return false;
				}
			}
			
			swal({
			     title: "수정을 완료하시겠습니까?",
			     text: "",
			     icon: "info", //"info,success,warning,error" 중 택1
			     buttons: ["아니오, 아직이예요.", "예, 수정할게요."],
			}).then((YES) => {
			     if (YES) {
			     	$("#udtform").submit();
			     }else{
			     	
			     }
			});
		}
	</script>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />