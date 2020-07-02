<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style type="text/css">
/* 	.selector{display: none;} */
	.flatpickr-calendar{margin: 0 auto; width: 600px !important; height: 400px !important;}
	.flatpickr-rContainer{margin: 0 auto !important;}
	.day_result_box{width: 250px;margin: 0 auto;border:solid #D8D8D8;border-width:1px 0 1px 0;  height: 30px;line-height: 30px; margin-top: 30px;}
	.selector{display: none;}
	
</style>   
<script> 
	  
	 $(function(){
		$("body").on("click",".dayContainer",function(){
// 			alert($(this).text()); 
		}); 
	 });
	 
	function aaa(){
		var datestr=$(".selector").val();
		var dates=datestr.split("to");
		var startDay=new Date(dates[0]);
		var endDay=new Date(dates[1]);
// 		alert(((endDay.getTime()-startDay.getTime())/(1000*60*60*24)));       //  1초---> 1000ms
		var resultDay=Math.ceil((endDay.getTime()-startDay.getTime())/(1000*60*60*24));
		
		$(".day_result_box").children("span").text(datestr);
		
		if(resultDay>4){
			alert("5일을 넘길수 없습니다."); 
			$(".selector").val("");
			$(".flatpickr-day").removeClass("selected startRange endRange inRange");
			$(".day_result_box").children("span").empty();
		}
	}
	
</script>
 
</head> 
<body>
	<input type="text" class="selector" placeholder="날짜를 선택하세요." onchange="aaa()"/>
	
	<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
	<div class="day_result_box">예약 날짜 : <span></span></div>
<!-- 	<button onclick="aaa()">결정</button> -->
<script type="text/javascript">

$(".selector").flatpickr({  
	inline: true,
 	mode: "range",
    minDate: "today",
    dateFormat: "Y-m-d"
  

});	
</script>
</body>
</html>