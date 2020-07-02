<%@page import="com.hk.conred.dtos.ODto"%>
<%@page import="com.hk.conred.dtos.ReserveDto"%>
<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="com.hk.conred.dtos.RPhotoDto"%>
<%@page import="com.hk.conred.dtos.SDto"%>
<%@page import="com.hk.conred.dtos.ReplyDto"%>
<%@page import="java.util.List"%>
<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> jstl 시간포맷  --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--  별점    -->
<link href="css/star_service.css" rel="stylesheet">
<link href="css/star_price.css" rel="stylesheet">
<link href="css/star_clean.css" rel="stylesheet">
<!--  사진확대  -->
<!-- <link rel="stylesheet" href="css/magnific-popup.css"> -->
<!-- <script src="js/jquery.magnific-popup.min.js"></script>  -->
<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css"> 
	#container{ border:1px solid rgba(225,225,225,1.00);border-top-width:0px;min-height:700px; border-bottom:1px solid #fff; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
   	#sticky{z-index:200;position: sticky; top:71px;display: inline-block;}
   	#navi2{width:998px;clear:both;position:relative;top:0px;text-align: center;line-height: 50px;display: inline-block;border-bottom: 1px solid #585858;}
   	.navis2{ font-size:18px; float:left;width:200px;height:50px;color: #000;background-color: #fff;}
   	.navis2:last-child{ font-size:18px; float:left;width:198px;height:50px;color: #000;background-color: #fff;}
   	.navis2:hover{color:#000;transition:all .3s;cursor:pointer;border-bottom: 5px solid #585858;}
	.home{background-color: white;color:black;border-bottom:5px solid #585858 ;}

	#pagename {z-index: -1;font-size: 20px;position: relative;left: 100px;margin-top: 20px;margin-bottom: 30px;display: inline-block;}
	
	.mybox {padding: 20px;border-top: 1px solid #BDBDBD;width: 700px;height: 370px;font-size: 15px;margin-left: 150px;min-height: 370px;}
	
	.myboxmargin {margin-top: 30px;}
	
	#main {width: 702px;height: 250px;margin-left: 147px;padding-top: 25px;}
	
	#main2 {font-size: 20px;}
	
	#main2 {}
	
	.pf {float: left;width: 40px;height: 40px;}
	
	.dt {margin-left: 600px;}
	
	.info {min-height: 250px;}
	
	.contents {display: inline-block;padding: 10px;width: 669px;height: 80px;text-overflow: ellipsis;overflow: hidden;word-break: keep-all;min-height: 80px;clear: both;margin-bottom: 15px;}
	
	.info2 {background-color: #F2F2F2;height: 80px;padding: 10px;text-overflow: ellipsis;overflow: hidden;display: inline-block;width: 600px;
		min-height: 80px;border-radius: 5px;word-break: keep-all;margin-left: 33px;}
	
	.bot {margin: 0 auto;text-align: center;}
	
	.modal-title {text-align: center;font-size: 25px;}
	
	.modal-body span {margin: 5px;}
	
	textarea:focus::-webkit-input-placeholder {color: transparent;}
	
	.modal-footer {width: 897px;height: auto;border-width: 0px;}
	
	.inputs {width: 600px;float: left;height: auto;}
	
	.my_button {display: inline-block;width: 200px;text-align: center;padding: 10px;background-color: #006BCC;color: #fff;text-decoration: none;
		border-radius: 5px;float: left;}
	
	.modal_Btn {border: 0;margin-left: 630px;height: 50px;border-radius: 5px;background-color: #94B8FD; color: white;width: 100px;}
	
	.modal_Btn:hover {background-color: #4a83ed;}
	
	.overfive {float: left;}
	
	.star_bigtle {margin-left: 65px;float: left;}
	/*  	.upload_message{height: 40px; width: 400px;margin-left: 215px; text-align: center; line-height: 37px;} */
	.content_detail {background-color: #fafafa;border-width: 0;}
	
	.content_detail:hover {background-color: grey;}
	
	.star_table {width: 200px;height: 80px;background-color: #F2F2F2;border-radius: 5px;padding: 10px;float: left;}
	
	.starz {width: 17px;height: auto;display: inline-block;margin: -2px;margin-bottom: 4px;}
	
	.small_star {width: 25px;height: auto;margin: -2px;margin-bottom: 4px;}
	
	.big_star {width: 40px;height: auto;}
	
	.buttondle {background-color: #585858;color: white;border-radius: 5px;}
	
	.user_avg {float: right;font-size: 20px;padding-top: 17px;}
	
	.star_score {float: left;}
	
	.tle_final {width: 700px;border-top: 1px solid #BDBDBD;margin-left: 150px;margin-bottom: 200px;}
	
	.bigNumber {font-size: 25px;font-weight: bold;}
	
	/*       파일업로드 */
	#preview {float: left;width: 870px;padding-left: 13px;min-height: 5px;}
	
	#preview img {width: 135px;height: 80px;overflow: hidden;}
	
	#preview p {text-overflow: ellipsis;overflow: hidden;}
	
	.preview-box {border: 0px solid grey;padding: 5px;border-radius: 2px;margin-bottom: 5px;margin-right: 25px;display: inline-block;border-radius: 5px;
		max-width: 146px;border-right-width: 1px;border-bottom-width: 1px;float: left;}
	
	.thumbnail {margin-bottom: 0px;width: 135px;height: 80px;}
	
	input[type=file] {display: none;}
	
	.f_insert {background-color: #2E2EFE;font-weight: bold;color: white;}
	
	.f_insert:hover {color: #BDBDBD;font-size: 15px;}
	
	#attach {width: 140px;margin-bottom: 10px;}
	
	.user_review_img {width: 455px;height: 80px;margin-left: 205px;}
	
	.reply_write {height: 34px;float: right;border-color: #ccc;border-radius: 5px;}
	
	.reply_write:hover {background-color: #D8D8D8;}
	
	.nologin {border: 0;margin-left: 528px;}
	
	.onlogin {margin-left: 475px;border: 0;}
	
	.nologin:hover {background-color: grey;}
	
	.onlogin:hover {background-color: grey;}
	
	.img_cursor:hover {cursor: pointer;}
	
	.ownerAnswer_btn{float: right;background-color: #94B8FD;color: white;width: 60px;height: 32px;border: 0;border-radius: 5px;}
	.ownerAnswer_btn:hover {background-color: #4a83ed;}
	.ownerAnswer{display: none; width: 665px;height: 98px;resize: none;}
	.ownerAnswer_success{display: none;}
	.ownerAnswer_cancel{display: none;}
	
	.ownerAnswer_update{float: right;background-color: #94B8FD;color: white;width: 72px;height: 32px;border: 0;border-radius: 5px;}
	.ownerAnswer_update:hover {background-color: #4a83ed;}
	
	.main_star_table{width: 230px;}
	.user_review_name{position: relative; top: -13px; padding-left: 10px;color:#919191;} 
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:25px;margin-bottom:30px;display: inline-block;}
	
</style>
<script type="text/javascript">


	//////////////스크롤 페이징
	var count = 1;
	$(function(){ 
// 		var aa=$("input[name=zz]").val();
// 		$(".asdasd").css({"width":"80px","height":"80px","background":"url(upload_rphoto/"+aa+")","background-size":"80px 80px","background-repeat":"no-repeat"});
		
		
		
		var store_seq=$("input[name=store_seq]").val();
		//스크롤 바닥 감지 
		window.onscroll = function(e) {
		    //추가되는 임시 콘텐츠
		    //window height + window scrollY 값이 document height보다 클 경우,
		    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		    	//실행할 로직 (콘텐츠 추가) 
		        count++;
		        var addContent ="";
				$.ajax({
					url:"review_ajax.do", 
					method:"post", 
					data:{"pnum":count,"store_seq":store_seq},
					dataType:"json", 
					success:function(obj){  
						var lists=obj.list;  
						var lists_photo=obj.list_photo;
						var owner_id=obj.store_name.owner_id;
						if(lists_photo==""){
							$.each(lists,function(i){
								addContent+= ' <div class="bigtle" > '
											+	'	<div class="mybox">     '     
											+	'	<img src="./img/profile_default.png" class="pf"/>  '
											+	'	<div class="info">        '
											+	''		+ buttonChk(lists[i].user_id,lists[i].reply_seq) + ''
											+	'		<span class="user_review_name">닉네임: '+ lists[i].user_id +' </span><span style="float:right;color:#919191;">'+ lists[i].reply_realdate +' </span><br>'
											+	'		<div class="star_table">'
											+	'			<table class="star_score">'
											+	'				<tr> '
											+	'					<td>서비스</td>'
											+	'					<td>'
								 			+	'		            <td>'+ star_fill(lists[i].reply_service)+star_half(lists[i].reply_service)+star_empty(lists[i].reply_service) +'</td>         		'
											+	'					</td> '
											+	'				</tr>'
											+	'				<tr>'
											+	'					<td>가격</td>'
											+	'					<td>'
											+	'					<td>'+ star_fill(lists[i].reply_price)+star_half(lists[i].reply_price)+star_empty(lists[i].reply_price) +'</td>         		'
											+	'					</td> '
											+	'				</tr>'
											+	'				<tr>'
											+	'					<td>청결도</td>'
											+	'					<td>'
								+'									<td>'+ star_fill(lists[i].reply_clean)+star_half(lists[i].reply_clean)+star_empty(lists[i].reply_clean) +'</td>         		'
								+'									</td> '
								+'								</tr>'
							+	'							</table>'
							+							'<div class="user_avg">'+ (Math.round(((lists[i].reply_clean+lists[i].reply_price+lists[i].reply_service)/3)*10)/10) +'</div>'
							+	'						</div>' 
							+	'						<div class="user_review_img" >'
							+   '						</div>     ' 
							+	'						<div class="contents">' 
							+	'							<span style="font-weight: bold;">리뷰내용</span><br>'
							+	'							<span>'+ lists[i].reply_content +'</span>'
							+	'						</div> '
							+	'					</div>   '
							+	'					<div class="info2">     '
							+	'						<span style="font-weight: bold;">매장답변</span><br> '
							+''	+							ownerAnswer(lists[i].reply_answer,owner_id)		+''							
							+'						</div> '
							+			''+	ownerAnswer02(lists[i].reply_answer)  +''
							+'			<button class="ownerAnswer_success">답변완료</button>'
							+'			<button class="ownerAnswer_cancel">취소</button>'
							+'			<input type="hidden" name="reply_seq" value="'+lists[i].reply_seq+'"/>'
							+'					</div>   '
							+'				</div>      '
							+'				<br><br>';
							});
			        		$('.bigbig').append(addContent);
						}else{
							$.each(lists,function(i){
								addContent+= ' <div class="bigtle" > '
											+	'	<div class="mybox">     '     
											+	'	<img src="./img/profile_default.png" class="pf"/>  '
											+	'	<div class="info">        '
											+	''		+ buttonChk(lists[i].user_id,lists[i].reply_seq) + ''
											+	'		<span class="user_review_name">닉네임: '+ lists[i].user_id +' </span><span style="float:right;color:#919191;">'+ lists[i].reply_realdate +' </span><br>'
											+	'		<div class="star_table">'
											+	'			<table class="star_score">'
											+	'				<tr> '
											+	'					<td>서비스</td>'
											+	'					<td>'
								 			+	'		            <td>'+ star_fill(lists[i].reply_service)+star_half(lists[i].reply_service)+star_empty(lists[i].reply_service) +'</td>         		'
											+	'					</td> '
											+	'				</tr>'
											+	'				<tr>'
											+	'					<td>가격</td>'
											+	'					<td>'
											+	'					<td>'+ star_fill(lists[i].reply_price)+star_half(lists[i].reply_price)+star_empty(lists[i].reply_price) +'</td>         		'
											+	'					</td> '
											+	'				</tr>'
											+	'				<tr>'
											+	'					<td>청결도</td>'
											+	'					<td>'
								+'									<td>'+ star_fill(lists[i].reply_clean)+star_half(lists[i].reply_clean)+star_empty(lists[i].reply_clean) +'</td>         		'
								+'									</td> '
								+'								</tr>'
							+	'							</table>'
							+							'<div class="user_avg">'+ (Math.round(((lists[i].reply_clean+lists[i].reply_price+lists[i].reply_service)/3)*10)/10) +'</div>'
							+	'						</div>' 
							+	'						<div class="user_review_img" >'
							+   							''+ reviewImg(lists[i].reply_seq) +''
							+   '						</div>     ' 
							+	'						<div class="contents">' 
							+	'							<span style="font-weight: bold;">리뷰내용</span><br>'
							+	'							<span>'+ lists[i].reply_content +'</span>'
							+	'						</div> '
							+	'					</div>   '
							+	'					<div class="info2">     '
							+	'						<span style="font-weight: bold;">매장답변</span><br> '
							+					''+			ownerAnswer(lists[i].reply_answer,owner_id)			+''			
							+'						</div> '
							+			''+	ownerAnswer02(lists[i].reply_answer)  +''
							+'			<button class="ownerAnswer_success">답변완료</button>'
							+'			<button class="ownerAnswer_cancel">취소</button>'
							+'			<input type="hidden" name="reply_seq" value="'+lists[i].reply_seq+'"/>'
							+'					</div>   '
							+'				</div>      '
							+'				<br><br>';
							});
			        		$('.bigbig').append(addContent);
						}
								
					}
				});
		   
	
				}   
		    }
	
	//////////////////////////자세히보기
	
		$("body").on("click",".content_detail",function(){
			if($(this).parent().parent().css("height")=="370px"){   
				$(this).parent().parent().css("height","auto");  
				$(this).parent().parent().find(".contents").css({"overflow":"visible","height":"auto","word-break":"break-all"});
				$(this).parent().parent().find(".info2").css({"overflow":"visible","height":"auto","word-break":"break-all"});
			}else{
				$(this).parent().parent().css("height","370px");    
				$(this).parent().parent().find(".contents").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
				$(this).parent().parent().find(".info2").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
			}   
		});      
   
	});//$(function(){}) onload 끝   
	
	
	$(document).ready(function(){
		
		//답변버튼
		$("body").on("click",".ownerAnswer_btn",function(){
			$(this).parent($(".info2")).next(".ownerAnswer").css("display","inline-block");
			$(this).parent($(".info2")).next().next().css("display","inline-block");
			$(this).parent($(".info2")).next().next().next().css("display","inline-block");
			$(this).parent($(".info2")).css("display","none");
		});
		
		//답변취소버튼
		$("body").on("click",".ownerAnswer_cancel",function(){
			$(this).parent($(".mybox")).find(".ownerAnswer").css("display","none");
			$(this).parent($(".mybox")).find(".ownerAnswer_success").css("display","none");
			$(this).parent($(".mybox")).find(".ownerAnswer_cancel").css("display","none");
			$(this).parent($(".mybox")).find(".info2").css("display","inline-block");
		});
		
		//답변완료버튼	
		$("body").on("click",".ownerAnswer_success",function(){
			var reply_seq=$(this).parent($(".mybox")).find("input[name=reply_seq]").val()
			var reply_answer=$(this).parent($(".mybox")).find(".ownerAnswer").val();
			var store_seq=parseInt($("input[name=store_seq]").val());
			location.href="owner_answer.do?reply_seq="+reply_seq+"&reply_answer="+reply_answer+"&store_seq="+store_seq;
		});
		
		//답변수정버튼
		$("body").on("click",".ownerAnswer_update",function(){
			$(this).parent($(".info2")).next(".ownerAnswer").css("display","inline-block");
			$(this).parent($(".info2")).next().next().css("display","inline-block");
			$(this).parent($(".info2")).next().next().next().css("display","inline-block");
			$(this).parent($(".info2")).css("display","none");
		});
		
	
		
	  	///////////
	  	
		if(5<$("#preview").find(".preview-box").length){
			  $("#preview").empty(); 
			  swal("사진은 5개 까지 등록가능합니다.", "", "error");
// 			  ("사진은 5개 까지 등록 가능합니다");
		  }
		
		////////////리뷰작성 모달창
		//숨겨져있을때  -> 모달영역밖에누를때포함
		$(".modal").on("hidden.bs.modal", function(){
			  $("textarea").val("");
			  $("input[type=radio]").prop("checked",false); 
			  $("b").text("0"); 
			  $("#preview").empty(); 
			  $(".modal-title").find("b").text($("input[name=store_name]").val());
		}); 
		
	    $(".modal_Btn").click(function(){
	    	//로그인여부확인
	    	if($(".modal_Btn").val()==1){
	    		
	    		$("div.modal").modal();
	 	        ////////////////////////
	 	        var $star01 = $(".star-input01")
	 		    var $result01;
	 	        var $star_chacked=$star01.find(":checked"); 
	 		  $(document)
	 		    .on("focusin", ".star-input01>.input", function(){
	 		    $(this).addClass("focus");
	 		  })
	 		    .on("focusout", ".star-input01>.input", function(){
	 		    var $this = $(this);
	 		    setTimeout(function(){
	 		      if($this.find(":focus").length === 0){
	 		        $this.removeClass("focus");
	 		      }
	 		    }, 100); 
	 		  })
	 		    .on("change", ".star-input01 :radio", function(){ 
	 		    	$(this).parents(".star-input01").find("b").text($(this).val());
	 		  })
	 		    .on("mouseover", ".star-input01 label", function(){
	 		    	$(this).parents(".star-input01").find("b").text($(this).text());
	 		  })
	 		    .on("mouseleave", ".star-input01>.input", function(){
	 		    var $checked = $star01.find(":checked");
	 		    if($checked.length === 0){
	 		    	$(this).parents(".star-input01").find("b").text("0");
	 		    	$(this).parents(".star-input01").find("b").text("0");
	 		    } else {
	 		    	$(this).parents(".star-input01").find("b").text($checked.next().text());
	 		    	$(this).parents(".star-input01").find("b").text($checked.next().text());
	 		    }
//	  		    alert($(".star-input01").find(":checked").val());
	 		  }); 
	 		
	 		 /////////////////가격 평점
	 		  var $star02 = $(".star-input02"),
	 		      $result = $star02.find("output>b");
	 		  $(document)
	 		    .on("focusin", ".star-input02>.input", function(){
	 		    $(this).addClass("focus");
	 		  })
	 		    .on("focusout", ".star-input02>.input", function(){
	 		    var $this = $(this);
	 		    setTimeout(function(){
	 		      if($this.find(":focus").length === 0){
	 		        $this.removeClass("focus");
	 		      }
	 		    }, 100); 
	 		  })
	 		    .on("change", ".star-input02 :radio", function(){ 
	 		    	$(this).parents(".star-input02").find("b").text($(this).val());
	 		  })
	 		    .on("mouseover", ".star-input02 label", function(){
	 		    	$(this).parents(".star-input02").find("b").text($(this).text());
	 		  })
	 		    .on("mouseleave", ".star-input02>.input", function(){
	 		    var $checked = $star02.find(":checked");
	 		    if($checked.length === 0){
	 		    	$(this).parents(".star-input02").find("b").text("0");
	 		    } else {
	 		    	$(this).parents(".star-input02").find("b").text($checked.next().text());
	 		    }
	 		  }); 
	 		
	 		  /////////////////청결도 평점
	 		  var $star03 = $(".star-input03"),
	 		      $result = $star03.find("output>b");
	 		  $(document)
	 		    .on("focusin", ".star-input03>.input", function(){ 
	 		    $(this).addClass("focus");
	 		  })
	 		    .on("focusout", ".star-input03>.input", function(){
	 		    var $this = $(this);
	 		    setTimeout(function(){
	 		      if($this.find(":focus").length === 0){
	 		        $this.removeClass("focus");
	 		      }
	 		    }, 100);  
	 		  }) 
	 		    .on("change", ".star-input03 :radio", function(){ 
	 		    	$(this).parents(".star-input03").find("b").text($(this).val());
	 		  })
	 		    .on("mouseover", ".star-input03 label", function(){ 
	 		    	$(this).parents(".star-input03").find("b").text($(this).text());
	 		  })
	 		    .on("mouseleave", ".star-input03>.input", function(){
	 		    var $checked = $star03.find(":checked"); 
	 		    if($checked.length === 0){
	 		    	$(this).parents(".star-input03").find("b").text("0");
	 		    } else {
	 		    	$(this).parents(".star-input03").find("b").text($checked.next().text());
	 		    }
	 		  });	
	 		  
	 		  
		
	    		 
	    	}else if($(".modal_Btn").val()==2){
	    		swal("서비스 이용후 댓글을 남기실수 있습니다","", "info");		
	    	}else if($(".modal_Btn").val()==3){
	    		swal("이용자만 가능한 기능입니다","", "error");
	    	}else{
	    		
	    		swal({
				     title: "로그인 후에 작성 가능합니다. \n\n로그인 하시겠습니까?",
				     text: "",
				     icon: "info", //"info,success,warning,error" 중 택1
				     buttons: ["아니오", "예"],
				}).then((YES) => {
				     if (YES) {
				    	location.href="login.do";
				     }else{
				    	 
				     }
				});	
	    		
// 	    		var yesNo=confirm("로그인 후에 작성 가능합니다. \n\n로그인 하시겠습니까?");
// 	    		if(yesNo){
// 	    			location.href="login.do";
// 	    		}else{
	    			
// 	    		}
	    	
	    	}//else끝
	 			 
	 			
	
	    	
	       
	        
	        
		  //닫기버튼
// 		  $(".btn-default").click(function(){ 
// 			  $("input[type=radio]").prop("checked",false); 
// 			  $("b").text("0");
// 			  $("textarea").val(""); 
// 			  alert($("textarea").val().length);  
			 
// 		  });  
		   
		   

	      ////완료버튼   
	       
		  $("form").on("submit",function(){
			  var store_seq=$("input[name=store_seq]").val();
			  var reply_content=$("textarea").val();
			  var reply_service=$(".star-input01").find(":checked").val();
			  var reply_price=$(".star-input02").find(":checked").val();
		      var reply_clean=$(".star-input03").find(":checked").val();
		      var img_length=$("#preview").find(".preview-box").length;
		      
// 		      alert($("#preview").children().size());  
		      
		      if($("textarea").val().length<=100){
				  swal("100자 이상 작성해주세요","", "error");
				  $("textarea").focus();
		    	  return false;
			  }
		      if(reply_service==0||reply_service==null||reply_price==0||reply_price==null||reply_clean==0||reply_clean==null){
		    	  swal("평점을 입력해주세요","", "error");
		    	  return false;
		      }
			  if(5<$("#preview").find(".preview-box").length){
				  $("#preview").empty(); 
				  swal("사진은 5개 까지 등록 가능합니다", "error");
				  return false;
			  } 
		      
		      
		      
		  });
	           
			  
		 
	 
		  /////////////////////////
		  
		
			///////////////파일업로드
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
		    
		    
			$('#attach input[type=file]').change(function() {
				addPreview($(this)); //preview form 추가하기
// 				$(".attach_count").text();
			});
		  
		  
		  
		  
		  
	    });//modal끝
	    
	    
	    
	});
	
	
	
	
	//////////////평점 한개,반개,빈거
	function star_fill(val){
		 var v="";
		for(var i=0;i<Math.floor(val);i++){	 
			v+='<img class="starz" src="img/star_fill.png">';	
		}
		return v;
	 }

	function star_half(val){
		var v="";
		if(0<Math.ceil(val)-Math.floor(val)){	
			v+='<img class="starz" src="img/star_half.png">';
		}
		return v;
	}
	function star_empty(val){
		var v="";
		for(var i=0;i<(5-Math.ceil(val));i++){
			v+='<img class="starz" src="img/star_empty.png">';
		} 
		return v;
	}
	
	////////////////////리뷰 사진 ajax
	function review_photo(name){
		var v="";
		for (var i = 0; i < 5; i++) {
			v+=name;
		}
		return v;
	}
	
	function user_review_delete(reply_seq){
		var result=confirm("정말 삭제 하시겠습니까?");
		if(result){
			location.href="user_review_delete.do?reply_seq="+reply_seq;
		}else{
			
		} 
	}
	
	//모달 글자수제한
	$(function(){
		//모달 글자수제한
		$('.reply_content').keyup(function (e){
		    var reply_content = $(this).val();
		    $('#counter').html("("+reply_content.length+" / 최대 200자)");  
		    if (reply_content.length > 200){
		    	swal("최대 200자까지 입력 가능합니다", "error");
		        $(this).val(reply_content.substring(0, 100));
		        $('#counter').html("(200 / 최대 200자)");  
		    }
		});	
		
		
		
	})
	
	//삭제,자세히보기버튼
	function buttonChk(user_id,reply_seq){
		var session_id=$("input[name=session_id]").val();
		var v="";
		if(session_id!=""){
    		if(session_id==user_id){
    		v='<button class="buttondle onlogin" onclick="user_review_delete('+reply_seq+')">삭제</button><button class="content_detail buttondle">자세히 보기</button><br>';
    		return v;
    		}else{ 
    		v='<button class="content_detail buttondle nologin">자세히 보기</button><br>';
    		return v;
    		}
    	}else{
			v='<button class="content_detail buttondle nologin">자세히 보기</button><br>';
			return v;
    	}
		
		
	}
	//사용자 리뷰 이미지
	function reviewImg(reply_seq){

		
		var v="";
		var photo_length=parseInt($("input[name=photo_length]").val());
		
		for(var i=0;i<photo_length;i++){  
			if(reply_seq==$("input[name=preply_seq"+i+"]").val()){
			v+='<img class="img_cursor" onclick = "javascript:popupImage(this.src)" src="upload_rphoto/'+$("input[name=reply_photo_stored"+i+"]").val()+'" style="width: 80px;height: 80px;float: left;margin-left: 10px;">';						
			}    
		}   
		return v;
	}	
 
/////////-------------------파일업로드관련
	
    //임의의 file object영역
    var files = {};
    var previewIndex = 0;

    // image preview 기능 구현
    // input = file object[]
    function addPreview(input) {
    	
    	var imgTle =document.getElementById('preview');
    	var imgCount=imgTle.childElementCount;
    	var imgs=document.getElementsByClassName('preview-box');
    	
    	if(5<imgCount){
    		imgTle.removeChild(imgs);
    		swal("사진은 5개 까지 등록 가능합니다.", "", "error");
		   return false; 
    	}
    	
        if (input[0].files) {
            //파일 선택이 여러개였을 시의 대응
            for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                var file = input[0].files[fileIndex];
                if(validation(file.name)) continue;
                setPreviewForm(file);
            }
        } else{ 
        	 
        }
        
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
                    "<a class=\"del_btn\" href=\"#a\"value=\""  + imgNum + "\" onclick=\"deletePreview(this)\">" +
                    "삭제" + "</a>"
                    + "</div>"
            );
            files[imgNum] = file;   
//             $(".attach_count").text($(".preview-box").length+"/30");
			//5개 넘으면 삭제
			if(5<$("#preview").find(".preview-box").length){
				  $("#preview").empty();  
				  swal("사진은 5개 까지 등록 가능합니다","", "error");
// 				  alert("asd");
			  }
		

        };
        
        reader.readAsDataURL(file);
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
            swal("jpg, gif, png 확장자만 업로드 가능합니다","", "error");
            return true;
        } else {
            return false; 
        }
    }
     
 	//모달 이미지 삭제
    function deletePreview(obj) {
        var imgNum = obj.attributes['value'].value;
        delete files[imgNum];
        $("#preview .preview-box[value=" + imgNum + "]").remove();

    }
 	
 	//이미지 5개까지만
 	
    
    /////////-------------------
	//사진확대
	function popupImage(url){
    var img = new Image();
    var scWidth = screen.availWidth; //현재 사용중인 스크린 크기를 구함
    var scHeight = screen.availHeight;
    var left = (parseInt(scWidth)-650)/1.5; //팝업창 위치 조절
    var top = (parseInt(scHeight)-100)/3;
    img.src = url;
    var img_width = img.width+500 //팝업창 크기 조절
    var win_width = img.width+500  
    var height = img.height+500;  
    var openImage = window.open('','_blank','width='+img_width+',height='+height+',top='+top+',left='+left+',menubars=no,scrollbars=auto');
    openImage.document.write("<style>body{margin:0px;}</style><a href = # onclick = window.close() onfocus=this.blur()><img src = '"+url+"'width='"+win_width+"'></a>");
  }
	
 	
 	
 	///////////점주 자기매장 답변여부에따른버튼 info2쪽
 	function ownerAnswer(reply_answer,owner_id){
 		var session_id=$("input[name=oSession_id]").val();
 		var v="";
 		if (reply_answer==null||reply_answer=="") {
			v='<span>아직 답변이 없습니다.</span>';
				if(session_id!=""){
					if(session_id==owner_id){
		 				v='<span>아직 답변이 없습니다.</span><button class="ownerAnswer_btn">답변</button>';
						return v;
					}	
				}
				return v;
			} else {
			v='<span>'+reply_answer+'</span>';
				if(session_id!=""){
					if(session_id==owner_id){
						v='<span>'+reply_answer+'</span><button class="ownerAnswer_update">답변수정</button>';
						return v;
					}
				}
				return v;
			}
	}
 	
	///////////점주 자기매장 답변여부에따른버튼 info2바깥(앞)쪽
 	function ownerAnswer02(reply_answer){	
		var v="";
		
 		if(reply_answer==null||reply_answer==""){
			v='<textarea class="ownerAnswer" rows="10" cols="60"></textarea>';
			return v;
			}else{
			v='<textarea class="ownerAnswer" rows="10" cols="60">'+reply_answer+'</textarea>';
			return v;
			}
	}
 	
 	
 	
	
</script>
</head>
<%
	List<ReplyDto> list = (List<ReplyDto>) request.getAttribute("list");
	ReplyDto list_avg = (ReplyDto) request.getAttribute("list_avg");
	List<RPhotoDto> list_photo = (List<RPhotoDto>) request.getAttribute("list_photo");
	UDto uldto = (UDto) session.getAttribute("uldto");
	ReplyDto store_name = (ReplyDto) request.getAttribute("store_name");
	List<ReserveDto> list_reserve = (List<ReserveDto>) request.getAttribute("list_reserve");
	ODto oldto = (ODto) session.getAttribute("oldto");
%>
<body>
	<input type="hidden" name="oSession_id" value="<%=session.getAttribute("oldto")==null?"":oldto.getOwner_id()%>"/>
	<input type="hidden" name="owner_id" value="<%=store_name==null?"":store_name.getOwner_id()%>">
	<input type="hidden" name="store_seq" value="<%=list.size()==0?"":list.get(0).getStore_seq()%>"/>
	<input type="hidden" name="store_name"
		value="<%=store_name==null?"":store_name.getStore_name()%>">
	<input type="hidden" name="photo_length" value="<%=list_photo.size()%>">
	<input type="hidden" name="session_id"
		value="<%=session.getAttribute("uldto") == null ? "" : uldto.getUser_id()%>" />

	<%
		for (int i = 0; i < list_photo.size(); i++) {
	%>
	<input type="hidden" name="preply_seq<%=i%>"
		value="<%=list_photo.get(i).getReply_seq()%>">
	<input type="hidden" name="reply_photo_stored<%=i%>"
		value="<%=list_photo.get(i).getReply_photo_stored()%>">
	<%
		}
	%>


	<form action="user_store_review.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="store_seq"
			value="<%=list.size()==0?"":list.get(0).getStore_seq()%>" />
		<!-- 모탈창 부분 -->
		<div class="modal fade" id="myModal" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="submit" class="reply_write">리뷰 작성 완료</button>

						<h4 class="modal-title">
							<b><%=store_name.getStore_name()%></b>
						</h4>
					</div>
					<div class="modal-body">
						<div class="star_bigtle">
							<span class="star-input01">서비스 <span class="input">
									<input type="radio" name="star-input01" id="s1" value="0.5">
									<label for="s1" class="star_service">0.5</label> 
									<input type="radio"name="star-input01" id="s2" value="1">
									<label for="s2"class="star_service">1</label> 
									<input type="radio"
									name="star-input01" id="s3" value="1.5"><label for="s3"
									class="star_service">1.5</label> <input type="radio"
									name="star-input01" id="s4" value="2"><label for="s4"
									class="star_service">2</label> <input type="radio"
									name="star-input01" id="s5" value="2.5"><label for="s5"
									class="star_service">2.5</label> <input type="radio"
									name="star-input01" id="s6" value="3"><label for="s6"
									class="star_service">3</label> <input type="radio"
									name="star-input01" id="s7" value="3.5"><label for="s7"
									class="star_service">3.5</label> <input type="radio"
									name="star-input01" id="s8" value="4"><label for="s8"
									class="star_service">4</label> <input type="radio"
									name="star-input01" id="s9" value="4.5"><label for="s9"
									class="star_service">4.5</label> <input type="radio"
									name="star-input01" id="s10" value="5"><label for="s10"
									class="star_service">5</label>
							</span> <output for="star-input">
									<b>0</b>점
								</output>
							</span>
						</div>
						<div class="star_bigtle">
							<span class="star-input02">가격 <span class="input">
									<input type="radio" name="star-input02" id="p1" value="0.5"><label
									for="p1" class="star_price">0.5</label> <input type="radio"
									name="star-input02" id="p2" value="1"><label for="p2"
									class="star_price">1</label> <input type="radio"
									name="star-input02" id="p3" value="1.5"><label for="p3"
									class="star_price">1.5</label> <input type="radio"
									name="star-input02" id="p4" value="2"><label for="p4"
									class="star_price">2</label> <input type="radio"
									name="star-input02" id="p5" value="2.5"><label for="p5"
									class="star_price">2.5</label> <input type="radio"
									name="star-input02" id="p6" value="3"><label for="p6"
									class="star_price">3</label> <input type="radio"
									name="star-input02" id="p7" value="3.5"><label for="p7"
									class="star_price">3.5</label> <input type="radio"
									name="star-input02" id="p8" value="4"><label for="p8"
									class="star_price">4</label> <input type="radio"
									name="star-input02" id="p9" value="4.5"><label for="p9"
									class="star_price">4.5</label> <input type="radio"
									name="star-input02" id="p10" value="5"><label for="p10"
									class="star_price">5</label>
							</span> <output for="star-input">
									<b>0</b>점
								</output>
							</span>
						</div>
						<div class="star_bigtle">
							<span class="star-input03">청결도 <span class="input">
									<input type="radio" name="star-input03" id="c1" value="0.5"><label
									for="c1">0.5</label> <input type="radio" name="star-input03"
									id="c2" value="1"><label for="c2">1</label> <input
									type="radio" name="star-input03" id="c3" value="1.5"><label
									for="c3">1.5</label> <input type="radio" name="star-input03"
									id="c4" value="2"><label for="c4">2</label> <input
									type="radio" name="star-input03" id="c5" value="2.5"><label
									for="c5">2.5</label> <input type="radio" name="star-input03"
									id="c6" value="3"><label for="c6">3</label> <input
									type="radio" name="star-input03" id="c7" value="3.5"><label
									for="c7">3.5</label> <input type="radio" name="star-input03"
									id="c8" value="4"><label for="c8">4</label> <input
									type="radio" name="star-input03" id="c9" value="4.5"><label
									for="c9">4.5</label> <input type="radio" name="star-input03"
									id="c10" value="5"><label for="c10">5</label>
							</span> <output for="star-input">
									<b>0</b>점
								</output>
							</span>
						</div>
					</div>


					<div class="modal-footer">
						<div class="inputbox">
							<div class="inputs">
								<!-- 파일업로드 관련 -->
								<div class="wrapper">
									<div class="body">
										<!-- 미리보기 영역 -->
										<div id="preview" class="content"></div>
										<!-- 첨부 버튼 -->
										<div id="attach">
											<label class="btn f_insert" for="uploadInputBox">사진
												첨부하기</label> <input id="uploadInputBox" style="display: none"
												type="file" name="photos" multiple="multiple" />
										</div>

										<!-- multipart 업로드시 영역 -->
										<!-- 					            <form id="uploadForm" style="display: none;" /> -->
									</div>
									<div class="footer">
										<!-- 					            <button class="submit"><a href="#" title="등록" class="btnlink">등록</a></button> -->
									</div>
								</div>
							</div>
						</div>
						<textarea rows="20" cols="120" class="reply_content"
							name="reply_content " style="resize: none;"
							placeholder="리뷰 작성 해주세요."></textarea>
						<span style="color: #aaa;" id="counter">(0 / 최대 200자)</span>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<div id="container">
	<%
	if(oldto!=null){
		if(oldto.getOwner_id().equals(store_name.getOwner_id())){
		%>
		<div id="sticky">
			<div id="navi2">
				<div class="navis2" onclick="location.href='store.do?store_seq=${sdto.store_seq}'">
					매장 홈
				</div>
				<div class="navis2" onclick="location.href='owner_toReupdate_store.do'">
					매장정보 수정
				</div>
				<div class="navis2" onclick="location.href='owner_mystore_reserve.do?store_seq=${sdto.store_seq}'">
					예약관리
				</div>
				<div class="navis2 home" onclick="location.href='review.do?store_seq=${sdto.store_seq}'">
					리뷰관리
				</div>
				<div class="navis2" onclick="location.href='qna.do?store_seq=${sdto.store_seq}'">
					문의관리
				</div>
			</div>
		</div>
		<%	
		}
	}
	%>
	<div id="pagename">
		<b>리뷰 목록</b>
	</div> 
		<%
		if(list.size()!=0){
		%>
		<div id="main">
			<span id="main2">리뷰&nbsp;<%
				for (int i = 0; i < Math.floor(list_avg.getAll_avg()); i++) {
			%> <img src="img/star_fill.png" class="big_star"> <%
 	}
 	if (0 < Math.ceil(list_avg.getAll_avg()) - Math.floor(list_avg.getAll_avg())) {
 %> <img src="img/star_half.png" class="big_star"> <%
 	}
 	for (int i = 0; i < (5 - Math.ceil(list_avg.getAll_avg())); i++) {
 %> <img src="img/star_empty.png" class="big_star"> <%
 	}
 %> <span class="bigNumber"><%=list_avg.getAll_avg()%></span>/5 &nbsp;
				&nbsp; &nbsp;후기<%=list_avg.getReply_count()%>개|답변<%=list_avg.getAnswer_count()%>개
			</span><br> <span>최근6개월 누적평점</span>
			<%
				if (uldto == null) {
					if (oldto != null) {
			%>
			<button class="modal_Btn" value="3">리뷰 작성</button>
			<%
				} else {
			%>
			<button class="modal_Btn">리뷰 작성</button>
			<%
				}
				} else if (uldto != null) {
					if (list_reserve == null || list_reserve.size() == 0) {
			%>
			<button class="modal_Btn" value="2">리뷰 작성</button>
			<%
				} else {
			%>
			<button class="modal_Btn" value="1">리뷰 작성</button>
			<%
				}
				}
			%>
			<br />
			<br />
			<table class="main_star_table">
				<col width="50px;">
				<tr>
					<td><span>서비스</span></td>
					<td>
						<%
							for (int i = 0; i < Math.floor(list_avg.getService_avg()); i++) {
						%> <img src="img/star_fill.png" class="small_star"> <%
 	}
 	if (0 < Math.ceil(list_avg.getService_avg()) - Math.floor(list_avg.getService_avg())) {
 %> <img src="img/star_half.png" class="small_star"> <%
 	}
 	for (int i = 0; i < 5 - Math.ceil(list_avg.getService_avg()); i++) {
 %> <img src="img/star_empty.png" class="small_star"> <%
 	}
 %>
					</td>
					<td><span><%=list_avg.getService_avg()%>/5</span></td>
				</tr>
				<tr>
					<td><span>가격</span></td>
					<td>
						<%
							for (int i = 0; i < Math.floor(list_avg.getPrice_avg()); i++) {
						%> <img src="img/star_fill.png" class="small_star"> <%
 	}
 	if (0 < Math.ceil(list_avg.getPrice_avg()) - Math.floor(list_avg.getPrice_avg())) {
 %> <img src="img/star_half.png" class="small_star"> <%
 	}
 	for (int i = 0; i < 5 - Math.ceil(list_avg.getPrice_avg()); i++) {
 %> <img src="img/star_empty.png" class="small_star"> <%
 	}
 %>
					</td>
					<td><span><%=list_avg.getPrice_avg()%>/5</span></td>
				</tr>
				<tr>
					<td><span>청결도</span></td>
					<td>
						<%
							for (int i = 0; i < Math.floor(list_avg.getClean_avg()); i++) {
						%> <img src="img/star_fill.png" class="small_star"> <%
 	}
 	if (0 < Math.ceil(list_avg.getClean_avg()) - Math.floor(list_avg.getClean_avg())) {
 %> <img src="img/star_half.png" class="small_star"> <%
 	}
 	for (int i = 0; i < 5 - Math.ceil(list_avg.getClean_avg()); i++) {
 %> <img src="img/star_empty.png" class="small_star"> <%
 	}
 %>
					</td>
					<td><span><%=list_avg.getClean_avg()%>/5</span></td>
				</tr>
			</table>
		</div>
		<%
			for (ReplyDto dto : list) {
		%>
		<div class="bigtle">
			<div class="mybox">
				<img src="./img/profile_default.png" class="pf" />
				<div class="info">
					<%
						if (uldto != null) {
								if (uldto.getUser_id().equals(dto.getUser_id())) {
					%>
					<button class="buttondle onlogin"
						onclick="user_review_delete(<%=dto.getReply_seq()%>)">삭제</button>
					<button class="content_detail buttondle">자세히 보기</button>
					<br>
					<%
						} else {
					%>
					<button class="content_detail buttondle nologin">자세히 보기</button>
					<br>
					<%
						}
							} else {
					%>
					<button class="content_detail buttondle nologin">자세히 보기</button>
					<br>
					<%
						}
					%>
					<span class="user_review_name">닉네임:<%=dto.getUser_id()%>
					</span><span style="float: right; color: #919191;"><%=dto.getReply_realdate()%></span><br>
					<div class="star_table">
						<table class="star_score">
							<tr>
								<td>서비스</td>
								<td>
									<%
										for (int i = 0; i < Math.floor(dto.getReply_service()); i++) {
									%> <img class="starz" src="img/star_fill.png"> <%
 	}
 		if (0 < Math.ceil(dto.getReply_service()) - Math.floor(dto.getReply_service())) {
 %> <img class="starz" src="img/star_half.png"> <%
 	}
 		for (int i = 0; i < 5 - Math.ceil(dto.getReply_service()); i++) {
 %> <img class="starz" src="img/star_empty.png"> <%
 	}
 %>
								</td>
							</tr>
							<tr>
								<td>가격</td>
								<td>
									<%
										for (int i = 0; i < Math.floor(dto.getReply_price()); i++) {
									%> <img class="starz" src="img/star_fill.png"> <%
 	}
 		if (0 < Math.ceil(dto.getReply_price()) - Math.floor(dto.getReply_price())) {
 %> <img class="starz" src="img/star_half.png"> <%
 	}
 		for (int i = 0; i < 5 - Math.ceil(dto.getReply_price()); i++) {
 %> <img class="starz" src="img/star_empty.png"> <%
 	}
 %>
								</td>
							</tr>
							<tr>
								<td>청결도</td>
								<td>
									<%
										for (int i = 0; i < Math.floor(dto.getReply_clean()); i++) {
									%> <img class="starz" src="img/star_fill.png"> <%
 	}
 		if (0 < Math.ceil(dto.getReply_clean()) - Math.floor(dto.getReply_clean())) {
 %> <img class="starz" src="img/star_half.png"> <%
 	}
 		for (int i = 0; i < 5 - Math.ceil(dto.getReply_clean()); i++) {
 %> <img class="starz" src="img/star_empty.png"> <%
 	}
 %>
								</td>
							</tr>
						</table>
						<div class="user_avg"><%=Math.round(((dto.getReply_clean() + dto.getReply_price() + dto.getReply_service()) / 3) * 10d)
						/ 10d%></div>
					</div>
					<div class="user_review_img">
						<%
							for (int i = 0; i < list_photo.size(); i++) {
									if (dto.getReply_seq() == list_photo.get(i).getReply_seq()) {
						%>
						<%-- 						<div style="background: url('upload_rphoto/<%=list_photo.get(i).getReply_photo_stored()%>');width: 80px;height: 80px;background-size: 80px 80px;background-repeat: no-repeat;float:left;margin-left:10px;"></div> --%>
						<img class="img_cursor" onclick="javascript:popupImage(this.src)"
							src="upload_rphoto/<%=list_photo.get(i).getReply_photo_stored()%>"
							style="width: 80px; height: 80px; float: left; margin-left: 10px;">
						<%
							}
								}
						%>
					</div>
					<div class="contents">
						<span style="font-weight: bold;">리뷰내용</span><br> <span><%=dto.getReply_content()%></span>
					</div>
				</div>
				<div class="info2">
					<span style="font-weight: bold;">매장답변</span><br>
					<%
					if (dto.getReply_answer() == null || dto.getReply_answer().equals("")) {
					%>
					<span>아직 답변이 없습니다.</span>
						<%
						if(oldto!=null){
							if(oldto.getOwner_id().equals(store_name.getOwner_id())){
							%>
							<button class="ownerAnswer_btn">답변</button> 
							<%	
							}	
						}
						%>
					<%
					} else {
					%>
					<span><%=dto.getReply_answer()%></span>
					<%
						if(oldto!=null){
							if(oldto.getOwner_id().equals(store_name.getOwner_id())){
							%>
							<button class="ownerAnswer_update">답변수정</button> 
							<%	
							}
						}
					}
					%>
				</div>
				<%
				if(dto.getReply_answer() == null || dto.getReply_answer().equals("")){
				%>
				<textarea class="ownerAnswer" rows="10" cols="60"></textarea>
				<%	
				}else{
				%> 
				<textarea class="ownerAnswer" rows="10" cols="60"><%=dto.getReply_answer()%></textarea>
				<%	
				}
				%>
				<button class="ownerAnswer_success">답변완료</button>
				<button class="ownerAnswer_cancel">취소</button>
				<input type="hidden" name="reply_seq" value="<%=dto.getReply_seq()%>"/>
			</div>
		</div>
		<br>
		<br>
		<%
			}
		%>
		<div class="bigbig"></div>
		<div class="tle_final"></div>
		<%	
		}
		%>
	</div> 
</body>
</html>
<jsp:include page="../all/footer.jsp" />
