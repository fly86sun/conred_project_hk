<jsp:include page="WEB-INF/views/all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<style type="text/css">
	@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face { font-family: 'NEXON Lv1 Gothic OTF Light'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face { font-family: 'NEXON Lv1 Gothic OTF'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff'); font-weight: normal; font-style: normal; }
	#container{background-color:#fff;border-top-width:0px; border-bottom-width:1px; width:1000px;margin: 0 auto;min-height:780px;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#message1{width:500px;text-align: center; margin:0 auto;padding-top:70px;font-size:22px;}
	#message2{width:500px;text-align: center; margin:0 auto;padding-top:50px;font-size:22px;}
	#message3{width:500px;text-align: center; margin:0 auto;padding-top:50px;font-size:22px;}
	#footprint1{width:30px;padding-left: 5px;padding-bottom: 8px;}

	#search{width:550px;margin:0 auto;padding-top:60px;padding-bottom: 10px;}
	#searchbar{width:500px;}
	#magnifyglass{width:20px;}
	
	#category{padding-top:50px; height:auto;width:100%;position:relative;}
	.categorybox{overflow:auto; margin:0 auto; width:665px;padding-bottom: 50px;overflow-y: hidden;}
	.categorybox:last-child{overflow:auto; margin:0 auto; width:665px;padding-bottom: 40px;padding-top: 40px;overflow-y: hidden;}
	.categories{border-radius: 10px; width:60px; height:60px;position:relative;top:4px;float: left;margin-left:60px;/* border:0.5px solid #E6E6E6; */}
	.categories:hover{cursor:pointer;box-shadow: 0px 2px 3px grey;transition:all .1s;} 
/* 	.categories:hover{cursor:pointer;box-shadow: 0px 1px 3px grey;transition:all .1s;}  */
	.categories_invisible{border-radius: 10px; width:60px; height:60px;position:relative;top:4px;float: left;margin-left:60px;}
	.categories_last{width:60px; height:60px;position:relative;top:4px;float: left;margin-left:60px;}
	.categories_last:hover{cursor:pointer;box-shadow: 0px 2px 3px grey;border-radius: 10px; transition:all .1s;}
	.allbtn{background-color: #ADEEF2;}
	.alltext{padding-top:13px;padding-left: 16px;font-size:23px;color: #fff;}
	#mylocation{width:60px;padding :2px;}
	.mylocationtext{font-size:14px; padding-left:5px;padding-top:10px;display:inline-block}
	.catetext{font-size:12px;padding-left:4px;padding-top:65px;display:inline-block;}
	.catetext_first{font-size:12px;padding-left:4px;padding-top:20px;display:inline-block;}
	
	#slidebar{margin-bottom:20px; height:auto;width:100%;position:relative;}
	.slidetitle{padding-top:30px;width:550px;margin-left:220px;font-size:18px; }
	.slidebars{width:550px; margin-left:220px;margin-top:50px; height:200px;position:relative;}


	#category_icon_a{background: url("img/icon/icon_A.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_b{background: url("img/icon/icon_B.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_c{background: url("img/icon/icon_C.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_d{background: url("img/icon/icon_D.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_e{background: url("img/icon/icon_E.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_f{background: url("img/icon/icon_F.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_g{background: url("img/icon/icon_G.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_h{background: url("img/icon/icon_H.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_i{background: url("img/icon/icon_I.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 
/*
	#category_icon_a{background: url("img/icon/icon_A.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_b{background: url("img/icon/icon_B.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_c{background: url("img/icon/icon_C.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_d{background: url("img/icon/icon_D.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_e{background: url("img/icon/icon_E.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_f{background: url("img/icon/icon_F.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_g{background: url("img/icon/icon_G.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_h{background: url("img/icon/icon_H.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_i{background: url("img/icon/icon_I.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
*/

	html, body {
      position: relative; 
      height: 100%;
    }
    body {
/*       background: #eee; */
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 100%;
      height: 100%;
     
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
/*       display: -webkit-box; */
/*       display: -ms-flexbox; */
/*       display: -webkit-flex-wrap; */
/*       display: flex-wrap; */
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
      
    }
  	
  	.swiper-slide>h4{
  		margin: 0px;
  		font-size: 10pt;
  	}
  	
  	.swiper-pagination{
  		top:135px;
  	}

	.phototext{
		margin-top:10px;
		display: inline-block;
	}
	:root {
    --swiper-theme-color: #000!important;
	}
</style>
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%
	int count=(Integer)session.getAttribute("count");
%>
<script type="text/javascript">

$( function() {
    var availableTags = [//박스안에 글자가 하나 입력될 때 마다 >>아작스를 실행>>해당 글자가 앞에 포함 되는지여부를 통해 알파벳순으로 orderby로데이터를가져옴>>10개씩끊어서가져온다>>10개의 데이터를 이 안에 넣으면 그 데이터들로 자동완성기능이 실행. 
//       "ActionScript",

//       "acathexis",
//       "acathisia",
//       "acaudal",
//       "acaulescent",
//       "acauline",
//       "acausal",
//       "acausality",
//       "acc",
//       "acc.",
//       "acca",
//       "accad",
//       "accademia",
//       "accadian",
//       "accardo",
//       "accc",
//       "AppleScript",
//       "Asp",
//       "BASIC",
//       "C",
//       "C++",
//       "Clojure",
//       "COBOL",
//       "ColdFusion",
//       "Erlang",
//       "Fortran",
//       "Groovy",
//       "Haskell",
//       "Java",
//       "JavaScript",
//       "Lisp",
//       "Perl",
//       "PHP",
//       "Python",
//       "Ruby",
//       "Scala",
//       "Scheme"
    ];
    $( "#searchbar" ).autocomplete({
      source: availableTags
    });
    
    
    $("")
});


$(function(){
	$(".interestSearch").click(function(){         
 		
		var paging=~~(Math.random()*<%=count%>+1);
									
 		$.ajax({
	 		url:"user_interests_recommended.do",  //요청URL
	 		data:{"paging":paging}, //서버쪽으로 보낼 데이터
	 		dataType:"json",          //서버에서 받게 될 데이터 타입 정의
	 		method:"post",      //전송방식 정의
	 		async:false,
	 		success:function(obj){//서버통신에 성공했다면 기능실행(obj는 전달된 데이터 받기)
	 			//주요코드작성      // {list:[sdto,sdto...]}    obj.list[0].store_name
// 	 				alert(obj.list[0].store_name);//obj{"dto":{seq:3,id:hk,content:"내용"}}
	 				var storeList="";
	 				
	 				for(var i=0;i<obj.list.length;i++){
		 				storeList+='<div class="swiper-slide">' 
							+'<a href="#">'
							+'<img src="./upload_sphoto/'+obj.list[i].spDto.store_photo_stored+'"'
							+'	style="width: 163px; height: 77%;"/>'
							+'</a>'
							+'<h4>'
							+	'<a href="#">'+obj.list[i].store_name+'</a>'
							+'</h4>'
						    +'</div>';
		 				 
	 				}
	 			console.log(storeList);
	 			
					$(".swiper-wrapper").html(storeList);//점포 목록만든거 화면에 반영하기
					swiperObj();//새로운 이미지로 교체--> 다시 셋팅해주기 slide효과
	 			
	 		},
	 		error:function(){
	 				alert("로그인을 해주세요.");
	 		}
  		});
 	});
	
	swiperObj();//실행하기
});

//slide효과주는 객체
function swiperObj(){
	var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 3,
	      spaceBetween: 30,
	      slidesPerGroup: 3,
	      loop: true,
	      loopFillGroupWithBlank: true,
	      autoplay: {
	          delay: 3500,
	          disableOnInteraction: false,
	        },
	      
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	    });
}


</script>

</head>
<body>

<!-- <div style="position:absolute;left:0px;top:0px;"> -->
<!-- <h1><a href="login.do">로그인</a></h1> -->
<!-- <h1><a href="home.do">테스트</a></h1> -->
<!-- <h1><a href="sungsu.do">성수입장</a></h1> -->
<!-- <h1><a href="yoonho.do">윤호입장</a></h1> -->
<!-- <h1><a href="haekang.do">해강입장</a></h1> -->
<!-- <h1><a href="GetCorpState1.do">사업자테스트01</a></h1> -->
<!-- <h1><a href="GetCorpState.do">사업자테스트</a></h1> -->
<!-- <h1><a href="GetCorpStates.do">대량사업자테스트</a></h1> -->
<!-- <h1><a href="GetDailyBankAccountLog.do">입출금조회테스트</a></h1> -->
<!-- <h1><a href="GetBankAccount.do">계좌조회테스트</a></h1> -->
<!-- </div> -->

<div id="container">
	<div id="message1">더 넓은 세상을 선물하세요<img id="footprint1" src="./img/footprint1.png"></div>
	
	<form id="search" action="map_keyword.do">
<!-- 	  <input type="text" id="searchbar" class="form-control pull-left" name="keyword" placeholder="지역명, 지하철역, 매장명으로 검색" required/> -->
	  <input type="text" id="searchbar" class="form-control pull-left" name="keyword" placeholder="지역명, 지하철역, 매장명으로 검색" required/>
	  <button type="submit" id="searchbtn" class="btn"><img id="magnifyglass" src="./img/magnifyglass.png"></button>
	</form>
	
	<div id="message2">카테고리별로 검색하세요<img id="footprint1" src="./img/footprint1.png"></div>
	
	<div id="category">
		<div class="categorybox">
			<div class="categories allbtn" onclick="location.href='map_category.do?category_code=all'"><div class="alltext">all</div><span class="catetext_first">&emsp;전체</span></div>
			<div class="categories" id="category_icon_a" onclick="location.href='map_category.do?category_code=A'"><span class="catetext">동물병원</span></div>
			<div class="categories" id="category_icon_b" onclick="location.href='map_category.do?category_code=B'"><span class="catetext">카페/식당</span></div>
			<div class="categories" id="category_icon_c" onclick="location.href='map_category.do?category_code=C'"><span class="catetext">식품/용품</span></div>
			<div class="categories" id="category_icon_d" onclick="location.href='map_category.do?category_code=D'"><span class="catetext">동반숙박</span></div>
		</div>
		<div class="categorybox">
			<div class="categories" id="category_icon_e" onclick="location.href='map_category.do?category_code=E'"><span class="catetext" style="font-size: 10.5px;padding-left:2px">돌봄서비스</span></div>
			<div class="categories" id="category_icon_f" onclick="location.href='map_category.do?category_code=F'"><span class="catetext">미용/목욕</span></div>
			<div class="categories" id="category_icon_g" onclick="location.href='map_category.do?category_code=G'"><span class="catetext">체험/활동</span></div>
			<div class="categories" id="category_icon_h" onclick="location.href='map_category.do?category_code=H'"><span class="catetext">분양/교배</span></div>
			<div class="categories" id="category_icon_i" onclick="location.href='map_category.do?category_code=I'"><span class="catetext">&emsp;장례</span></div>
		</div>
		<div class="categorybox">
			<div class="categories_invisible"></div>
			<div class="categories_invisible"></div>
			<div class="categories_last">
				<img id="mylocation" src="./img/icon/mylocation2.png" onclick="location.href='map_category.do?category_code=loca'"/>
				<span class="mylocationtext">내 주변</span>
			</div>
			<div class="categories_invisible"></div>
			<div class="categories_invisible"></div>
		</div>
	</div>
	
						<c:choose>
							<c:when test="${empty sessionScope.list}">
											
							</c:when>
					
							<c:otherwise>
	<!--  관심사 추천 기능 부분  -->
			<div class="slidebarbox" style="overflow: auto;margin-bottom:40px;">
		<div id="slidebar">
<!-- 			<div class="slidetitle"> -->
<!-- 				<div class="slidetitle"style="border: 1px solid white; border-top-color: lightgrey; border-top-width: 1px; padding-top: 8px;"> -->
					<div id="message3">
					이런 매장은 어때요?<img id="footprint1" src="./img/footprint1.png">
					</div>
<!-- 				</div> -->
				<div class="slidebars">
<%-- 					<form action="user_interests_recommended.do" method="post"> --%>
					<div class="slider multiple-items autoplay">
								<div class="slider multiple-items autoplay"
									style="width: 550px; height: 170px;">
									<!-- Swiper -->
									<div class="swiper-container">
										<div class="swiper-wrapper">
											<c:forEach items="${sessionScope.list}" var="dto">
												<c:if test="${dto.store_state!='X'}">
													<div class="swiper-slide"style="width: 180px!important ;"> 
														<a href="#">
														<img src="./upload_sphoto/${dto.spDto.store_photo_stored}"
															style="width: 180px; height: 120px;" onclick="location.href='store.do?store_seq=${dto.store_seq}'"/>
														</a>
	<!-- 													<h4> -->
															<span class="phototext">${dto.store_name}</span>
	<!-- 													</h4> -->
													</div>
												</c:if>
											</c:forEach>
										</div>	
										<!-- Add Pagination -->
										<div class="swiper-pagination" style="padding-top: 20px;"></div>
										<!-- Add Arrows -->
									</div>
										<div class="swiper-button-next" style="color:#000;background-color: rgb(255,255,255,0.5);padding:5px;right: -70px; top: 60px;"></div>
										<div class="swiper-button-prev" style="color:#000;background-color: rgb(255,255,255,0.5);padding:5px;left: -70px; top: 60px;"></div>
								</div>
 					</div>
<!-- 					<span style="cursor: pointer; margin-left: 500px;" class="interestSearch">더보기</span> -->
			     </div>			
		    </div>			
		    	</div>						
							</c:otherwise>
						</c:choose>
<!-- 		<div class="slidebarbox"> -->
<!-- 			<div class="slidetitle">동물병원 랭킹~</div> -->
<!-- 			<div class="slidebars"> -->
<!-- 			이안에매장들 -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="slidebarbox"> -->
<!-- 			<div class="slidetitle">신난ㄷ나</div> -->
<!-- 			<div class="slidebars"> -->
<!-- 			이안에매장들 -->
<!-- 			</div> -->
<!-- 		</div> -->


</div>



</body>
</html>
<jsp:include page="WEB-INF/views/all/footer.jsp" />