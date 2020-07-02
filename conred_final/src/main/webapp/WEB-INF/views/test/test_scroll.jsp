<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="js/jquery-3.4.1.js"></script>
<style type="text/css">
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
/* 	#sticky{position: sticky; top:71px;} */
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:800px;height:300px; margin:0 auto; font-size: 15px;}
	.myboxmargin{margin-top:30px;}
	#main{width: 850px;height: 250px;margin: 0 auto; padding-top: 25px;} 
	#main2{font-size: 20px;}  
	#main2{} 
	.pf{float: left; width: 40px;height: 40px;}     
	.dt{margin-left: 600px;}
	.info{}   
	.contents{display:inline-block; width: 750px;height:40px;text-overflow: ellipsis; overflow: hidden;}     
	.info2{background-color: #F2F2F2; margin-top: 50px; height: 100px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 770px;}
	.bot{margin: 0 auto; text-align: center;}
</style>
<script type="text/javascript">	  
	//Javascript
	var count = 0;
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	    //추가되는 임시 콘텐츠
	    //window height + window scrollY 값이 document height보다 클 경우,
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	//실행할 로직 (콘텐츠 추가) 
	        count++;
	        var addContent = ' <div class="mybox">  '       
	    		+'<img src="./img/profile_default.png" class="pf"/>'
	    			+' <div class="info"> '
	    			+	'<span>★★★★★</span><a style="margin-left: 560px;" id="md" onclick="mdTest()">자세히 보기</a> '
	    			+	'<span>닉네임:?? &nbsp;| 미용 / 컷트 </span><br><br><br>   '
	    			+	'<span class="contents">asdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjdddddddddddddddddddd'
	    			+	'ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj</span>  ' 
	    		+	'</div>'
	    		+	'<div class="info2"> '   
	    			+'	<span style="font-weight: bold;">가게답변</span><br>'
	    			+	'<span>dddddddddddddddddddddddddddddddddd</span>'
	    		+	'</div>'
	    		+'</div> '     
	    		+'<br><br>';
	        //container에 추가되는 콘텐츠를 append
	        for (var i = 0; i < 3; i++) {
		        $('#container').append(addContent);				
			}
	    }
	};
 
</script> 
</head>
<body>
<div id="container"> 
	<div id="main">
		<span id="main2">리뷰 ★★★★★ &nbsp;<b style="font-size: 25px;">4.7</b>/5 &nbsp; &nbsp; &nbsp;후기2343개|답변2033개</span><br/><br/>
		<span>최근6개월 누적평점</span>
		<table>
			<col width="50px;"> 
			<tr> 
				<td><span>서비스</span></td>
				<td>★★★★☆ 4.5<span>/5</span></td>
			</tr>
			<tr>
				<td><span>가격</span></td>
				<td>★★★★☆ 4.5<span>/5</span></td>
			</tr>
			<tr>
				<td><span>청결도</span></td>
				<td>★★★★☆ 4.5<span>/5</span></td>
			</tr>
		</table>  
	</div> 
    <div class="mybox">         
		<img src="./img/profile_default.png" class="pf"/>
		<div class="info">
			<span>★★★★★</span><a style="margin-left: 560px;" id="md" onclick="mdTest()">자세히 보기</a> 
			<span>닉네임:?? &nbsp;| 미용 / 컷트 </span><br><br><br>   
			<span class="contents">asdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjdddddddddddddddddddd
			ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj</span>   
		</div>
		<div class="info2">    
			<span style="font-weight: bold;">가게답변</span><br>
			<span>dddddddddddddddddddddddddddddddddd</span>
		</div>
	</div>      
	<br><br>
	<div class="mybox">         
		<img src="./img/profile_default.png" class="pf"/>
		<div class="info">
			<span>★★★★★</span><a style="margin-left: 560px;" id="md" onclick="mdTest()">자세히 보기</a> 
			<span>닉네임:?? &nbsp;| 미용 / 컷트 </span><br><br><br>   
			<span class="contents">asdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjdddddddddddddddddddd
			ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj</span>   
		</div>
		<div class="info2">    
			<span style="font-weight: bold;">가게답변</span><br>
			<span>dddddddddddddddddddddddddddddddddd</span>
		</div>
	</div>      
	<br><br>
    <div class="block">
        
    </div>
    <!-- 반복 -->
</div> 
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 