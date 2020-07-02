<%@page import="com.hk.conred.dtos.UDto"%>
<jsp:include page="../all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	#container{border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; width:1000px;margin: 0 auto; }/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#bigtle{margin-left: 97px; }
	.tle{width: 800px; height: 200px;}
	.cate{float: left;width: 150px;height: 150px; margin-top: 24px;margin-left: 88px;border-radius: 40px;text-align: center;}
	.cate:hover{box-shadow: 0px 0.5px 3px grey;}
	#category_icon_a{background: url("img/icon/icon_A.png");width: 130px; height: 130px; border-radius: 40px; background-size: 130px;}
	#category_icon_b{background: url("img/icon/icon_B.png");width: 130px; height: 130px; border-radius: 40px; background-size: 130px;}
	#category_icon_c{background: url("img/icon/icon_C.png");width: 130px; height: 130px; border-radius: 40px; background-size: 130px;}
	#category_icon_d{background: url("img/icon/icon_D.png");width: 130px; height: 130px; border-radius: 40px; background-size: 130px;}
	#category_icon_e{background: url("img/icon/icon_E.png");width: 130px; height: 130px; border-radius: 40px; background-size: 130px;}
	#category_icon_f{background: url("img/icon/icon_F.png");width: 130px; height: 130px; border-radius: 40px; background-size: 130px;}
	#category_icon_g{background: url("img/icon/icon_G.png");width: 130px; height: 130px; border-radius: 40px; background-size: 130px;}
	#category_icon_h{background: url("img/icon/icon_H.png");width: 130px; height: 130px; border-radius: 40px; background-size: 130px;}
	#category_icon_i{background: url("img/icon/icon_I.png");width: 130px; height: 130px; border-radius: 40px; background-size: 130px;}
	#m{clear: both;}
	#hd{margin-left: 270px; }
	#bt input{width: 100px; height:60px; margin-left: 450px; font-size: 20px; font-weight: bold;border-radius: 10xp; margin-bottom: 100px;border-radius: 10px;border: 0px;}
	#bt input:hover{box-shadow: 0px 0.5px 3px grey;}
	input[type="checkbox"] {display: none;} 
	.dd{margin-left: 8px;}
	.dd:hover{cursor: pointer;} 
	
	.to_grey{-webkit-filter: grayscale(100%);filter: gray;}
	.to_color{-webkit-filter: grayscale(0%);filter: none;}
	 
</style>
<script type="text/javascript">   
	window.onload= function () {
		var form=document.getElementsByTagName("form")[0];
		form.onsubmit=function(){
			var chks=document.querySelectorAll("input[name=category_code]");
			var count= 0;
			for (var i = 0; i < chks.length; i++) {
				if(chks[i].getAttribute("checked")=="checked"){
					count++;
				}
			}
			if(count>3){
				swal("최대 3개 까지만 선택해 주세요", "", "error");
				return false;
			}else if(count==0){
				swal("최소 한개이상 선택해 주세요", "", "error");
				return false;
			}
		}
	}
	 
	$(function(){
		var cate=$(".dd");
		cate.click(function(){ 	
			if($(this).prev().prop("checked")==true){
				$(this).prev().attr("checked", false);
				$(this).removeClass("to_color"); 
				$(this).addClass("to_grey");	
				if($(".to_grey").length==9){
					$(".dd").removeClass("to_grey");
					$(".dd").removeClass("to_color");
				}
			}else{
				$(this).prev().attr("checked", "checked");
				if(!$(".dd").hasClass("to_color")){
					$(".dd").addClass("to_grey");	
				}
				$(this).removeClass("to_grey"); 
				$(this).addClass("to_color"); 
			}		 
		});
	});
			 
	
	 
</script>
</head>
<%
	
%>
<body>
<div id="container">
		<h1 id="hd">관심있는 매장을 선택해주세요!</h1><span style="margin-left: 450px;margin-bottom: 40px;">(최소1개~최대3개)</span>
	<form action="user_regist_category.do" method="post" >
		<div id="bigtle">
			<div class="bigtle tle">
<!-- 				동물병원 -->
				<div id="d1" class="cate">
					<input type="checkbox" value="A" class="ct" name="category_code" id="c1"/>
					<div class="dd" id="category_icon_a"> </div>
					<span>동물병원</span>
				</div>
<!-- 				카페/식당 -->
				<div id="d2" class="cate">
					<input type="checkbox" value="B" class="ct" name="category_code" id="c2"/>
					<div class="dd" id="category_icon_b"> </div>
					<span>카페/식당</span>
				</div>
<!-- 				식품/용품 -->
				<div id="d3" class="cate">
					<input type="checkbox" value="C" class="ct" name="category_code" id="c3"/>
					<div class="dd" id="category_icon_c"> </div>
					<span>식품/용품</span>
				</div>
			</div>
			<div class="bigtle tle">
<!-- 				숙박 -->
				<div id="d4" class="cate">
					<input type="checkbox" value="D" class="ct" name="category_code" id="c4"/>
					<div class="dd" id="category_icon_d"> </div>
					<span>숙박</span>
				</div>
<!-- 				돌봄서비스 -->
				<div id="d5" class="cate">
					<input type="checkbox" value="E" class="ct" name="category_code" id="c5"/>
					<div class="dd" id="category_icon_e"> </div>
					<span>돌봄서비스</span>
				</div>
<!-- 					미용/목욕 -->
				<div id="d6" class="cate">
					<input type="checkbox" value="F" class="ct" name="category_code" id="c6"/>
					<div class="dd" id="category_icon_f"> </div>
					<span>미용/목욕</span>
				</div>
			</div>
			<div class="bigtle tle">
	<!-- 					체험 -->
				<div id="d7" class="cate">
					<input type="checkbox" value="G" class="ct" name="category_code" id="c7"/>
					<div class="dd" id="category_icon_g"> </div>
					<span>체험</span>
				</div>
	<!-- 					분양/교배 -->
				<div id="d8" class="cate">
					<input type="checkbox" value="H" class="ct" name="category_code" id="c8"/>
					<div class="dd" id="category_icon_h"> </div>
					<span>분양/교배</span>
				</div>
	<!-- 				장례 -->
				<div id="d9" class="cate">
					<input type="checkbox" value="I" class="ct" name="category_code" id="c9"/>
					<div class="dd" id="category_icon_i"> </div>
					<span>장례</span>
				</div>
			</div>
		</div>
		<div id="bt"> 
			<input type="submit" value="선택완료"/>  
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />