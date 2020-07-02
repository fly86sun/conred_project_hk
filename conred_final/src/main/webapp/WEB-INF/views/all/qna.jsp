<%@page import="com.hk.conred.dtos.ODto"%>
<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="com.hk.conred.dtos.QnaDto"%>
<%@page import="java.util.List"%>
<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
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
<style type="text/css"> 
	#container{ border:1px solid rgba(225,225,225,1.00);border-top-width:0px;min-height:700px; border-bottom:1px solid #fff; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
   	#sticky{z-index:200;position: sticky; top:71px;display: inline-block;}
   	#navi2{width:998px;clear:both;position:relative;top:0px;text-align: center;line-height: 50px;display: inline-block;border-bottom: 1px solid #585858;}
   	.navis2{ font-size:18px; float:left;width:200px;height:50px;color: #000;background-color: #fff;}
   	.navis2:last-child{ font-size:18px; float:left;width:198px;height:50px;color: #000;background-color: #fff;}
   	.navis2:hover{color:#000;transition:all .3s;cursor:pointer;border-bottom: 5px solid #585858;}
	.home{background-color: white;color:black;border-bottom:5px solid #585858 ;}
	
	
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.mybox{padding:15px;border-top:1px solid #BDBDBD;width:700px;height:250px; margin:0 auto; font-size: 15px;min-height: 250px;}
	.myboxmargin{margin-top:30px;}
	#main{width: 702px;height: 100px;margin: 0 auto; padding-top: 25px;} 
	#main2{font-size: 20px;}  
	#main2{} 
	.pf{float: left; width: 40px;height: 40px;}      
	.dt{margin-left: 600px;}
	.info{min-height: 144px;}   
	.contents{display:inline-block; width: 631px;height:80px;text-overflow: ellipsis; word-break:keep-all;overflow: hidden;margin-left: 17px;min-height: 80px; padding: 10px;margin-bottom: 15px;}     
	.info2{background-color: #F2F2F2; margin-left: 42px; height: 80px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 580px;min-height: 80px; border-radius: 5px;}
	.bot{margin: 0 auto; text-align: center;}
	
	.modal_Btn{float:right; height: 50px; width: 100px;background-color: #94B8FD; border: 0;border-radius: 5px;color: white;}
	.modal_Btn:hover{background-color: #4a83ed;}  
	.modal-title{margin-left: 400px;}  
	.modal-body span{margin: 85px;}
	textarea:focus::-webkit-input-placeholder { color: transparent; } 
	.modal-footer  div{border: 1px solid black;width: 153px; height: 110px; float: left; margin: 10px;}
	button{border-width: 0; }
	button:hover {background-color: grey;}
	.buttondle{background-color: #585858; color: white;border-radius: 5px;}
	.tle_final{width: 700px;border-top: 1px solid grey;margin-left: 150px;margin-bottom: 200px;}
	
	.zxczxc{width: 631px;display: inline-block;} 
	 .nologin{margin-left: 537px;}
	 .qna_content{resize: none;}
	 .qna_title{margin-bottom: 10px; float: left;}
	 .qna_hide{float: left;margin-left: 10px;}
	 .qna_write{height: 34px;float: right;border-color:#ccc;border-radius:5px;}
	 
	 
	 .ownerAnswer_btn{float: right;background-color: #94B8FD;color: white;width: 60px;height: 32px;border: 0;border-radius: 5px;}
	.ownerAnswer_btn:hover {background-color: #4a83ed;}
	.ownerAnswer{display: none; width: 665px;height: 98px;resize: none;}
	.ownerAnswer_success{display: none;}
	.ownerAnswer_cancel{display: none;}
	
	.ownerAnswer_update{float: right;background-color: #94B8FD;color: white;width: 72px;height: 32px;border: 0;border-radius: 5px;}
	.ownerAnswer_update:hover {background-color: #4a83ed;}
	 
	.user_review_name{position: relative; top: -13px; padding-left: 10px;color:#919191;} 
	 
</style> 
<script type="text/javascript">	      
	//Javascript
	var count = 1;  
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	    //추가되는 임시 콘텐츠
	    //window height + window scrollY 값이 document height보다 클 경우,
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	//실행할 로직 (콘텐츠 추가) 
	        count++;
	    	var addContent="";
	    	var store_seq=$("input[name=store_seq]").val(); 
	    	$.ajax({
	    		url:"qna_ajax.do",
	    		method:"post",
	    		data:{"pnum":count,"store_seq":store_seq},
	    		dataType:"json",
	    		success:function(obj){
	    			var lists=obj.list;
	    			var idChk=obj.owner_chk;
	    			$.each(lists, function(i){   user_id,qna_seq,qna_title,qna_content,qna_hide
				       addContent +=  '<div class="mybox">'         
										+	'<img src="./img/profile_default.png" class="pf"/>'
										+	'<div class="info">'
										+   ''+ buttonChk(lists[i].user_id,lists[i].qna_seq,lists[i].qna_title,lists[i].qna_content,lists[i].qna_hide) +''
										+	'	<span class="user_review_name"><b>닉네임</b>:'+lists[i].user_id+'|'+ lists[i].qna_title +'</span><span style="color:#919191; float: right;">'+ lists[i].qna_realdate +'</span><br>'
										+	'	<div class="contents">'
										+	'		<span class="zxczxc"><b>문의내용</b></span>    '
										+    ''+ hideContent(lists[i].user_id,lists[i].qna_content,lists[i].qna_hide,idChk.owner_id) +''
						 				+	'	</div>'
										+	'</div>'
										+	'<div class="info2">    '
										+	'	<span><b>가게답변</b></span><br>'
										+   ''+		ownerAnswer(lists[i].qna_answer,idChk.owner_id)  +''
										+	'</div>'
										+  ''+ownerAnswer02(lists[i].qna_answer)+''
										+	'<button class="ownerAnswer_success">답변완료</button>'
										+	'<button class="ownerAnswer_cancel">취소</button>'
										+	'<input type="hidden" name="qna_seq" value="'+lists[i].qna_seq+'"/>'
									+	'</div>     ' 
										+'<br><br>';	    				
	    			}); 
		        $('.bigbig').append(addContent);				
	    		}
	    	});
	    }
	};
	
	$(document).ready(function(){
		
// 		var sss=$("input[name=session_id]").data('value') ;
		var uSession_id=$("input[name=uSession_id]").val();
		if(uSession_id!=""){
// 			alert(session_id);   
		}
		
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
			
			var qna_seq=$(this).parent($(".mybox")).find("input[name=qna_seq]").val()
			var qna_answer=$(this).parent($(".mybox")).find(".ownerAnswer").val();
// 			alert(qna_seq);
// 			alert(qna_answer);
		});
		
		//답변완료버튼	
		$("body").on("click",".ownerAnswer_success",function(){
			var qna_seq=$(this).parent($(".mybox")).find("input[name=qna_seq]").val()
			var qna_answer=$(this).parent($(".mybox")).find(".ownerAnswer").val();
			var store_seq=parseInt($("input[name=store_seq]").val());
			location.href="owner_qna_answer.do?qna_seq="+qna_seq+"&qna_answer="+qna_answer+"&store_seq="+store_seq;
		});
		
		//답변수정버튼
		$("body").on("click",".ownerAnswer_update",function(){
			$(this).parent($(".info2")).next(".ownerAnswer").css("display","inline-block");
			$(this).parent($(".info2")).next().next().css("display","inline-block");
			$(this).parent($(".info2")).next().next().next().css("display","inline-block");
			$(this).parent($(".info2")).css("display","none");
		});
		
		
		
		
		
		
	    $(".modal_Btn").click(function(){
	    	if($(".modal_Btn").val()==1){
		        $("div.modal").modal(); 
 			}else if($(".modal_Btn").val()==2){
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
 				
//  				var yesNo=confirm("로그인 후에 작성 가능합니다. \n\n로그인 하시겠습니까?");
//  				if(yesNo){
//  					location.href="login.do";
//  				}else{
 					
//  				}
 				
 			}//else끝
	    	 
	    	
	    	$('.qna_content').keyup(function (e){
			    var qna_content = $(this).val();
			    $('#counter').html("("+qna_content.length+" / 최대 200자)");  
			    if (qna_content.length > 200){
			    	swal("최대 200자까지 입력 가능합니다", "error");
			        $(this).val(qna_content.substring(0, 100));
			        $('#counter').html("(200 / 최대 200자)");  
			    }
			});	
	    	
	    	
	    	
	    	$("form").on("submit",function(){
				  var store_seq=$("input[name=store_seq]").val();
				  var qna_content=$("textarea").val();
				  var qna_title=$(".qna_title").val();
				  var qna_hide=$(".qna_hide").val();
				   
				  if(qna_title=='문의 선택'){
					  swal("문의를 선택해주세요", "error");
					  return false;
				  }
				  if(qna_hide=='비공개 여부'){
					  swal("비공개 여부를 선택해주세요", "error");
					  return false;
				  }
				  
			      
// 			      if($("textarea").val().length<=100){
// 					  alert("100자 이상 작성해주세요"); 
// 					  $("textarea").focus();
// 			    	  return false;
// 				  }
			      	    	    
			  });
	    	
	    	
	    	
	    	
	    }); 
	    
	    
		$("body").on("click",".content_detail",function(){
			if($(this).parent().parent().css("height")=="250px"){   
				$(this).parent().parent().css("height","auto");  
				$(this).parent().parent().find(".contents").css({"overflow":"visible","height":"auto","word-break":"break-all"});
				$(this).parent().parent().find(".info2").css({"overflow":"visible","height":"auto","word-break":"break-all"});
			}else{
				$(this).parent().parent().css("height","250px");    
				$(this).parent().parent().find(".contents").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
				$(this).parent().parent().find(".info2").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
			}   
		}); 
	});
	
	//수정,삭제 버튼
	function buttonChk(user_id,qna_seq,qna_title,qna_content,qna_hide){
		var uSession_id=$("input[name=uSession_id]").val();
		var v="";
		if(uSession_id!=""){
			if(uSession_id==user_id){
				v='<button onclick="updateQnA('+lists[i].qna_seq+',\''+lists[i].qna_title+'\',\''+lists[i].qna_content+'\',\''+lists[i].qna_hide+'\')" class="buttondle" style="margin-left:436px;">수정</button><button onclick="deleteQnA('+lists[i].qna_seq+')" class="buttondle" >삭제</button><button  class="content_detail buttondle">자세히 보기</button><br>';							
				return v;
			}else{
				v='<button  class="content_detail buttondle nologin">자세히 보기</button><br>';						
				return v;
			}
		}else{ 
			v='<button  class="content_detail buttondle nologin">자세히 보기</button><br>'; 							
			return v;
		}
	}
	
	
	//비공개글
	function hideContent(user_id,qna_content,qna_hide,owner_id){
		var uSession_id=$("input[name=uSession_id]").val();
		var oSession_id=$("input[name=oSession_id]").val();
		var v="";
		if(uSession_id!=""){
			if(uSession_id==user_id){
				v='<span>'+qna_content+'</span>';    						
				return v;
			}else{
				v='<span style="color:#aaa;">비공개글 입니다.</span>';
				return v;
			}
		}else{
			if(oSession_id!=""){
				if(oSession_id==owner_id){
					v='<span>'+qna_content+'</span>'; 
					return v;					
				}else{
					v='<span style="color:#aaa;">비공개글 입니다.</span>';
					return v;
				}
			}else if(qna_hide=="Y"){
				v='<span style="color:#aaa;">비공개글 입니다.</span>';
				return v;
			}else{
				v='<span>'+qna_content+'</span>';  
				return v;
			}
		}
	}
	
	////자기매장 답변 info2쪽
	function ownerAnswer(qna_answer,owner_id){
		var session_id=$("input[name=oSession_id]").val();
		var v="";
		
		if(qna_answer==null||qna_answer==""){
			v='<span>아직 답변이 없습니다.</span>';
			if(session_id!=""){
				if(session_id==owner_id){
					v='<span>아직 답변이 없습니다.</span><button class="ownerAnswer_btn">답변</button>';
				return v;
				}
			}
			return v;
		}else{
			v='<span>'+qna_answer+'</span>';
			if(session_id!=""){
				if(session_id==owner_id){
					v='<span>'+qna_answer+'</span><button class="ownerAnswer_update">답변수정</button>';
				} 
				return v;
			}
			return v;
		}
	}
	
	////자기매장 답변 info2바깥쪽
	function ownerAnswer02(qna_answer){
		var v="";
		if(qna_answer==null||qna_answer==""){
			v='<textarea class="ownerAnswer" rows="10" cols="60"></textarea>';
			return v;
			}else{
			v='<textarea class="ownerAnswer" rows="10" cols="60">'+qna_answer+'</textarea>';
			return v;
			}
	}
	
	//본인문의 수정
	function updateQnA(qna_seq,qna_title,qna_content,qna_hide){
		location.href="user_qna_update_form.do?qna_seq="+qna_seq+"&qna_title="+qna_title+"&qna_content="+qna_content+"&qna_hide="+qna_hide;
	}
	//본인문의 삭제
	//문의삭제
	function deleteQnA(qna_seq){
		swal({
		     title: "정말 삭제 하시겠습니까?",
		     text: "",
		     icon: "warning", //"info,success,warning,error" 중 택1
		     buttons: ["아니오", "예"],
		}).then((YES) => {
		     if (YES) {
		    	 location.href="user_qna_delete.do?qna_seq="+qna_seq;
		     }else{ 	
		     }
		});			
	}
	
	
 
</script> 
</head>
<%
	List<QnaDto> list=(List<QnaDto>)request.getAttribute("list");
	QnaDto qnaAvg=(QnaDto)request.getAttribute("qnaAvg");
	UDto uldto=(UDto)session.getAttribute("uldto");
	ODto oldto=(ODto)session.getAttribute("oldto");
	QnaDto owner_chk=(QnaDto)request.getAttribute("owner_chk");
%>  
<body>  
<%-- <input type="hidden" name="session_id"  data-value="<%=session.getAttribute("uldto")==null?"":uldto.getUser_id()%>"/> --%>
<input type="hidden" name="uSession_id" value="<%=session.getAttribute("uldto")==null?"":uldto.getUser_id()%>">
<input type="hidden" name="oSession_id" value="<%=session.getAttribute("oldto")==null?"":oldto.getOwner_id()%>">
<!-- Modal -->
<form action="insert_qna.do" method="post">
<input type="hidden" name="store_seq" value="<%=list.size()==0?"":list.get(0).getStore_seq()%>">
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
	  		<!-- Modal content--> 
	   		<div class="modal-content">
	     		<div class="modal-header">
	     			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	       			<button type="submit" class="qna_write">문의 작성 완료</button>
	       			<h4 class="modal-title">가게이름</h4>
	     		</div>
	     		<div class="modal-footer"> 
	     			<select class="qna_title" name="qna_title" >
	     				<option>문의 선택</option>	 
						<option>가격 문의</option>
						<option>예약 문의</option>
						<option>기타 문의</option>	
	     			</select>
	     			<select class="qna_hide" name="qna_hide">
	     				<option>비공개 여부</option>
				    	<option value="Y">비공개</option>
				    	<option value="N">공개</option>
	     			</select>
	       			<textarea rows="20" cols="120" class="qna_content" name="qna_content"  placeholder="문의 작성 해주세요."></textarea>
	       			<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
	     		</div>
	   		</div>
		</div>
	</div>
</form>
<div id="container"> 
	<%
	if(oldto!=null){
		if(oldto.getOwner_id().equals(owner_chk.getOwner_id())){
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
				<div class="navis2" onclick="location.href='review.do?store_seq=${sdto.store_seq}'">
					리뷰관리
				</div>
				<div class="navis2 home" onclick="location.href='qna.do?store_seq=${sdto.store_seq}'">
					문의관리
				</div>
			</div>
		</div>
		<%
		}
	}
	%>
	<div id="pagename">
		<b>문의 목록</b>
	</div> 
	<%
	if(list.size()!=0){
	%>
	<div class="bigtle">
		<div id="main">
			<span id="main2"><b>문의</b> &nbsp; &nbsp; &nbsp; &nbsp;전체<%=qnaAvg.getQna_content()%>개|답변<%=qnaAvg.getQna_answer()%>개</span>
			<%
			if(uldto==null){
				if(oldto!=null){
				%>
				<button class="modal_Btn" value="2">문의 작성</button>
				<%	
				}else{
				%>
				<button class="modal_Btn">문의 작성</button>
				<%	
				} 
			}else if(uldto!=null){ 
				%>
				<button class="modal_Btn" value="1">문의 작성</button>
				<%
			}
			%>
			<br/><br/> 
		</div> 
		<% 
			for(QnaDto dto:list){
			%>
		    <div class="mybox">         
				<img src="./img/profile_default.png" class="pf"/>
				<div class="info">
				<%
					if(uldto!=null){
						if(uldto.getUser_id().equals(dto.getUser_id())){
							%>
							<button class="buttondle" onclick="updateQnA(<%=dto.getQna_seq()%>,'<%=dto.getQna_title()%>','<%=dto.getQna_content()%>','<%=dto.getQna_hide()%>')" style="margin-left:436px;">수정</button><button onclick="deleteQnA(<%=dto.getQna_seq()%>)" class="buttondle" >삭제</button> 
							<button  class="content_detail buttondle">자세히 보기</button><br>							
							<%
						}else{
							%>
							<button  class="content_detail buttondle nologin">자세히 보기</button><br> 							
							<%
						}
					}else{
						%>
						<button  class="content_detail buttondle nologin">자세히 보기</button><br> 							
						<% 
					}
				%>			
					<span class="user_review_name">닉네임:<%=dto.getUser_id()%>|<%=dto.getQna_title()%></span><span style="color:#919191; float: right;"><%=dto.getQna_realdate()%></span><br>
					<div class="contents">
						<span class="zxczxc"><b>문의내용</b></span><br>  
						<%
						if(uldto!=null){
							if(uldto.getUser_id().equals(dto.getUser_id())){
							%>
								<span><%=dto.getQna_content()%></span>    						
							<%	 
							}else{
							%> 
								<span style="color:#aaa;">비공개글 입니다.</span> 
							<%	
							}
						}else{
							if(oldto!=null){
								if(oldto.getOwner_id().equals(owner_chk.getOwner_id())){
								%> 
									<span><%=dto.getQna_content()%></span>
								<%
								}else{
								%>
									<span style="color:#aaa;">비공개글 입니다.</span>
								<%	
								}
							}else if(dto.getQna_hide().equals("Y")){
							%>
								<span style="color:#aaa;">비공개글 입니다.</span>
							<%	 
							}else{
							%>
								<span><%=dto.getQna_content()%></span>
							<%		
							}
						}
						%>   
					</div>
				</div> 
				<div class="info2">      
					<span><b>가게답변</b></span><br>
					<%
						if(dto.getQna_answer()==null||dto.getQna_answer().equals("")){
							%>
							<span>아직 답변이 없습니다.</span>
							<%
							if(oldto!=null){
								if(oldto.getOwner_id().equals(owner_chk.getOwner_id())){
								%>
								<button class="ownerAnswer_btn">답변</button>
								<%
								}
							}
						}else{
							%>
							<span><%=dto.getQna_answer()%></span>
							<%
							if(oldto!=null){
								if(oldto.getOwner_id().equals(owner_chk.getOwner_id())){
								%>
								<button class="ownerAnswer_update">답변수정</button>
								<%
								}
							}
						}
					%>
				</div>
				<%
				if(dto.getQna_answer()==null||dto.getQna_answer().equals("")){
				%>
				<textarea class="ownerAnswer" rows="10" cols="60"></textarea>
				<%	
				}else{
				%> 
				<textarea class="ownerAnswer" rows="10" cols="60"><%=dto.getQna_answer()%></textarea>
				<%	
				}
				%>
				<button class="ownerAnswer_success">답변완료</button>
				<button class="ownerAnswer_cancel">취소</button>
				<input type="hidden" name="qna_seq" value="<%=dto.getQna_seq()%>"/>
			</div>      
			<br><br>		 	
			<%
			}
		%> 
		</div>
	<div class="bigbig">
		 
	</div>
	<div class="tle_final"></div>
	<%	
	}
	%>
</div> 
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 