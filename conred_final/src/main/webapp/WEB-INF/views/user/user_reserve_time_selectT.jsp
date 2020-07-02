<%@page import="com.hk.conred.dtos.STimeDto"%>
<%@page import="com.hk.conred.dtos.MenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<jsp:include page="../all/header.jsp" />
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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style type="text/css">
	#container{box-sizing:border-box; border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; width:1000px;margin: 0 auto;background-color:#f5f5f5;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	.flatpickr-calendar{margin: 0 auto; width: 500px !important; height: 400px !important; padding-top: 45px;}
	.flatpickr-rContainer{margin: 0 auto !important;}
	
	.times{width: 80px;height:34px; border: 1px solid green;float: left; margin: 10px; text-align: center;line-height: 34px; background-color: #edfbdc; border: 0;}
	.times_result{width: 375px;margin: 0 auto;border:solid #D8D8D8;border-width:1px 0 1px 0; clear: both; height: 30px;line-height: 30px;margin-bottom: 40px;margin-top: 40px;}
	.selector{display: none;}
	.times:hover{background-color: #00FF00;cursor: pointer;}
	.reserve_time_select{border: 1px solid #A4A4A4; width: 500px; height: auto; margin: 0 auto; border-radius: 10px;margin-bottom: 400px; margin-top: 60px;background-color: white;}
	.time_box{margin: 0 auto; width: 400px; height: auto;}
	.reserve_success{width: 100px;height: 25px; margin-left: 20px;font-size: 15px;line-height: 26px;border-width:0; display: none;border-radius: 10px;font-weight: bold;} 
	.reserve_success:hover {background-color: lightgrey;font-size: 18px;cursor: pointer;}
	.sungsoobox{margin-top: 100px;}
	
	.flatpickr-prev-month{margin-top: 45px;}
	.flatpickr-next-month{margin-top: 45px;} 
	
</style>  
<script>   
	function isWeek(d){
		var kk="";
		switch (d) {
		case 1:
			kk="일요일";
			break;
		case 2:
			kk="월요일";
			break;
		case 3:
			kk="화요일";
			break;
		case 4:
			kk="수요일";
			break;
		case 5:
			kk="목요일";
			break;
		case 6:
			kk="금요일";
			break;
		case 0:
			kk="토요일";
			break;
		
		}
		return kk;
	}
	
	//해당날짜 선택시
	var datestr; 
	function aaa(ele){   	
		
		var num=new Date(ele.value);
		datestr=$(".selector").val(); 
		$("#reserve_sdate").val(datestr);
		var day_result=$(".times_result").children();
		day_result.eq(1).empty();
		day_result.eq(0).text(datestr+" , ");
		day_result.eq(2).empty();
		$(".reserve_success").css("display","none");
		
		//공백
		var emptyDay=$(".prevMonthDay").length;
		//클릭->요일
		// 	alert((emptyDay+num.getDate())%7);
		var	store_time_day=isWeek((emptyDay+num.getDate())%7);
		var store_seq=$("input[name=store_seq]").val();
		var menu_seq=$("input[name=menu_seq]").val();
		var addContent=""; 
		var open;
		var close; 
		var store_maxman=$("input[name=store_maxman]").val();
		var select_times;
		
		
		$.ajax({ 
			url:"user_selectWeek_ajax.do",
			method:"post",
			data:{"menu_seq":menu_seq,"store_seq":store_seq,"store_time_day":store_time_day},
			async: false,
			dataType:"json",
			success:function(obj){ 
				var lists=obj.listWeek;
				
				$.each(lists,function(i){
					open=lists[i].store_time_open.split(":");
					close=lists[i].store_time_close.split(":");
	// 				alert(parseInt(open[0])+4); 
	// 				alert(open[0]);
					var ing=parseInt(close[0])-parseInt(open[0]);
// 					alert(ing); 
// 					 alert(open[0]);
					if(open[0]=="00"&&close[0]=="00"){
						for (var j = 0; j < 24; j++) {
							addContent+= '<input class="times" value="'+ (parseInt(open[0])+j)+':00' +'" readonly="readonly">';												
						}		
					}else{
						for (var j = 0; j < ing+1; j++) {
							addContent+= '<input class="times" value="'+ (parseInt(open[0])+j)+':00' +'" readonly="readonly">';												
						}						
					}
					
					
					$(".time_box").empty();
					$(".time_box").append(addContent);
					$(".time_box").css("height", "auto");
					
					$(".times").click(function(){
						var timeval=$(this).val(); 
						var reserve_price=$("input[name=reserve_price]").val();
						if(datestr==null){
							timeval=null; 
							swal("날짜먼저 선택해주세요", "", "error");
						}else{
							$(".times_result").children("span").eq(1).text(timeval);
							$(".times_result").children("span").eq(2).text(","+reserve_price+"원");
							$(".times").css("background-color", "#edfbdc"); 
							$(".max_time").css("background-color", "lightgrey");
							$(this).css("background-color", "#00FF00");
							$(".reserve_success").css("display","inline");
							$("#reserve_time").val(timeval);
						} 
						
					})
					 
				})
					   
			}
		});
		
	
		$.ajax({
			url:"user_reservemax_ajax.do",
			method:"post",
			data:{"menu_seq":menu_seq,"store_seq":store_seq,"reserve_sdate":datestr,"store_time_day":store_time_day},
			async: false, 
			dataType:"json",
			success:function(obj){
				  var lists=obj.listMax;
				  var lists_chk=obj.listWeek;
				  var count=0; 
				  $.each(lists,function(i){
					    open=lists_chk[i].store_time_open.split(":");
						close=lists_chk[i].store_time_close.split(":");
// 					  	alert(typeof open[0]);
// 					  	alert("close:"+close[0]);				
					  	
					    var ing=parseInt(close[0])-parseInt(open[0]);	
					    var times_split=$(".times").val().split(":");
					    
// 							alert((parseInt(times_split[0])+0)+":00"); // 매장조건에맞게 화면에 뿌려지는 시간
// 							alert(lists[i].reserve_time);              // 예약시간
// 							alert(lists[0].ct);                        // 매장 그시간대 예약인원수
// 							alert(store_maxman);                       // 매장최대인원수
							
						//24시인 매장도있을경우
					    if(open[0]=="00"&&close[0]=="00"){ 
							for (var j = 0; j < 24; j++) {
								if(((parseInt(times_split[0])+j)+":00")==lists[i].reserve_time&&lists[i].ct==store_maxman){
						  			$("input[value='"+(parseInt(times_split[0])+j)+':00'+"']").css({"pointer-events":"none","background-color":"lightgrey"}).addClass("max_time");    		 
					  			} 
							} 
						}else{
							for (var j = 0; j < ing+1; j++) {  
						    	if(((parseInt(times_split[0])+j)+":00")==lists[i].reserve_time&&lists[i].ct==store_maxman){
						  			$("input[value='"+(parseInt(times_split[0])+j)+':00'+"']").css({"pointer-events":"none","background-color":"lightgrey"}).addClass("max_time");    		 
					  			} 
							}
						}
						
					  
					    
					    
				  }) 
			} 
		});
		
		
		
		

		$(".dayContainer > span").not(".flatpickr-disabled").not(".prevMonthDay").not(".nextMonthDay").each(function(){
			
			//요일별 휴무여부
			var getMon=$("input[name=mon]").val();
			var getTue=$("input[name=tue]").val();
			var getWed=$("input[name=wed]").val();
			var getThu=$("input[name=thu]").val();
			var getFri=$("input[name=fri]").val();
			var getSat=$("input[name=sat]").val();
			var getSun=$("input[name=sun]").val();
			//요일별 번호
			var monNum=parseInt($("input[name=monNum]").val())+1;
			var tueNum=parseInt($("input[name=tueNum]").val())+1;
			var wedNum=parseInt($("input[name=wedNum]").val())+1;
			var thuNum=parseInt($("input[name=thuNum]").val())+1;
			var friNum=parseInt($("input[name=friNum]").val())+1;
			var satNum=parseInt($("input[name=satNum]").val())+1;
			var sunNum=parseInt($("input[name=sunNum]").val())-6;
			
			if(getMon=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==monNum){//월
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			} 
			if(getTue=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==tueNum){//화
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getWed=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==wedNum){//수
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getThu=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==thuNum){//목
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getFri=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==friNum){//금
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getSat=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==satNum){//토
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getSun=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==sunNum){//일
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
		});
		
	}
	
	 

	
	$(function(){	
		//공백
		var emptyDay;
		//요일별 휴무여부
		var getMon=$("input[name=mon]").val();
		var getTue=$("input[name=tue]").val();
		var getWed=$("input[name=wed]").val(); 
		var getThu=$("input[name=thu]").val();
		var getFri=$("input[name=fri]").val();
		var getSat=$("input[name=sat]").val();
		var getSun=$("input[name=sun]").val();
		//요일별 번호
		var monNum=parseInt($("input[name=monNum]").val())+1;
		var tueNum=parseInt($("input[name=tueNum]").val())+1;
		var wedNum=parseInt($("input[name=wedNum]").val())+1;
		var thuNum=parseInt($("input[name=thuNum]").val())+1;
		var friNum=parseInt($("input[name=friNum]").val())+1;
		var satNum=parseInt($("input[name=satNum]").val())+1;
		var sunNum=parseInt($("input[name=sunNum]").val())-6;
		
		
		//store,menu seq
		var store_seq=$("input[name=store_seq]").val();
		var menu_seq=$("input[name=menu_seq]").val();
		
		//////////////////////////////////AJAX
		$(".flatpickr-months").click(function(){
			$.ajax({
				url:"user_reserve_time_ajax.do",
				method:"post",
				data:{"store_seq":store_seq,"menu_seq":menu_seq},
				dataType:"json",
				success:function(obj){
			
					$(".dayContainer > span").not(".flatpickr-disabled").not(".prevMonthDay").not(".nextMonthDay").each(function(){
						emptyDay=$(".prevMonthDay").length;
// 						alert(emptyDay);
						if(getMon=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==monNum){//월
								$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
							}
						}
						if(getTue=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==tueNum){//화
								$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
							}
						}
						if(getWed=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==wedNum){//수
								$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
							}
						}
						if(getThu=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==thuNum){//목
								$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
							}
						}
						if(getFri=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==friNum){//금
								$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
							}
						}
						if(getSat=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==satNum){//토
								$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
							}
						}
						if(getSun=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==sunNum){//일
								$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
							}
						}
						
						

					});
				}
			});
		});
		
		//첫로딩 
		$(".dayContainer > span").not(".flatpickr-disabled").not(".prevMonthDay").not(".nextMonthDay").each(function(){
			emptyDay=$(".prevMonthDay").length;
			if(getMon=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==monNum){//월
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getTue=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==tueNum){//화
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getWed=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==wedNum){//수
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getThu=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==thuNum){//목
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getFri=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==friNum){//금
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getSat=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==satNum){//토
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getSun=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==sunNum){//일
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			
			

		});
			
		
	}) 
	
	
	
	function reserveChk(){
		
		swal({
		     title: "예약 하시겠습니까?",
		     text: "",
		     icon: "info", //"info,success,warning,error" 중 택1
		     buttons: ["아니오", "예"],
		}).then((YES) => {
		     if (YES) {
		    	$(".form01").submit();
		     }else{
		    	 return false;
		     }
		});
		
		
// 		var result=confirm("예약 하시겠습니까?");
// 		if(result){
			
// 		}else{
// 			return false;
// 		}
	}
	
</script> 
</head>
<%
	List<MenuDto> list=(List<MenuDto>)request.getAttribute("list");
%>
<body>
<input type="hidden" name="mon" value="<%=list.get(0).getStore_time_break()%>"/><input type="hidden" name="monNum" value="<%=list.get(0).getRownum()%>"/>
<input type="hidden" name="tue" value="<%=list.get(1).getStore_time_break()%>"/><input type="hidden" name="tueNum" value="<%=list.get(1).getRownum()%>"/>
<input type="hidden" name="wed" value="<%=list.get(2).getStore_time_break()%>"/><input type="hidden" name="wedNum" value="<%=list.get(2).getRownum()%>"/>
<input type="hidden" name="thu" value="<%=list.get(3).getStore_time_break()%>"/><input type="hidden" name="thuNum" value="<%=list.get(3).getRownum()%>"/>
<input type="hidden" name="fri" value="<%=list.get(4).getStore_time_break()%>"/><input type="hidden" name="friNum" value="<%=list.get(4).getRownum()%>"/>
<input type="hidden" name="sat" value="<%=list.get(5).getStore_time_break()%>"/><input type="hidden" name="satNum" value="<%=list.get(5).getRownum()%>"/>
<input type="hidden" name="sun" value="<%=list.get(6).getStore_time_break()%>"/><input type="hidden" name="sunNum" value="<%=list.get(6).getRownum()%>"/>
<input type="hidden" name="store_maxman" value="<%=list.get(0).getStore_maxman()%>"/>
<form action="reserve_successT.do" class="form01" method="post">
<input type="hidden" name="store_seq" value="<%=list.get(0).getStore_seq()%>"/>
<input type="hidden" name="menu_seq" value="<%=list.get(0).getMenu_seq()%>"/>
<input type="hidden" name="reserve_price" value="<%=list.get(0).getMenu_price()%>"/>
<input type="hidden" name="reserve_time" id="reserve_time" value=""/>
<input type="hidden" name="reserve_sdate" id="reserve_sdate" value=""/>
	<div id="container">
		<div style="width:700px;margin:0 auto"> 
			<div class="sungsoobox">
				<input type="text" class="selector" placeholder="날짜를 선택하세요." onchange="aaa(this)"/>
				<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
			</div>
			<br><br>
			<div class="reserve_time_select" >
				<div class="time_box">	 
					
				</div>
					<div class="times_result">예약 시간 : <span></span>&nbsp;<span></span>&nbsp;<span></span><div class="reserve_success"  onclick="reserveChk()"/>예약하기</div></div> 
			</div>
		</div>
	</div>
</form>
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
<jsp:include page="../all/footer.jsp" /> 