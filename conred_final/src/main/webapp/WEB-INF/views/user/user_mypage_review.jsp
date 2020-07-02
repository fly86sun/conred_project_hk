<%@page import="java.awt.event.FocusAdapter"%>
<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="com.hk.conred.dtos.RPhotoDto"%>
<%@page import="com.hk.conred.dtos.ReplyDto"%>
<%@page import="java.util.List"%>
<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
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
<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
// 	        var star_service;
	        ////////////////////////////////// A JAX
	        $.ajax({ 
			url:"user_review_ajax.do",
			method:"post", 
			data:{"pnum":count},
			async: false,
			dataType:"json",
			success:function(obj){				
				var lists=obj.list;
				var sphoto_lists=obj.sphoto_list;
				var rphoto_lists=obj.rphoto_list;
				
				if(rphoto_lists==""){
					$.each(lists, function(i){  			 
						addContent += 	'<div class="bigtle" > '
										+'<div class="mybox">      '
									+	' 	<div class="store_img">    '
									+            sPhoto(lists[i].reply_seq)
									+	 '		<div class="store_info">'+lists[i].store_name+'</div>'
									+	 '	</div>      '
									+		'<img src="./img/profile_default.png" class="pf"/>  '
									+		'<div class="info">  '      
									+			'<button class="content_delete buttondle" onclick="user_review_delete('+lists[i].reply_seq+')">삭제</button> <button class="content_detail buttondle">자세히 보기</button><br>' 
									+			'<span class="user_review_name">닉네임:'+lists[i].user_id+'</span><span style="float:right;color:#919191;">'+lists[i].reply_realdate+'</span><br>'
												+		'<div class="star_table">'
												+			'<table>'
												+				'<tr>'
													+				'<td>서비스</td>'
													+             '<td>'+ star_fill(lists[i].reply_service)+star_half(lists[i].reply_service)+star_empty(lists[i].reply_service)+ '</td>'
										 			+			'</tr>'
													+			'<tr>'
													+			'	<td>가격</td>'
													+             '<td>'+ star_fill(lists[i].reply_price)+star_half(lists[i].reply_price)+star_empty(lists[i].reply_price)+ '</td>'
													+		'	</tr>' 
													+		'	<tr>'
													+		'		<td>청결도</td>'
													+             '<td>'+ star_fill(lists[i].reply_clean)+star_half(lists[i].reply_clean)+star_empty(lists[i].reply_clean)+ '</td>'
													+		'	</tr>'
														+	'</table>'
													+	'</div>'
											+	'<div class="user_review_img" >'
											+	'</div> '
											+	'<div class="contents">'
											+	'	<span style="font-weight: bold;">리뷰내용</span><br>'
											+	'	<span>'+lists[i].reply_content+'</span>'
											+'	</div>  '
										+'	</div>   '
										+	'<div class="info2">     '
										+	'	<span style="font-weight: bold;">매장답변</span><br>'
										+	'<span>	'+(lists[i].reply_answer==null?"아직 답변이 없습니다.":lists[i].reply_answer)+'<span>'
									+	'	</div>'
									+'	</div>  '
								+'	</div>     ' 
								+'	<br><br>';
					}); 
					  
					 $('.bigbig').append(addContent);
				}else{
					$.each(lists, function(i){  
						addContent += 	'<div class="bigtle" > '
										+'<div class="mybox">      '
									+	' 	<div class="store_img">    '
									+            sPhoto(lists[i].reply_seq)
									+	 '		<div class="store_info">'+lists[i].store_name+'</div>'
									+	 '	</div>      '
									+		'<img src="./img/profile_default.png" class="pf"/>  '
									+		'<div class="info">  '      
									+			'<button class="content_delete buttondle" onclick="user_review_delete('+lists[i].reply_seq+')">삭제</button> <button class="content_detail buttondle">자세히 보기</button><br>' 
									+			'<span class="user_review_name">닉네임:'+lists[i].user_id+'</span><span style="color:#919191;float:right;">'+lists[i].reply_regdate+'</span><br>'
												+		'<div class="star_table">'
												+			'<table>'
												+				'<tr>'
													+				'<td>서비스</td>'
													+             '<td>'+ star_fill(lists[i].reply_service)+star_half(lists[i].reply_service)+star_empty(lists[i].reply_service)+ '</td>'
													+			'</tr>'
													+			'<tr>'
													+			'	<td>가격</td>'
													+             '<td>'+ star_fill(lists[i].reply_price)+star_half(lists[i].reply_price)+star_empty(lists[i].reply_price)+ '</td>'
													+		'	</tr>' 
													+		'	<tr>'
													+		'		<td>청결도</td>'
													+             '<td>'+ star_fill(lists[i].reply_clean)+star_half(lists[i].reply_clean)+star_empty(lists[i].reply_clean)+ '</td>'
													+		'	</tr>'
														+	'</table>'
													+	'</div>'
							 				+	'<div class="user_review_img" >'
											+    ' '+rPhoto(lists[i].reply_seq)+'  '
											+	'</div> '
											+	'<div class="contents">'
											+	'	<span style="font-weight: bold;">리뷰내용</span><br>'
											+	'	<span>'+lists[i].reply_content+'</span>'
											+'	</div>  '
										+'	</div>   '
										+	'<div class="info2">     '
										+	'	<span style="font-weight: bold;">매장답변</span><br>'
										+	'<span>	'+(lists[i].reply_answer==null?"아직 답변이 없습니다.":lists[i].reply_answer)+'<span>'
									+	'	</div>'
									+'	</div>  '
								+'	</div>     ' 
								+'	<br><br>';
					}); 
					
					
					 $('.bigbig').append(addContent);
				}
				 
				 
			}
			}); 
	        
	     		
	              
	    }
	};
	
	
	 
	//더보기
	$(function(){
		$("body").on("click",".content_detail",function(){
			if($(this).parent().parent().find(".contents").css("height")=="80px"&&$(this).parent().parent().find(".info2").css("height")=="80px"){  
				$(this).parent().parent().css("height","auto");  
				$(this).parent().parent().find(".contents").css({"overflow":"visible","height":"auto","word-break":"break-all"});
				$(this).parent().parent().find(".info2").css({"overflow":"visible","height":"auto","word-break":"break-all"});
			}else{
				$(this).parent().parent().css("height","450px");    
				$(this).parent().parent().find(".contents").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
				$(this).parent().parent().find(".info2").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
			}   
		});   
		 

		

		  
   
	});  
	

	function user_review_delete(reply_seq){
		
		swal({
		     title: "정말 삭제 하시겠습니까?",
		     text: "",
		     icon: "warning", //"info,success,warning,error" 중 택1
		     buttons: ["아니오", "예"],
		}).then((YES) => {
		     if (YES) {
		    	 location.href="user_review_delete.do?reply_seq="+reply_seq;
		     }else{
		     	
		     }
		});	
		
// 		var result=confirm("정말 삭제 하시겠습니까?");
// 		if(result){
// 			location.href="user_review_delete.do?reply_seq="+reply_seq;
// 		}else{
			
// 		} 
		
	} 
	
	
	 function star_fill(val){
		 var v="";
		for(var i=0;i<Math.floor(val);i++){
		 
			v+='<img class="starz" src="img/star_fill.png">';
		
		}
		return v;
	 }
 
	function star_half(val){
		var v="";
		for(var i=0;i<(Math.ceil(val)-Math.floor(val));i++){
		
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
	//매장사진
	function sPhoto(uReply_seq){
		var slist_length=$("input[name=slist_length]").val();
// 		alert("asdasd");
// 		alert(uReply_seq);
		var v=""; 
 		for(var i=0;i<slist_length;i++){
 			if(uReply_seq==$("input[name=sReply_seq"+i+"]").val()){  
// 				v='<div style="background: url("upload_sphoto/'+$("input[name=store_photo_stored"+i+"]").val()+'");width: 200px;height: 123px;background-size: 200px 123px;background-repeat: no-repeat;float:left;"></div>';
// 				v='<div style="background: url("upload_sphoto/a_1.jpg");width: 200px;height: 123px;background-size: 200px 123px;background-repeat: no-repeat;float:left;"></div>';
 			  v='<img src="upload_sphoto/'+$("input[name=store_photo_stored"+i+"]").val()+'" style="width: 200px;height: 123px;"/>'
 			   
 			}
 		}    
		return v; 		
	}
	 
	
	//사용자리뷰사진
	function rPhoto(uReply_seq){
		var v="";
// 		alert(v)
		var rlist_length=$("input[name=rlist_length]").val();
		for(var i=0;i<rlist_length;i++){
			if(uReply_seq==$("input[name=rReply_seq"+i+"]").val()){ 
			v+='<img onclick = "javascript:popupImage(this.src)" class="img_cursor" src="upload_rphoto/'+$("input[name=reply_photo_stored"+i+"]").val()+'" style="width: 80px;height: 80px;float:left;margin-left:40px;">';	
			}
		}
		return v;  
	}
	
	
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

	
</script>     
<style type="text/css">
	#container{min-height:800px;box-sizing:border-box; border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; border-top-width:0px; margin-top:-1px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{z-index:200;position: sticky; top:71px;display: inline-block;}
   	#navi2{width:998px;clear:both;position:relative;top:0px;text-align: center;line-height: 50px;display: inline-block;border-bottom: 1px solid #585858;}
   	.navis2{ font-size:18px; float:left;width:200px;height:50px;color: #000;background-color: #fff;}
   	.navis2:last-child{ font-size:18px; float:left;width:198px;height:50px;color: #000;background-color: #fff;}
   	.navis2:hover{color:#000;transition:all .3s;cursor:pointer;border-bottom: 5px solid #585858;}
	.home{background-color: white;color:black;border-bottom:5px solid #585858 ;}
	
	   
	.pf{float: left; width: 40px;height: 40px;}     
	.dt{margin-left: 600px;}
	.info{min-height: 95px;}    
	.contents{display:inline-block;padding: 10px; width: 671px;height:80px;text-overflow: ellipsis; overflow: hidden;word-break:keep-all;min-height: 80px; clear: both;margin-bottom: 15px; margin-top: 5px;}        
	.info2{background-color: #F2F2F2;  height: 80px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 612px; min-height: 80px;border-radius:5px;word-break:keep-all; margin-left: 30px;}
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.myboxmargin{margin-top:30px;}      
	.store_img{width: 200px;height:155px; float: left;margin-right: 20px; background: white;background-size: 200px 250px;} 
	.mybox{padding:15px;border-top:1px solid #BDBDBD; width:700px;height:450px; font-size: 15px; margin-left: -10px;min-height: 450px;}
	.bigtle{margin-left: 165px;}          
	       
	       
	 .modal-title{margin-left: 400px;} 
	.modal-body span{margin: 85px;}
	textarea:focus::-webkit-input-placeholder { color: transparent; }
	.modal-footer  div{border: 1px solid black;width: 153px; height: 110px; float: left;}
	input[type=file] {display: none;}
     .my_button {
         display: inline-block; width: 200px;  text-align: center; padding: 10px; background-color: #006BCC;color: #fff;
         text-decoration: none; border-radius: 5px;}
     .imgs_wrap { width: 700px;}
     .imgs_wrap img {max-width: 150px;margin-left: 5px;margin-right: 5px;}
	.input_wrap {clear: both;} 
	button {border: 0;  } 
	button:hover:{background-color: grey;}
	 
	 .buttondle{background-color: #fafafa;}
	 .buttondle:hover {background-color: grey;} 
	  
	 .star_table{width: 187px; height: 80px;background-color: #fafafa;border-radius: 5px; padding: 10px;float: left;}
	 .starz{width:17px;height:auto;display: inline-block;margin:-2px;margin-bottom:4px;}
	 .content_delete{ background-color:#fafafa; margin-left: 270px;}
	 .content_delete:hover {background-color: grey;} 
	 .store_info{text-align:center; width: 200px;height: 30px; background-color: white;}
	 .buttondle{background-color: #585858; color: white;border-radius: 5px;}
/* 	 .img_tle{width: 670px;height: 80px;margin-top: 120px;margin-bottom: 10px;}  */
	 .user_review_img{width: 676px;height: auto;float: left;}
	 .gongback{width: 265px;height: 100px;margin-left: 405px;}
	 .img_cursor:hover {cursor: pointer;}
	 .tle_final{width: 700px;border-top: 1px solid #BDBDBD;margin-left: 150px;margin-bottom: 200px;}
	  
	 .user_review_name{position: relative; top: -13px; padding-left: 10px;color:#919191;} 
	   
</style>  

</head>
<% 
	List<ReplyDto> list=(List<ReplyDto>)request.getAttribute("list");
	List<ReplyDto> sphoto_list=(List<ReplyDto>)request.getAttribute("sphoto_list");
	List<RPhotoDto> rphoto_list=(List<RPhotoDto>)request.getAttribute("rphoto_list");
%>
<body>
<input name="slist_length" type="hidden" value="<%=sphoto_list.size()%>"/>
<input name="rlist_length" type="hidden" value="<%=rphoto_list.size()%>"/>
<%
	for(int i=0;i<sphoto_list.size();i++){
	%>
	<input type="hidden" name="sReply_seq<%=i%>" value="<%=sphoto_list.get(i).getReply_seq()%>">
	<input type="hidden" name="store_photo_stored<%=i%>" value="<%=sphoto_list.get(i).getStore_photo_stored()%>">
	<%
	}
	for(int i=0;i<rphoto_list.size();i++){
	%>
	<input type="hidden" name="rReply_seq<%=i%>" value="<%=rphoto_list.get(i).getReply_photo_seq()%>">
	<input type="hidden" name="reply_photo_stored<%=i%>" value="<%=rphoto_list.get(i).getReply_photo_stored()%>">
	<%	
	}
%>


<div id="container">
	<div id="sticky">
		<div id="navi2">
			<div class="navis2" onclick="location.href='user_mypage.do'">
				마이페이지
			</div>
			<div class="navis2" onclick="location.href='user_mypage_like.do'">
				좋아요
			</div>
			<div class="navis2" onclick="location.href='user_mypage_reserve.do'">
				내 예약
			</div>
			<div class="navis2 home" onclick="location.href='user_mypage_review.do'">
				내 리뷰
			</div>
			<div class="navis2" onclick="location.href='user_mypage_qna.do'">
				내 문의
			</div>
		</div>
	</div>
	<div id="pagename">
		<b>작성한 리뷰</b>  
	</div> 
	<div></div>
	<% 
		for(ReplyDto dto : list){ 
		if(!dto.getReply_delflag().equals("Y")){
		%>
		<div class="bigtle" > 
			<div class="mybox">      
			 	<div class="store_img">    
			 		<%
			 		for(int i=0;i<sphoto_list.size();i++){
			 			if(dto.getReply_seq()==sphoto_list.get(i).getReply_seq()){
		 				%>
		 				<img src="upload_sphoto/<%=sphoto_list.get(i).getStore_photo_stored()%>" style="width: 200px;height: 123px;"/>
		 				<%
			 			}
			 		}
			 		%> 
			 		<div class="store_info"><%=dto.getStore_name()%></div>
			 	</div>      
				<img src="./img/profile_default.png" class="pf"/>  
				<div class="info">        
					<button class="content_delete buttondle" onclick="user_review_delete(<%=dto.getReply_seq()%>)">삭제</button> <button class="content_detail buttondle">자세히 보기</button><br> 
					<span class="user_review_name">닉네임:<%=dto.getUser_id()%></span><span style="float:right;color:#919191;"><%=dto.getReply_realdate()%></span><br>
					<div class="star_table"> 
						<table>
							<tr>  
								<td>서비스</td>
								<td>
									<%  
										for(int i=0;i<Math.floor(dto.getReply_service());i++){
										%> 
											<img class="starz" src="img/star_fill.png">
										<%
										}
						 				for(int i=0;i<(Math.ceil(dto.getReply_service())-Math.floor(dto.getReply_service()));i++){
										%>
											<img class="starz" src="img/star_half.png">
										<%
										}
										for(int i=0;i<(5-Math.ceil(dto.getReply_service()));i++){
										%>
											<img class="starz" src="img/star_empty.png">
										<%
										}
									%>
								</td>  
							</tr>
							<tr>
								<td>가격</td>
								<td>
									<%  
										for(int i=0;i<Math.floor(dto.getReply_price());i++){
										%> 
											<img class="starz" src="img/star_fill.png">
										<%
										}
										for(int i=0;i<(Math.ceil(dto.getReply_price())-Math.floor(dto.getReply_price()));i++){
										%>
											<img class="starz" src="img/star_half.png">
										<%
										}
										for(int i=0;i<(5-Math.ceil(dto.getReply_price()));i++){
										%>
											<img class="starz" src="img/star_empty.png">
										<%
										}
									%>
								</td> 
							</tr>
							<tr>
								<td>청결도</td>
								<td>
									<%  
										for(int i=0;i<Math.floor(dto.getReply_clean());i++){
										%> 
											<img class="starz" src="img/star_fill.png">
										<%
										}
										for(int i=0;i<(Math.ceil(dto.getReply_clean())-Math.floor(dto.getReply_clean()));i++){
										%>
											<img class="starz" src="img/star_half.png">
										<%
										}
										for(int i=0;i<(5-Math.ceil(dto.getReply_clean()));i++){
										%>
											<img class="starz" src="img/star_empty.png">
										<%
										}
									%>
								</td> 
							</tr>
						</table>  
					</div>
					<div class="gongback"></div>
					<div class="user_review_img" >
					<%
					for(int i=0;i<rphoto_list.size();i++){
						if(dto.getReply_seq()==rphoto_list.get(i).getReply_seq()){
						%>	
						<img onclick = "javascript:popupImage(this.src)" class="img_cursor" src="upload_rphoto/<%=rphoto_list.get(i).getReply_photo_stored()%>"style="width: 80px;margin-left:40px; height: 80px;float:left;">
						<%
						}else{ 
							
						}
					}
					%> 
					</div> 
					<div class="contents">
						<span style="font-weight: bold;">리뷰내용</span><br>
						<span><%=dto.getReply_content()%></span>
					</div>  
				</div>   
				<div class="info2">     
					<%
						if(dto.getReply_answer()==null||dto.getReply_answer().equals("")){
							%>					
								<span style="font-weight: bold;">매장답변</span><br>
								<span>아직 답변이 없습니다.</span>
							<%
						}else{  
							%>
								<span style="font-weight: bold;">매장답변</span><br>
								<span><%=dto.getReply_answer()%></span>						
							<%
						}
					%>  
				</div>
			</div>  
		</div>      
		<br><br>
		<%
		}
 	%> 
	<%		
		} 
	%>
	<div class="bigbig">
	   
 	</div>
 	<div class="tle_final"></div>
</div> 
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 