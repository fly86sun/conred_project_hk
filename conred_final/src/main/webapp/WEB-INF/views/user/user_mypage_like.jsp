<%@page import="com.hk.conred.dtos.LikeDto"%>
<%@page import="java.util.List"%>
<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
	#container{box-sizing:border-box; min-height:800px; border-top-width:0px; border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{z-index:200;position: sticky; top:71px;display: inline-block;}
   	#navi2{width:998px;clear:both;position:relative;top:0px;text-align: center;line-height: 50px;display: inline-block;border-bottom: 1px solid #585858;}
   	.navis2{ font-size:18px; float:left;width:200px;height:50px;color: #000;background-color: #fff;}
   	.navis2:last-child{ font-size:18px; float:left;width:198px;height:50px;color: #000;background-color: #fff;}
   	.navis2:hover{color:#000;transition:all .3s;cursor:pointer;border-bottom: 5px solid #585858;}
	.home{background-color: white;color:black;border-bottom:5px solid #585858 ;}
	
	.store_img{width: 200px;height:170px; float: left; } 
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.mybox{padding:15px;border-bottom:1px solid #BDBDBD;border-top:1px solid #BDBDBD; width:720px;height:200px; font-size: 15px; margin-left: 100px;}
	.myboxmargin{margin-top:30px;}
	.bigtle{margin-left: 50px;}
	.like_info{width: 500px; margin-left: 220px;} 
	
	
	.btn_like {
	  position: relative;
/* 	  margin: 100px auto; */
	  display: block;
	  width: 44px;
	  height: 44px; 
	  border: 1px solid #e8e8e8; 
	  border-radius: 44px;
	  font-family: notokr-bold,sans-serif;
	  font-size: 14px;
	  line-height: 16px;
	  background-color: #fff;
	  color: #DD5D54;
 	  box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);  
	  transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
	  cursor: pointer; 
	} 
	
	.btn_like:hover {
	  border: 1px solid rgba(228,89,89,0.3);
	  background-color: rgba(228,89,89,0.02);
	  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
	}
	
	.btn_unlike .img_emoti {
	    background-position: -30px -120px;
	}
	
	.img_emoti {
	    display: inline-block;
	    overflow: hidden;
	    font-size: 0;
	    line-height: 0;
	    background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
	    text-indent: -9999px;
	    vertical-align: top;
	    width: 20px;
	    height: 17px;
	    margin-top: 1px;
	    background-position: 0px -120px;
	    text-indent: 0;
	}
	
	.btn_like .ani_heart_m {
	    margin: -63px 0 0 -63px;
	}
	
	.ani_heart_m {
	    display: block;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 125px;
	    height: 125px;
	    margin: -63px 0 0 -63px;
	    pointer-events: none;
	}
	
	.ani_heart_m.hi {
	    background-image: url(img/zzim_on_m.png);
	    -webkit-background-size: 9000px 125px;
	    background-size: 9000px 125px;
	    animation: on_m 1.06s steps(72);
	    border-width: 0px;
	}
	
	.ani_heart_m.bye {
	    background-image: url(img/zzim_off_m.png);
	    -webkit-background-size: 8250px 125px;
	    background-size: 8250px 125px;
	    animation: off_m 1.06s steps(66);
	}
	.ani_heart_m.bye:active {border-width: 0px;}
	.ani_heart_m.bye::focus { outline:none; }
	.ani_heart_m.bye:hover {border-width: 0px;}

	.ani_heart_m.hi:focus { outline:none; }
	.ani_heart_m.hi:active {border-width: 0px;}
	.ani_heart_m.hi:hover {border-width: 0px;}
	
	@keyframes on_m {
	  from { background-position: 0 }
	  to { background-position: -9000px }
	}
	
	@keyframes off_m {
	  from { background-position: 0 }
	  to { background-position: -8250px }
	}
	.btn_like:focus { outline:none; }
	
	.store_title{text-align: center;}
	
	
</style>
<script type="text/javascript">
	 
	//무한스크롤	
	var count = 1;
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	    //추가되는 임시 콘텐츠
	    //window height + window scrollY 값이 document height보다 클 경우,
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
	    	//실행할 로직 (콘텐츠 추가)  
	        count++; 
	        var addContent="";
	        ////////////////////////////////// A JAX
	        $.ajax({
			url:"user_like_ajax.do",
			method:"post",
			data:{"pnum":count},
			dataType:"json", 
			success:function(obj){				
				var lists=obj.list; 
				var lists_photo=obj.list_store_img;
					if(lists_photo==""&&lists_photo==undefined){
					$.each(lists, function(i){    		
						addContent += 		'<div class="bigtle">'
											+	'<div class="mybox">'
											+	'<div class="store_img">' 
											 +		'<p class="store_title"><b>asd'+ lists[i].store_name +'</b></p> '
											 +	'</div>'
											 +	'<div class="like_info">'
											 +		'<span>주소 : '+ lists[i].store_address +'  </span><br><br>'
											 +		'<span>'+ lists[i].store_intro_simple +' </span><br><br>'
											 	+'</div> '	   
										 +		'<div style="margin-left: 630px; margin-top: 40px;">'
											+ 		'<button type="button" class="btn_like btn_unlike ajaxlike">'
													+	'<span class="img_emoti">좋아요</span>'
													+	'<span class="ani_heart_m"></span>  '	
											+        '</button>'
											+'<input type="hidden" name="like_list_seq" value="'+ lists[i].like_list_seq +'"/>'
											+       '</div>'
										 	+	'</div> '
										 	+  '</div>' 
											+'<br><br> ';
							}); 
							 $('.bigbig').append(addContent);
		 
							}else{ 
								$.each(lists, function(i){    		
									addContent += '<div class="bigtle">'
											+	'<div class="mybox">'
											+	'<div class="store_img">'  
											 +		''+storeImg(lists[i].like_list_seq)+''
											 +		'<p class="store_title"><b>'+ lists[i].store_name +'</b></p> '
											 +	'</div>'
											 +	'<div class="like_info">'
											 +		'<span>주소 : '+ lists[i].store_address +'  </span><br><br>'
											 +		'<span>'+ lists[i].store_intro_simple +' </span><br><br>'
											 	+'</div> '	   
										 +		'<div style="margin-left: 630px; margin-top: 40px;">'
											+ 		'<button type="button" class="btn_like btn_unlike ajaxlike">'
													+	'<span class="img_emoti">좋아요</span>'
													+	'<span class="ani_heart_m"></span>  '	
											+        '</button>'
											+'<input type="hidden" name="like_list_seq" value="'+ lists[i].like_list_seq +'"/>'
											+       '</div>'
										 	+	'</div> '
										 	+  '</div>'
											+'<br><br> ';
									}); 
									 $('.bigbig').append(addContent);
									 
									 
									 
				}
				
				 
				  
			}
			});
		
	        }
	  	
	    	
		};
		
// 		function unLike(like_list_seq){
// 			var result=confirm("좋아요를 취소하시겠습니까?");
// 			alert($(this).val());
// 			if(result){
// 			    $(this).removeClass('btn_unlike');
// 			    $(this).parent().find('.ani_heart_m').removeClass('hi');
// 			    $(this).parent().find('.ani_heart_m').addClass('bye');
// 			    var seq=$(this).parent().find("input[name=like_list_seq]").val();
// 			    location.href="user_like_delete.do?like_list_seq="+seq;
// 			}else{
				
// 			}
// 		}
		
	$(function(){		 
		//찜버튼  원래꺼
		$('.btn_first').click(function(){ 
			

// 				var result=confirm("좋아요를 취소하시겠습니까?");
// 				if(result){ 
// 					  if($(this).hasClass('btn_first')){ 
// 					    $(this).removeClass('btn_unlike');  
// 					    $(this).parent().find('.ani_heart_m').removeClass('hi');
// 					    $(this).parent().find('.ani_heart_m').addClass('bye');
// 					    var seq=$(this).parent().find("input[name=like_list_seq]").val();
// 					    location.href="user_like_delete.do?like_list_seq="+seq;
// 					  }			 			
// 				}else{
					 
// 				}
			
			swal({
			     title: "좋아요를 취소하시겠습니까?",
			     text: "",
			     icon: "warning", //"info,success,warning,error" 중 택1
			     buttons: ["아니오", "예"],
			}).then((YES) => {
			     if (YES) {
			    	 if($(this).hasClass('btn_first')){ 
 					    $(this).removeClass('btn_unlike');  
 					    $(this).parent().find('.ani_heart_m').removeClass('hi');
 					    $(this).parent().find('.ani_heart_m').addClass('bye');
 					    var seq=$(this).parent().find("input[name=like_list_seq]").val();
 					    location.href="user_like_delete.do?like_list_seq="+seq;
 					  }
			     }else{
			     	
			     }
			});
			

		});//찜버튼
		
		//AJAX쪽 찜버튼
		$("body").on('click','.ajaxlike',function(){
			 var seq=$(this).parent().find("input[name=like_list_seq]").val();
			 
// 			var result=confirm("좋아요를 취소하시겠습니까?");
// 			if(result){ 
// 				  if($(this).hasClass('ajaxlike')){ 
// 				    $(this).removeClass('btn_unlike');
// 				    $(this).parent().find('.ani_heart_m').removeClass('hi');
// 				    $(this).parent().find('.ani_heart_m').addClass('bye');
// 				    var seq=$(this).parent().find("input[name=like_list_seq]").val();
// 				    location.href="user_like_delete.do?like_list_seq="+seq;
// 				  }			 			
// 			}else{  
				
// 			}
		
			 swal({
			     title: "좋아요를 취소하시겠습니까?",
			     text: "",
			     icon: "warning", //"info,success,warning,error" 중 택1
			     buttons: ["아니오", "예"],
			}).then((YES) => {
			     if (YES) {
			    	 if($(this).hasClass('ajaxlike')){ 
	 				    $(this).removeClass('btn_unlike');
	 				    $(this).parent().find('.ani_heart_m').removeClass('hi');
	 				    $(this).parent().find('.ani_heart_m').addClass('bye');
	 				    var seq=$(this).parent().find("input[name=like_list_seq]").val();
	 				    location.href="user_like_delete.do?like_list_seq="+seq;
	 				  }	
			     }else{
			     	
			     }
			});



			
		});//좋아요버튼
		
		
		
		
		
	});//onload
	
	
	
	
	
	
	//가게이미지 
	function storeImg(like_seq){	
		var v=""; 
		var list_photo_length=$("input[name=list_photo_length]").val(); 
			for(var i=0;i<list_photo_length;i++){
				if(like_seq==$("input[name=slike_seq"+i+"]").val()){ 
					v='<img src="upload_sphoto/'+$("input[name=store_photo_stored"+i+"]").val()+'" style="width: 200px;height: 155px;float: left;">';
					return v;
				}	 				    
			}   
	}  
	
		 
	
</script>
</head>
<% 
	List<LikeDto> list=(List<LikeDto>)request.getAttribute("list");
	List<LikeDto> list_store_img=(List<LikeDto>)request.getAttribute("list_store_img");
%>
<body>
<input type="hidden" name="list_photo_length" value="<%=list_store_img.size()%>">
<%
	for(int i=0;i<list_store_img.size();i++){
	%>
	<input type="hidden" name="slike_seq<%=i%>" value="<%=list_store_img.get(i).getLike_list_seq()%>">
	<input type="hidden" name="store_photo_stored<%=i%>" value="<%=list_store_img.get(i).getStore_photo_stored()%>">
	<%
	}
%>
<div id="container">
	<div id="sticky">
		<div id="navi2">
			<div class="navis2" onclick="location.href='user_mypage.do'">
				마이페이지
			</div>
			<div class="navis2 home" onclick="location.href='user_mypage_like.do'">
				좋아요
			</div>
			<div class="navis2" onclick="location.href='user_mypage_reserve.do'">
				내 예약
			</div>
			<div class="navis2" onclick="location.href='user_mypage_review.do'">
				내 리뷰
			</div>
			<div class="navis2" onclick="location.href='user_mypage_qna.do'">
				내 문의
			</div>
		</div>
	</div>
	<div id="pagename">
		<b>찜 목록</b>
	</div> 
	<%
		for(LikeDto dto: list){
	%>
		<div class="bigtle">
			<div class="mybox">
				<div class="store_img"> 
					<%
					for(int i=0;i<list_store_img.size();i++){
						if(dto.getLike_list_seq()==list_store_img.get(i).getLike_list_seq()){
						%>						
							<img src="upload_sphoto/<%=list_store_img.get(i).getStore_photo_stored()%>" style="width: 200px;height: 155px;float: left;">
						<%
						}						 
					} 
					%>
			 		<p class="store_title"><b><%=dto.getStore_name()%></b></p> 
			 	</div> 
			 	<div class="like_info">
			 		<span>주소 : <%=dto.getStore_address()%>  </span><br><br>
			 		<span> <%=dto.getStore_intro_simple()%> </span><br><br>
		 		</div>
		 		<div style="margin-left: 630px; margin-top: 40px;">
			 		<button type="button" class="btn_like btn_unlike btn_first" >
						<span class="img_emoti">좋아요</span>
						<span class="ani_heart_m"></span>  
					</button>
					<input type="hidden" name="like_list_seq" value="<%=dto.getLike_list_seq()%>"/>
		 		</div> 
		 	</div> 	     
		</div>  
		<br><br>  
	<%
		}
	%>   
	<div class="bigbig">
		
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 