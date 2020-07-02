<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="com.hk.conred.dtos.ReserveDto"%>
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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
	#container{min-height:800px;box-sizing:border-box; border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; border-top-width:0px;  width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
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
	.reserve_info{width: 500px; margin-left: 220px;}
	button{border-width: 0;} 
	button:hover{background-color: grey;}
	 .buttondle{background-color: #585858; color: white;border-radius: 5px;} 
	.store_title{text-align: center;}
	.reserve_success{opacity:0.5; background: url("img/reserveS.png");background-size: contain;background-repeat: no-repeat;background-position: 315px;} 
	
	   
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
			url:"user_reserve_ajax.do",
			method:"post",
			data:{"pnum":count},
			dataType:"json", 
			success:function(obj){				
				var lists=obj.list; 
				var photo_lists=obj.photo_list 
				$.each(lists, function(i){  
					if(lists[i].reserve_succes=="Y"){
						addContent += 	'<div class="bigtle reserve_success">' 
							+'<div class="mybox">'
							+	'<div class="store_img">'
							+ 	'	'+ storeImg(lists[i].reserve_seq) +' '
							 +	'	<p class="store_title"><b>'+ lists[i].store_name +'</b></p> '
							 +	'</div>'
								+'<div class="reserve_info">'
							 	+'	<a>메뉴명 : '+ lists[i].menu_name +' </a><br>'   
							 	+'	<span>가격 정보 : '+ lists[i].reserve_price +' </span><br>'
							 	+'	<span>예약 날짜 :'+ (lists[i].reserve_edate==null?lists[i].reserve_sdate:lists[i].reserve_sdate+'~'+lists[i].reserve_edate)+'</span><br>'
							 	+'	<span>'+(lists[i].reserve_time==null?"":"예약시간:"+lists[i].reserve_time)+' </span><br>'
							 	+'	<span>주소 : '+ lists[i].store_address +' </span><br>'
							 	+'</div>'
						 		+'</div> 	'  
						+	'</div>' 
						+	'<br><br>'; 	
					}else if(lists[i].reserve_state=="Y"&&lists[i].reserve_state!="C"){
						addContent += 	'<div class="bigtle">' 
							+'<div class="mybox">'
							+	'<div class="store_img">'
							+ 	'	'+ storeImg(lists[i].reserve_seq) +' '
							 +	'	<p class="store_title"><b>'+ lists[i].store_name +'</b></p> '
							 +	'</div>'
								+'<div class="reserve_info">'
							 	+'	<a>메뉴명 : '+ lists[i].menu_name +' </a><br>'   
							 	+'	<span>가격 정보 : '+ lists[i].reserve_price +' </span><br>'
							 	+'	<span>예약 날짜 :'+ (lists[i].reserve_edate==null?lists[i].reserve_sdate:lists[i].reserve_sdate+'~'+lists[i].reserve_edate)+'</span><br>'
							 	+'	<span>'+(lists[i].reserve_time==null?"":"예약시간:"+lists[i].reserve_time)+' </span><br>'
							 	+'	<span>주소 : '+ lists[i].store_address +' </span><br>'
							 	+'</div>'
							 	+'	<div style="margin-left: 520px; margin-top: 40px;" >'
								+ '		<button class="buttondle cancel" onclick="reserveCancel('+lists[i].reserve_seq+')">예약취소</button>&nbsp;&nbsp;       '
								+ '		<button class="buttondle" onclick="requestPay('+lists[i].reserve_seq+',\''+lists[i].user_id+'\',\''+lists[i].user_email+'\',\''+lists[i].user_address+'\',\''+lists[i].menu_name+'\',\''+lists[i].reserve_price+'\')">결제하기</button>       '
							 	+	'</div>'
						 		+'</div> 	'  
						+	'</div>' 
						+	'<br><br>'; 	
					}
							
	
			 
						}); 
						
						 $('.bigbig').append(addContent); 
				 
			}
			});
		
	        }
		};
		
		
// 		$(function(){		
// 			//취소하기
// 			$('.cancel').click(function(){
// 					var result=confirm("예약을 취소하시겠습니까?");
// 					if(result){
// 						    var seq=$(this).parent().find("input[name=reserve_seq]").val();
// 						    location.href="user_reserve_cancel.do?reserve_seq="+seq;	 			
// 					}else{			 
// 					}	
// 				});
			
// 		});//$(function(){})
		
		
		function requestPay(reserve_seq,user_id,user_email,store_address,menu_name,reserve_price){
			///결제하기 
			var IMP=window.IMP;
			IMP.init('imp83419041');  

			 
			IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'card',
			    merchant_uid :''+reserve_seq+'',   
			    name : '주문명:'+menu_name+'',
			    amount : reserve_price, 
			    buyer_email : user_email,
			    buyer_name : user_id,
			    buyer_addr : store_address
			}, function(rsp) {
			    if ( rsp.success ) {
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "test_reserve2.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
			    		type: 'POST',
			    		dataType: 'json',
			    		async:false,
			    		data: { 
			    			imp_uid : rsp.imp_uid,
				    		merchant_uid: rsp.merchant_uid
				    		
				    		//기타 필요한 데이터가 있으면 추가 전달  
			    		} 
			    	}).done(function(data) {
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    	
//		 	    		if ( everythings_fine ) {
			    			var msg = '결제가 완료되었습니다.';
			    			msg += '\n고유ID asd: ' + rsp.imp_uid;
			    			msg += '\n상점 거래ID asd: ' + rsp.merchant_uid;
			    			msg += '\결제 금액asd : ' + rsp.paid_amount;
			    			msg += '카드 승인번호asd : ' + rsp.apply_num;
//		 	    			location.href='test_reserve_success.do?msg='+msg;
			    			alert(msg);
//		 	    		} else {
//		 	    			alert("ㅜㅜ")
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
//		 	    		}
			            
			    	});
			    	var msg = rsp.merchant_uid;
			    	//성공시 이동할 페이지
					location.href='user_reserve_success.do?msg='+msg;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;

			        alert(msg); 
			    }

			});
			
		}
	//가게이미지
	function storeImg(reserve_seq){
		var v="";
		var photo_length=$("input[name=photo_length]").val();
		for(var i=0;i<photo_length;i++){
			if(reserve_seq==$("input[name=preserve_seq"+i+"]").val()){
				var v='<img src="upload_sphoto/'+$("input[name=store_photo_stored"+i+"]").val()+'" style="width: 200px;height: 150px; float: left;">';					
				return v;
			}						 
		} 
	}	
	
	function reserveCancel(reserve_seq){
		
		swal({
		     title: "예약을 취소하시겠습니까?",
		     text: "",
		     icon: "warning", //"info,success,warning,error" 중 택1
		     buttons: ["아니오", "예"],
		}).then((YES) => {
		     if (YES) {
		    	 location.href="user_reserve_cancel.do?reserve_seq="+reserve_seq;
		     }else{
		    	
		     }
		});
		
// 		var result=confirm("예약을 취소하시겠습니까?");
// 		if(result){
// 			    location.href="user_reserve_cancel.do?reserve_seq="+reserve_seq;	 			
// 		}else{			 
// 		}
		
	}
	 



		 
		
</script>

</head>
<%
	List<ReserveDto> list=(List<ReserveDto>)request.getAttribute("list");
	UDto uldto=(UDto)session.getAttribute("uldto");
	List<ReserveDto> photo_list=(List<ReserveDto>)request.getAttribute("photo_list");
%>
<body>
<input type="hidden" name="photo_length" value="<%=photo_list.size()%>">
<%
	for(int i=0;i<photo_list.size();i++){
	%>
	<input type="hidden" name="preserve_seq<%=i%>" value="<%=photo_list.get(i).getReserve_seq()%>">
	<input type="hidden" name="store_photo_stored<%=i%>" value="<%=photo_list.get(i).getStore_photo_stored()%>">
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
			<div class="navis2 home" onclick="location.href='user_mypage_reserve.do'">
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
		<b>내 예약</b>
	</div>
	<%
		for(ReserveDto dto:list){
			if(dto.getReserve_succes().equals("Y")){
			%>
			<div class="bigtle reserve_success" >
			 	<div class="mybox">
					<div class="store_img">
					<%
					for(int i=0;i<photo_list.size();i++){
						if(dto.getReserve_seq()==photo_list.get(i).getReserve_seq()){
						%>						
							<img src="upload_sphoto/<%=photo_list.get(i).getStore_photo_stored()%>" style="width: 200px;height: 150px; float: left;">
						<%
						}						 
					} 
					%>	 
				 		<p class="store_title"><b><%=dto.getStore_name()%></b></p> 
				 	</div>
				 	<div class="reserve_info">
			 		<a>메뉴명 : <%=dto.getMenu_name()%> </a><br>  
			 		<span>가격 정보 : <%=dto.getReserve_price()%></span><br>
			 		<%
			 			if(dto.getReserve_edate()==null||dto.getReserve_edate().equals("")){
			 				%>
			 				<span>예약 날짜 : <%=dto.getReserve_sdate()%> </span><br>
			 				<%
			 			}else{
			 				%>
			 				<span>예약 날짜 : <%=dto.getReserve_sdate()%> ~ <%=dto.getReserve_edate()%> </span><br>
			 				<%
			 			}
			 		%>
			 		<%
			 			if(dto.getReserve_time()==null||dto.getReserve_time().equals("")){
			 				%>
					 					 				
			 				<%
			 			}else{
			 				%>
					 		<span>예약 시간 : <%=dto.getReserve_time()%></span><br>				 				
			 				<%
			 			} 
			 		%>
			 		<span>주소 : <%=dto.getStore_address()%> </span><br>
			 		</div>
			 	</div> 	  
			</div>
			<br><br> 
			<%
			}else if(dto.getReserve_state().equals("Y")&&!dto.getReserve_state().equals("C")){
			%>
			<div class="bigtle" >
			<input type="hidden" class="zxc" name="reserve_succes" value="<%=dto.getReserve_succes()%>"/>
			 	<div class="mybox">
					<div class="store_img">
					<%
					for(int i=0;i<photo_list.size();i++){
						if(dto.getReserve_seq()==photo_list.get(i).getReserve_seq()){
						%>						
							<img src="upload_sphoto/<%=photo_list.get(i).getStore_photo_stored()%>" style="width: 200px;height: 150px; float: left;">
						<%
						}						 
					} 
					%>	 
				 		<p class="store_title"><b><%=dto.getStore_name()%></b></p> 
				 	</div>
				 	<div class="reserve_info">
			 		<a>메뉴명 : <%=dto.getMenu_name()%> </a><br>  
			 		<span>가격 정보 : <%=dto.getReserve_price()%></span><br>
			 		<%
			 			if(dto.getReserve_edate()==null||dto.getReserve_edate().equals("")){
			 				%>
			 				<span>예약 날짜 : <%=dto.getReserve_sdate()%> </span><br>
			 				<%
			 			}else{
			 				%>
			 				<span>예약 날짜 : <%=dto.getReserve_sdate()%> ~ <%=dto.getReserve_edate()%> </span><br>
			 				<%
			 			}
			 		%>
			 		<%
			 			if(dto.getReserve_time()==null||dto.getReserve_time().equals("")){
			 				%>
					 					 				
			 				<%
			 			}else{
			 				%>
					 		<span>예약 시간 : <%=dto.getReserve_time()%></span><br>				 				
			 				<%
			 			} 
			 		%>
			 		<span>주소 : <%=dto.getStore_address()%> </span><br>
			 		</div>
			 		<div class="success_btn" style="margin-left: 520px; margin-top: 40px;" >
				 		<button class="buttondle cancel" onclick="reserveCancel(<%=dto.getReserve_seq()%>)">예약취소</button>&nbsp;&nbsp;       
				 		<button class="buttondle" onclick="requestPay(<%=dto.getReserve_seq()%>,'<%=dto.getUser_id()%>','<%=uldto.getUser_email()%>','<%=dto.getStore_address()%>','<%=dto.getMenu_name()%>','<%=dto.getReserve_price()%>')">결제하기</button>  
				 		<input type="hidden" name="reserve_seq" value="<%=dto.getReserve_seq()%>"/>   
				 		<input type="hidden" name="user_id" value="<%=dto.getUser_id()%>"/>  
				 		<input type="hidden" name="user_email" value="<%=uldto.getUser_email()%>"/>
				 		<input type="hidden" name="store_address" value="<%=dto.getStore_address()%>"/>
				 		<input type="hidden" name="menu_name" value="<%=dto.getMenu_name()%>"/>
				 		<input type="hidden" name="reserve_price" value="<%=dto.getReserve_price()%>"/>
			 		</div>
			 	</div> 	  
			</div>
			<br><br> 
			<%		
			}
		}
	%>
	<div class="bigbig">
		
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 