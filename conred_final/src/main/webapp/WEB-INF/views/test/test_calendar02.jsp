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
	.flatpickr-calendar{margin: 0 auto; width: 500px !important; height: 400px !important;}
	.flatpickr-rContainer{margin: 0 auto !important;}
	
	.times{width: 80px;height:34px; border: 1px solid green;float: left; margin: 10px; text-align: center;line-height: 34px; background-color: #edfbdc; border: 0;}
	.times_result{width: 250px;margin: 0 auto;border:solid #D8D8D8;border-width:1px 0 1px 0; clear: both; height: 30px;line-height: 30px;}
	.selector{display: none;}
	.times:hover{background-color: #00FF00;cursor: pointer;}
	
	
</style>    
<script>   
	var datestr; 	  
	function aaa(){   
		datestr=$(".selector").val();
		var day_result=$(".times_result").children();
		//day_result.eq(0).empty();
		day_result.eq(1).empty();
		day_result.eq(0).text(datestr+" , ");
			 
	} 
// 	function bbb(ele){
// 		$(ele).css( "backgroud-color", "yellow");
		
// 	}
	
	$(function(){
		$(".times").click(function(){
			var timeval=$(this).val();
			if(datestr==null){
				timeval=null; 
				alert("날짜먼저 선택해주세요"); 
			}else{
				$(".times_result").children("span").eq(1).text(timeval);
				$(".times").css("background-color", "#edfbdc");
				$(this).css("background-color", "#00FF00");
			}
			
		})
	}) 
</script>  
 
</head> 
<body>
<div style="width:700px;margin:0 auto">
	<div class="sungsoobox">
		<input type="text" class="selector" placeholder="날짜를 선택하세요." onchange="aaa()"/>
		<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
	</div>
	<br><br>
	<div style="border: 1px solid #A4A4A4; width: 500px; height: 250px; margin: 0 auto; border-radius: 10px;">
		<div style="margin: 0 auto; width: 400px; height: 250px;">
			<input class="times" onclick="bbb()" value="10:00" readonly="readonly">
			<input class="times" onclick="bbb()" value="11:00" readonly="readonly">
			<input class="times" onclick="bbb()" value="12:00" readonly="readonly">
			<input class="times" onclick="bbb()" value="13:00" readonly="readonly">
			<input class="times" onclick="bbb()" value="14:00" readonly="readonly">
			<input class="times" onclick="bbb()" value="15:00" readonly="readonly">
			<input class="times" onclick="bbb()" value="16:00" readonly="readonly">
			<input class="times" onclick="bbb()" value="17:00" readonly="readonly">
			<input class="times" onclick="bbb()" value="18:00" readonly="readonly">
			<input class="times" onclick="bbb()" value="19:00" readonly="readonly">
			<input class="times" onclick="bbb()" value="20:00" readonly="readonly">
			<div class="times_result">예약 시간 : <span></span>&nbsp;<span></span></div> 
		</div>
	</div>
</div>
	

<script type="text/javascript">

$(".selector").flatpickr({  
	inline: true,
 	mode: "single",
    minDate: "today",
    dateFormat: "Y-m-d"
  

});	
</script>
</body>
</html>