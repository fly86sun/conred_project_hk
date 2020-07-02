<%@page import="com.hk.conred.dtos.ReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk.conred.dtos.MenuDto"%>
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
/* 	.selector{display: none;} */
	#container{box-sizing:border-box; border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; width:1000px;margin: 0 auto;background-color: #f5f5f5;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	.flatpickr-calendar{margin: 0 auto; width: 600px !important; height: 400px !important;}
	.flatpickr-rContainer{margin: 0 auto !important;}
	.day_result_box{width: 355px;margin: 0 auto;border:solid #D8D8D8;border-width:1px 0 1px 0;  height: 40px;line-height: 40px; margin-top: 60px;margin-bottom: 400px;}
	.selector{display: none;}
	.reserve_success{width: 100px;height: 25px; margin-left: 20px;font-size: 15px;line-height: 26px;border-width:0; display: none;border-radius: 10px;font-weight: bold;} 
	.reserve_success:hover {background-color: lightgrey;font-size: 18px;cursor: pointer;}
 	.gongback{display: none;} 
	
	
</style> 
<script> 
	
	function choiceMonth(d){
		for (var i = 0; i < 12; i++) {
			var month=isMonth($(".flatpickr-monthDropdown-month").eq(i).text());					
		}

	}

	
	function isMonth(d){
		var mm="";
		switch (d) {
		case "January":
			mm="01";
			break;
		case "February":
			mm="02";
			break;
		case "March":
			mm="03";
			break;
		case "April":
			mm="04";
			break;
		case "May":
			mm="05";
			break;
		case "June":
			mm="06";
			break;
		case "July":
			mm="07";
			break;
		case "August":
			mm="08";
			break;
		case "September":
			mm="09";
			break;
		case "October":
			mm="10";
			break;
		case "November":
			mm="11";
			break;
		case "December":
			mm="12";
			break;
		} 
		return mm;
	}
	 
	 //공백
	 var emptyDay=$(".prevMonthDay").length;
//		1590969600000
// 	 function printDate(numS,numE,resultDay){  매장에 해당날짜에대해 상품이 예약되있으면 그날짜전부 예약못하게하는기능 /미구현
// 		var month=isMonth($(".flatpickr-monthDropdown-month").eq(0).text());
// 		var year=$(".cur-year").val();
// 		var today=$(".today").text();	
// 		 var s=numS.getDate();
// 		 for(var i=0;i<resultDay+1;i++){ 
// 			 $(".flatpickr-day").not(".flatpickr-disabled").not(".nextMonthDay").each(function(){
// 				if($(this).text()==(s+i)){
// 					$(this).css("background-color","red");
// // 					 alert($(this).text()*1000*60*60*24);
// 				} 
// 			 });	 
// 		 }
// 	 }//printDate()
	 
	 $(function(){ 
// 		 ((endDay.getTime()-startDay.getTime()/(1000*60*60*24)));       //  1초---> 1000ms
// 			var stay=$("input[name=stay]").val(); 
// 			var month=isMonth($(".flatpickr-monthDropdown-month").eq(0).text());
// 			var year=$(".cur-year").val();
// 		 	for (var i = 0; i < stay; i++) { 
// 			 	var numS=new Date($("input[name=sall"+i+"]").val());
// 			 	var numE=new Date($("input[name=eall"+i+"]").val()); 
			 	
// 			 	if(numS.getMonth()+1==parseInt(month)&&numS.getFullYear()==year){
// 				 	var getTimeS=numS.getTime();
// 				 	var getTimeE=numE.getTime(); 
// 				 	var resultDay=(getTimeE-getTimeS)/(1000*60*60*24); //일수
// 				 	printDate(numS, numE, resultDay);			 		
// 			 	}
			 			 	
// 			 	//해당 월의 마지막 날을 구해서 그날 보다 값이 커지면 1로 바꿔줌
// 				//사이 3일 ---> 2020-06-16 + 17  18  19
// // 				var day_resultS=$("input[name=sall"+i+"]").val(); 
// //  			var day_resultE=$("input[name=eall"+i+"]").val();
// 				//시작일의 날짜, 종료일의 날짜, 일수
// 			}//for()

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
		
				
				
				
				//////////////////////////////////AJAX
				$(".flatpickr-months").click(function(){
					
					////////////////////////////////////////////
// 					var stay=$("input[name=stay]").val(); 
// // 					alert(isMonth($(".flatpickr-monthDropdown-month").text());
// // 					for (var i = 0; i < 12; i++) {
// // 						var month=isMonth($(".flatpickr-monthDropdown-month").eq(i).text());					
// // 					}
// 					var year=$(".cur-year").val(); 
// 				 	for (var i = 0; i < stay; i++) { 
// 					 	var numS=new Date($("input[name=sall"+i+"]").val());
// 					 	var numE=new Date($("input[name=eall"+i+"]").val()); 
// 					 	var month=isMonth($(".flatpickr-monthDropdown-month").eq(i).text());
					 
// 					 	console.log(month);
// 					 	if(numS.getMonth()+1==parseInt(month)&&numS.getFullYear()==year){
// 						 	var getTimeS=numS.getTime();
// 						 	var getTimeE=numE.getTime(); 
// 						 	var resultDay=(getTimeE-getTimeS)/(1000*60*60*24); //일수
// 						 	printDate(numS, numE, resultDay); 			 		
// 					 	}
// 					} 
				 	
				 	/////////////////////
				 	var store_seq=$("input[name=store_seq]").val();
				var menu_seq=$("input[name=menu_seq]").val(); 
				/////////////////////
				$.ajax({
						url:"user_reserve_time_ajax.do",
						method:"post",
						data:{"store_seq":store_seq,"menu_seq":menu_seq},
						dataType:"json",
						success:function(obj){
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
						}
					});
				 	
				 	
				 	/////////////////
				 	
				 	
					})//months.click()
				 	//////////////////////////////////////////////
			
				});
				 
				
				
				
				
				
				///////////////////
		
	 	});
	 
// 	 	$(".flatpickr-months").click(function(){
			
// 			////////////////////////////////////////////
// 			var stay=$("input[name=stay]").val(); 
// //				alert(isMonth($(".flatpickr-monthDropdown-month").text());
// //				for (var i = 0; i < 12; i++) {
// //					var month=isMonth($(".flatpickr-monthDropdown-month").eq(i).text());					
// //				}
// 			var year=$(".cur-year").val(); 
// 		 	for (var i = 0; i < stay; i++) { 
// 			 	var numS=new Date($("input[name=sall"+i+"]").val());
// 			 	var numE=new Date($("input[name=eall"+i+"]").val()); 
// 			 	var month=isMonth($(".flatpickr-monthDropdown-month").eq(i).text());
			 
// 			 	console.log(month);
// 			 	if(numS.getMonth()+1==parseInt(month)&&numS.getFullYear()==year){
// 				 	var getTimeS=numS.getTime();
// 				 	var getTimeE=numE.getTime(); 
// 				 	var resultDay=(getTimeE-getTimeS)/(1000*60*60*24); //일수
// 				 	printDate(numS, numE, resultDay); 			 		
// 			 	}
// 			}
// 	 })
	var datestr; 
	function aaa(ele){
		 
		
		//////////////////////////////////////////// 
// 		var stay=$("input[name=stay]").val(); 
// 		var month=isMonth($(".flatpickr-monthDropdown-month").eq(0).text());
// 		var year=$(".cur-year").val();
// 	 	for (var i = 0; i < stay; i++) { 
// 		 	var numS=new Date($("input[name=sall"+i+"]").val());
// 		 	var numE=new Date($("input[name=eall"+i+"]").val()); 
		 	
// 		 	if(numS.getMonth()+1==parseInt(month)&&numS.getFullYear()==year){
// 			 	var getTimeS=numS.getTime();
// 			 	var getTimeE=numE.getTime(); 
// 			 	var resultDay=(getTimeE-getTimeS)/(1000*60*60*24); //일수
// 			 	printDate(numS, numE, resultDay);			 		
// 		 	}
// 		}
	 	//////////////////////////////////////////////
		
		
// 		alert($(".flatpickr-day").text());
		datestr=$(".selector").val();
		
		var dates=datestr.split("to");
		var startDay=new Date(dates[0]);
		var endDay=new Date(dates[1]); 
		$("#reserve_sdate").val(dates[0]); 
		$("#reserve_edate").val(dates[1]);
	
		
		var resultDay=Math.ceil((endDay.getTime()-startDay.getTime())/(1000*60*60*24));
		$(".day_result_box").children("span").eq(0).text(dates[0]);
		$(".day_result_box").children("span").eq(1).text(dates[1]); 
		
		
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
		
		var store_maxdate=$("input[name=store_maxdate]").val();
		if(resultDay>store_maxdate-1){
			swal(store_maxdate+"일을 넘길수 없습니다.", "", "info");//info,success,error,warning
			$(".selector").val("");
			$(".flatpickr-day").removeClass("selected startRange endRange inRange"); 
			$(".day_result_box").children("span").empty();
			$(".gongback").css("display", "none"); 
			$(".reserve_success").css("display", "none");
		}
		
		//~마지막 요일 찍을시
		if($(".endRange").length==1){
			var rs;
			var re;
			
	 		if(dates.length==1){
	 			swal("1박 이상 가능한 상품입니다", "", "error");
	 			
	 		}else{
				var rs=dates[0].split("-");
		 		var re=dates[1].split("-"); 
	 			sai();
	 		}
	 		function sai() {
				
			
	 		
				var date_price=(parseInt(re[2])-parseInt(rs[2]));//숙박기간
				var price_result=$("input[name=reserve_price]").val()*date_price;//숙박기간*1박가격
				$("#reserve_pirce").val(price_result);   
				
				$(".reserve_success").css("display", "inline") ;
				$(".gongback").css("display", "inline");	
				
				//
				var result=$(".reserve_success");
				var gong=$(".gongback");
				var box=$(".day_result_box");
				//
				
				$.each($(".inRange"),function(i){
	// 				alert($(".inRange").eq(i).text()); 			
					if(getMon=="Y"){
						if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==monNum){//월
							result.css("display", "none"); 
							gong.css("display", "none");
							box.find("span").text("");
							$(".flatpickr-day").removeClass("selected startRange endRange inRange");
							swal("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요", "", "error"); 
						} 
					} 
					if(getTue=="Y"){
						if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==tueNum){//화
							result.css("display", "none"); 
							gong.css("display", "none");
							box.find("span").text(""); 
							$(".flatpickr-day").removeClass("selected startRange endRange inRange");
							swal("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요", "", "error");
						}
					}
					if(getWed=="Y"){
						if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==wedNum){//수
							result.css("display", "none"); 
							gong.css("display", "none");
							box.find("span").text("");
							$(".flatpickr-day").removeClass("selected startRange endRange inRange");
							swal("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요", "", "error");
						}
					}
					if(getThu=="Y"){
						if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==thuNum){//목
							result.css("display", "none"); 
							gong.css("display", "none");
							box.find("span").text(""); 
							$(".flatpickr-day").removeClass("selected startRange endRange inRange");
							swal("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요", "", "error");
						}
					}
					if(getFri=="Y"){
						if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==friNum){//금
							result.css("display", "none"); 
							gong.css("display", "none");
							box.find("span").text("");
							$(".flatpickr-day").removeClass("selected startRange endRange inRange");
							swal("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요", "", "error");
						}
					}
					if(getSat=="Y"){
						if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==satNum){//토
							result.css("display", "none"); 
							gong.css("display", "none");
							box.find("span").text("");
							$(".flatpickr-day").removeClass("selected startRange endRange inRange");
							swal("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요", "", "error");
						}
					}
					if(getSun=="Y"){
						if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==sunNum){//일
							result.css("display", "none"); 
							gong.css("display", "none");
							box.find("span").text("");
							$(".flatpickr-day").removeClass("selected startRange endRange inRange");
							swal("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요", "", "error");
						}
					}
					
					
					
				});
			
			
			
			
			
	 		}
			
		
			
			
			
		} 
		
		
		//일수선택시
		$(".dayContainer > span").not(".flatpickr-disabled").not(".prevMonthDay").not(".nextMonthDay").each(function(){
			
			
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
	List<ReserveDto> stay_reserve_list=(List<ReserveDto>)request.getAttribute("stay_reserve_list");
%> 
<%!
	
%>
<body>
<input type="hidden" name="mon" value="<%=list.get(0).getStore_time_break()%>"/><input type="hidden" name="monNum" value="<%=list.get(0).getRownum()%>"/>
<input type="hidden" name="tue" value="<%=list.get(1).getStore_time_break()%>"/><input type="hidden" name="tueNum" value="<%=list.get(1).getRownum()%>"/>
<input type="hidden" name="wed" value="<%=list.get(2).getStore_time_break()%>"/><input type="hidden" name="wedNum" value="<%=list.get(2).getRownum()%>"/>
<input type="hidden" name="thu" value="<%=list.get(3).getStore_time_break()%>"/><input type="hidden" name="thuNum" value="<%=list.get(3).getRownum()%>"/>
<input type="hidden" name="fri" value="<%=list.get(4).getStore_time_break()%>"/><input type="hidden" name="friNum" value="<%=list.get(4).getRownum()%>"/>
<input type="hidden" name="sat" value="<%=list.get(5).getStore_time_break()%>"/><input type="hidden" name="satNum" value="<%=list.get(5).getRownum()%>"/>
<input type="hidden" name="sun" value="<%=list.get(6).getStore_time_break()%>"/><input type="hidden" name="sunNum" value="<%=list.get(6).getRownum()%>"/>
<input type="hidden" name="stay" value="<%=stay_reserve_list.size()%>">
<input type="hidden" name="store_maxdate" value="<%=stay_reserve_list.get(0).getStore_maxdate()%>"/>
<% 
	for(int i=0;i<stay_reserve_list.size();i++){
		%>
			<input type="hidden" name="sall<%=i%>" value="<%=stay_reserve_list.get(i).getReserve_sdate()%>"/>
		<%
	}
	for(int i=0;i<stay_reserve_list.size();i++){ 
		%>
			<input type="hidden" name="eall<%=i%>" value="<%=stay_reserve_list.get(i).getReserve_edate()%>"/>
		<%
	}
%>

<form action="reserve_successS.do" method="post" class="form01">
<input type="hidden" name="store_seq" value="<%=list.get(0).getStore_seq()%>"/>
<input type="hidden" name="menu_seq" value="<%=list.get(0).getMenu_seq()%>"/>
<input type="hidden" name="reserve_price" id="reserve_pirce" value="<%=list.get(0).getMenu_price()%>"/>
<input type="hidden" name="reserve_sdate" id="reserve_sdate" value=""/>
<input type="hidden" name="reserve_edate" id="reserve_edate" value=""/>

	<div id="container"> 
		<div style="width: 200px;margin-left: 450px;margin-top: 100px;"><b>연박</b>:최대<%=stay_reserve_list.get(0).getStore_maxdate()%>일까지 가능</div> 
		<div class="sungsoobox">
			<input type="text" class="selector" placeholder="날짜를 선택하세요." onchange="aaa(this)"/>
			<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
		</div>
		<div class="day_result_box">예약 날짜 : <span></span><p class="gongback"> ~ </p><span></span><div onclick="reserveChk()" class="reserve_success" />예약하기</div></div>
	</div>
</form>
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
<jsp:include page="../all/footer.jsp" /> 