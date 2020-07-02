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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
	.greenbtn:hover{background-color: #04B404;color:white} 
	.redbtn:hover{background-color: #FE2E2E;color:white} 
	.clrboth{clear: both;}
	.flright{float: right;}
	.flleft{float: left;}
	.btn{background-color: grey;margin-left:10px;color:white;}
	.btn2{margin-left:0px;}

	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#regist{font-weight: bold; font-size: 20px;margin-bottom: 40px;}
	 
	#tle{margin:0 auto;padding-top:40px;width: 800px;}
	.inputbox{margin-top:0px;margin-bottom:-5px; padding:26px 10px 26px;height:auto;width:800px; display: inline-block;border: 0px solid lightgrey;border-bottom-width: 1px;}
	.inputbox:hover{background-color: #f3f3f3;}
	.lastbox{border: 0px solid lightgrey;}
	.inputtitle{float:left;height:auto;line-height: 200%;padding-right:20px;width:140px;}
	textarea{margin-top:2px;resize: none;}
	.inputs{width:600px;float: left;height:auto;}
	
	.catechkboxes_big{width:150px;height:100px;float: left;}
	.catechkboxes{float: left;}
	.catechkbox{padding-bottom:10px;}
	input[name=category_code_small],input[name=category_code]{margin-left:10px;}
	
	.menu_name{vertical-align:middle; display: inline-block;width:100px;text-align: center;}
	.menu_price{vertical-align:middle;display: inline-block; width:100px;text-align: center;}
	.menu_price2{width: 150px;}
	.menu_reserve{width: 150px;margin-top: 5px;}
	.menubox_long{vertical-align:middle;display: inline-block; width:310px;text-align: center;}
	ul{list-style: none;padding:0px;display: inline-block;}
 	li{width:610px;float:left;padding:0px;margin:0px;} 
	.hidmenu{display: none;}
	
	.show_menu{margin-bottom:2.5px;position:relative;top:0px;height:24px; width:35px;line-height: 10px}
	.hide_menu{margin-bottom:2.5px;position:relative;top:0px;height:24px; width:35px;line-height: 10px}
	
	input[name=store_maxdate],input[name=store_maxman]{width:50px;background-color: #f0f0f0;border:1px solid grey}
	.subinfo{font-size:12px;color: grey;}
	#bot{margin:30px 10px 30px;}
	
	.big_cate{text-align:center;font-size:20px;font-weight:bold; height:30px;line-height: 30px;background-color: #f2f2f2;border-radius: 30px;}
	.subinfo{font-size:12px;color: grey;}
	
/* 	진행창 */
	.progressBox{width:700px; height:220px; margin: 0 auto;}
	.progress_each{
		width:150px; height:150px; background-color: #f2f2f2; border-radius: 50%; float:left;border:1px solid #fff;margin-left:20px;margin-top:40px;
		text-align: center;line-height: 150px;
		position:relative;
	}
	.progress_this{
		width:150px; height:150px; background-color: #f2f2f2; border-radius: 50%;float:left;border:1px solid #333;margin-left:20px;margin-top:40px;
		text-align: center;line-height: 150px;
		box-shadow: 4px 4px 4px #aaa;
		animation: animate-shadow 1s ease-in infinite;
	}
	.progress_ok{opacity:0.5;background-image: url("./img/check.png");background-size: 70px 70px;background-repeat: no-repeat;background-position: center;}
	@keyframes animate-shadow {
	     50% {box-shadow: 8px 8px 8px #aaa;}
	}
</style>
<script type="text/javascript">
	
	$(document).ready(function(){
		//대표카테고리 한개만 선택가능하게 하는 기능
		$("body").on("click","input:checkbox[name=category_code]", function() {
			
			if($(this).prop("checked")){
				$("input:checkbox[name=category_code]").prop("checked",false);
				$(this).prop("checked",true);
			}
		});
		
		//대표카테ㅇㅇ?
		var form=$("form")[0];
	    form.onsubmit=function(){ 
			var selectedCate="";
	    	var cateBoxes = $("input:checkbox[name=category_code]");
			for (var i = 0; i < cateBoxes.length; i++) {
				if(cateBoxes.eq(i).prop("checked")==true){
					selectedCate=cateBoxes.eq(i).val();
				}
			}
// 			alert(selectedCate.toLowerCase());
	    	var cateCount=0;
	    	var cateMainCount=0;
	    	var cateBoxesSmall = $("input:checkbox[name=category_code_small]");
			for (var i = 0; i < cateBoxesSmall.length; i++) {
				//모든 세부카테들을 돌면서 체크되어있는 체크박스가 있으면
				if(cateBoxesSmall.eq(i).prop("checked")==true){
					//일단카운트업하고
					cateCount++;
					//체크된 박스 중 각 세부카테들의 value안에 위에 구한 큰카테가 포함되어있다면
					if(cateBoxesSmall.eq(i).val().indexOf(selectedCate.toLowerCase())!=-1){
						cateMainCount++;
					}
				}
			}
// 			alert(selectedCate);

			//만약 cateCount가 0이면 return false
// 			alert("체크된 카테 수 : "+cateCount);
			
			//만약 cateCount가 1보다 큰데  return false
// 			alert("체크된 카테 중 대표카테고리에 포함된 카테 수 :"+cateMainCount);
			
			//만약 체크된 카테가 없거나 대표카테고리에 해당하는 카테가 없으면, 둘중 어떤거든 누락이라면 return false
	    	if(cateCount==0||cateMainCount==0){
	    		swal("카테고리 항목을 확인해주세요.","대표종류에 해당하는 한가지 이상의 항목에 체크해주세요!", "info");
	    		document.getElementsByClassName("inputbox")[0].scrollIntoView({behavior: "smooth"});
				return false;
	    	}
			
			if($("input[name=store_maxman]").prop("readonly")==false){
// 				alert("최대인원수 readonly 풀린상태입니다.")
				if($("input[name=store_maxman]").val()==0){
// 					alert("최대인원수 readonly 풀린상태인데 값이 0입니다.")
					swal("시간당 최대인원수를 입력해주세요.","*설명을 잘 읽고 적어주세요", "info"); 
					setTimeout(function() {
						$("input[name=store_maxman]").focus();
					},1000);
					return false;
				}
			}
			if($("input[name=store_maxdate]").prop("readonly")==false){
// 				alert("최대예약일 readonly 풀린상태입니다.")
				if($("input[name=store_maxdate]").val()==0){
// 					alert("최대예약일 readonly 풀린상태인데 값이 0입니다.")
					swal("최대 예약일을 입력해주세요.","*설명을 잘 읽고 적어주세요", "info"); 
					setTimeout(function() {
						$("input[name=store_maxdate]").focus();
					},1000);
					return false;
				}
			}
	    };
		
		
		//체크했을 때 : 같은값 없으면 추가, 같은값 있으면 추가안함
		//풀었을 때 : 같은값이 하나라도 없으면 그대로, 같은값이 하나라도 있어도 그대로
		//		새 방안 : 체크박스의 갯수를 세어야한다. 
		// 			추가하기:같은라인 div안에 체크된 박스가 하나라도 있다면 추가하고, 체크된 박스가 하나도 없으면 없애기
		// 			없애기:같은라인 div안에 체크된 박스가 하나라도 있다면 안없애고, 체크된 박스가 하나도 없으면 없애기
		$("body").on("change","input:checkbox[name=category_code_small]", function() {
			//체크한 박스와 일치하는 대분류를 찾아서 대분류의 이름을 변수에 저장해주는 실행문들 ---------------------------------------------
			
			var smallcate =$(this).val();//체크한 박스의 소분류
			var bigcate=["a","b","c","d","e","f","g","h","i"];
			var bigcatetext;//체크한 박스와 일치하는 대분류의 이름
			var cateval; 
			for(var i in bigcate){
				if(smallcate.indexOf(bigcate[i])!=-1){
					cateval=bigcate[i];
				}
			}
			switch(cateval){
				case "a": bigcatetext = "동물병원";
					break;
				case "b": bigcatetext = "카페/식당";
					break;
				case "c": bigcatetext = "식품/용품";
					break;
				case "d": bigcatetext = "숙박";
					break;
				case "e": bigcatetext = "돌봄서비스";
					break;
				case "f": bigcatetext = "미용";
					break;
				case "g": bigcatetext = "체험";
					break;
				case "h": bigcatetext = "분양/교배";
					break;
				case "i": bigcatetext = "장례";
					break;
			}
			//------------------------------------------------------------------------------------------
			var scate=$(this).parent().find("input:checkbox[name=category_code_small]");
			var scateval=0;
			for (var i = 0; i < scate.length; i++) {//체크된 박스와 같은라인의 체크박스들을 둘러봄
				if(scate.eq(i).is(":checked")==true){
					scateval+=1; //체크된게 하나도 없으면 0, 하나라도 있으면 0보다 큼
				}
			}
// 			alert("체크된 갯수:"+scateval);
			if(scateval==0){//체크된 박스가 하나도 없으면 (없애기)
// 				alert("체크된게 1개도 없어요");
				for (var i = 0; i < $(".big_cate").length; i++) {//현재 대분류의 갯수만큼 돌면서 내가 체크한 카테박스와 같은 이름의 대분류를 지워주기
					if($(".big_cate").eq(i).text().indexOf(bigcatetext)!=-1){//대분류중에 카테박스에 해당하는 대분류가 있으면
																			//다른말로는 :이번 턴의 대분류가 내가 체크한 박스의 대분류와 같으면
						$(".big_cate").eq(i).parent().parent("ul").remove();
					}
				}
			}
			if(scateval==1){//체크된 박스가 하나 있으면 추가하기
// 				alert("1개가 체크되었습니다.");
				//지금 누른 체크박스가 체크되어있을 경우에만 해당: 체크를 풀때는 적용되지 않음
				if($(this).is(":checked")==true){
// 					alert("체크를 눌때 조건에 충족했으니 추가합니다.");
					$("#menubigbox").append(
							'<ul class="menuboxes">'+
								'<li>'+
								'<div class="big_cate">'+bigcatetext+' 메뉴</div>'+
								'<input type="hidden" name="category_code_ex" value="'+cateval.toUpperCase()+'">'+
								'<br>'+
							'</li>'+
							'<li>'+
								'<span class="menu_name">메뉴명</span>'+
								'<span class="menubox_long">설명</span>'+
								'<span class="menu_price" style="width: 145px;">가격 / 예약</span>'+
								'<span class="menu_name"></span>'+
							'</li> '+
							'<li>'+
								'<input type="hidden" name="category_code_2" value="'+cateval.toUpperCase()+'">'+
								'<input class="menu_name form-control" type="text" name="menu_name" placeholder="메뉴명" required="required"/> '+
								'<textarea rows="3" class="menubox_long form-control" type="text" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~"  required="required"></textarea> '+
								'<div class="menu_price">'+
									'<div class="menu_price2">'+
									'가격'+
									' <input class="menu_price form-control" type="text" name="menu_price" placeholder="10000" required="required"/>'+
									'</div>'+
									'<div class="menu_reserve">'+
									'예약'+
									' <select class="settime form-control menu_price" name="menu_state">'+
										'<option value="N">미사용</option>'+
										'<option value="T">시간제</option>'+
										'<option value="S">숙박제</option>'+
									'</select>'+
									'</div>'+
								'</div>'+
								'<span class="show_menu flright btn btn2 menu_price btn" >'+
									'+'+
								'</span>'+
							'</li> '+
// 							'<li>'+
// 								'<input class="menu_name form-control" type="text" name="menu_name" placeholder="멍멍개껌"/>'+
// 								'<textarea rows="3" class="menubox_long form-control" type="text" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~"></textarea>'+
// 								'<div class="menu_price">'+
// 									'<div class="menu_price2">'+
// 									'가격'+
// 									'<input class="menu_price form-control" type="text" name="menu_price" placeholder="10000"/>'+
// 									'</div>'+
// 									'<div class="menu_reserve">'+
// 									'예약'+
// 									'<select class="settime form-control menu_price" name="menu_state">'+
// 										'<option value="N">미사용</option>'+
// 										'<option value="T">시간제</option>'+
// 										'<option value="S">숙박제</option>'+
// 									'</select>'+
// 									'</div>'+
// 								'</div>'+
// 								'<span class="flright btn btn2 menu_price hide_menu">'+
// 									'-'+
// 								'</span>'+
// 							'</li> '+
						'</ul>');
				}
			}
			if(scateval>1){//체크된 박스가 2개 이상이면 아무기능도 안하기
// 				alert("이미 1개이상 체크되어있어요.");
			}
			
		});
		
		$("body").on("click",".show_menu", function() {
			var cateval = $(this).parent().parent().find("input[name=category_code_ex]").val();
// 			alert(cateval);
			$(this).parent().parent($(".menuboxes")).append(
			'<li>'+
				'<input type="hidden" name="category_code_2" value="'+cateval.toUpperCase()+'"/>'+
				'<input class="menu_name form-control" type="text" name="menu_name" placeholder="멍멍개껌" required="required"/> '+
				'<textarea rows="3" class="menubox_long form-control" type="text" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~" required="required"></textarea> '+
				'<div class="menu_price">'+
					'<div class="menu_price2">'+
					'가격 '+
					'<input class="menu_price form-control" type="text" name="menu_price" placeholder="10000" required="required"/>'+
					'</div>'+
					'<div class="menu_reserve">'+
					'예약 '+
					'<select class="settime form-control menu_price" name="menu_state">'+
						'<option value="N">미사용</option>'+
						'<option value="T">시간제</option>'+
						'<option value="S">숙박제</option>'+
					'</select>'+
					'</div>'+
				'</div>'+
				'<span class="flright btn btn2 menu_price hide_menu">'+
					'-'+
				'</span>'+
			'</li>');
		});
		
		$("body").on("click",".hide_menu",function(){
			$(this).parent("li").remove();
		});
		
// 		$("body").on("click",".settime",function(){
// 			$('div.modal').modal();
// 		})

		//만약 메뉴등록에서 예약 셀렉트박스에 시간제, 숙박제가 있을 경우
		//readonly 풀어주기
// 		$("body").on("change",".settime",function(){
// 			if($(this).val()=="T"){
// 				alert("당일:시간제");
// 				$("input[name=store_maxman]").removeAttr("readonly");
// 			}else if($(this).val()=="S"){
// 				alert("숙박:숙박제");
// 				$("input[name=store_maxdate]").removeAttr("readonly");
// 			}
// 		});
		//만약 메뉴등록에서 예약 셀렉트박스에 시간제, 숙박제가 있다가 없어질 경우
		//readonly 다시 주기
		$("body").on("change",".settime",function(){
			var n=0;
			var t=0;
			var s=0;
			for (var i = 0; i < $("input[name=menu_name]").length; i++) {
				if($(".settime").eq(i).val()=="S"){
					s++;
				}else if($(".settime").eq(i).val()=="T"){
					t++;
				}else if($(".settime").eq(i).val()=="N"){
					n++;
				}
			}
			if(s>0){ //'숙박제'가 0보다크면 readonly 없애기
// 				alert("숙박제가 입력가능해집니다");
				$("input[name=store_maxdate]").removeAttr("readonly");
				$("input[name=store_maxdate]").css("background-color","white");
			}
			if(t>0){ //'시간제'가 0보다크면 readonly 없애기
// 				alert("시간제가 입력가능해집니다");
				$("input[name=store_maxman]").removeAttr("readonly");
				$("input[name=store_maxman]").css("background-color","white");
				
			}

			if(s==0){ //'숙박제'가 0이면 안에 값 지우고readonly 처리
// 				alert("숙박제가 리드온리처리됩니다.");
				$("input[name=store_maxdate]").val("0");
				$("input[name=store_maxdate]").attr("readonly","readonly");
				$("input[name=store_maxdate]").css("background-color","#f2f2f2");
			}
			if(t==0){ //'시간제'가 0이면 안에 값 지우고 readonly 처리
// 				alert("시간제가 리드온리처리됩니다.");
				$("input[name=store_maxman]").val("0");
				$("input[name=store_maxman]").attr("readonly","readonly");
				$("input[name=store_maxman]").css("background-color","#f2f2f2");
			}
		});
		
// 		$("#testform").submit(function(){
// // 			$("input[name=store_maxman]").trigger('click') ;
// 			$(".lastbox input").each(function(){
// 				if($(this).val()=="0"){
// 					$(this).val("0");
// 				}
// 			});
			
// 		});
	});
	
	
	

</script>
</head>
<body>
<div id="container">
	<div class="progressBox">
		<div class="progress_each progress_ok">사업자등록번호 인증</div>
		<div class="progress_each progress_ok">매장정보 입력</div>
		<div class="progress_each progress_this">메뉴정보 입력</div>
		<div class="progress_each">신청완료</div>
	</div>
<!-- <div class="modal fade" id="layerpop" > -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       header -->
<!--       <div class="modal-header"> -->
<!--         닫기(x) 버튼 -->
<!--         <button type="button" class="close" data-dismiss="modal">×</button> -->
<!--         header title -->
<!--         <h4 class="modal-title">Header</h4> -->
<!--       </div> -->
<!--       body -->
<!--       <div class="modal-body"> -->
<!--             flkqnwkrtj -->
<!--       </div> -->
<!--       Footer -->
<!--       <div class="modal-footer"> -->
<!--         Footer -->
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
<!--       header -->
<!--       <div class="modal-header"> -->
<!--         닫기(x) 버튼 -->
<!--         <button type="button" class="close" data-dismiss="modal">×</button> -->
<!--         header title -->
<!--         <h4 class="modal-title">Header</h4> -->
<!--       </div> -->
<!--       body -->
      <div class="modal-body">
            
        <button type="button" class="btn btn-default" data-dismiss="modal">시간예약제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">숙박예약제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">설정안함제</button>
      </div>
<!--       Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
	<form id="testform" action="owner_insert_menu.do" method="post">
		<div id="tle">
			<div id="regist" class="testmod">
				서비스/메뉴 정보 입력
			</div> 
			<div>
				<div class="inputbox">
					<div class="inputtitle">매장종류</div>
					<div class="inputs">
						<div class="catechkboxes_big">
							<div class="catechkbox">
								<div>대표 매장종류</div>
								<div class="subinfo">*한가지만 선택</div>
								<div class="subinfo">*지도위의 아이콘용</div>
								
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A"/>동물병원
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="B"/>카페/식당
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="C"/>식품/용품
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="D"/>숙박
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="E"/>돌봄서비스
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="F"/>미용
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="G"/>체험
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="H"/>분양/교배
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="I"/>장례
							</div>
						</div>
						<div class="catechkboxes">
							<div class="catechkbox">
								<div>해당되는 항목을 모두 체크해주세요</div>
								<div class="subinfo">*대표 매장종류에 해당되지 않아도 선택 가능합니다</div>
								<div class="subinfo">&nbsp;</div>
								
								
							</div> 
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="a1"/>종합
								<input type="checkbox" name="category_code_small" value="a2"/>내과
								<input type="checkbox" name="category_code_small" value="a3"/>외과
								<input type="checkbox" name="category_code_small" value="a4"/>치과
								<input type="checkbox" name="category_code_small" value="a5"/>24시
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="b1"/>동반가능 카페
								<input type="checkbox" name="category_code_small" value="b2"/>동반가능 식당
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="c1"/>용품
								<input type="checkbox" name="category_code_small" value="c2"/>식품
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="d1"/>글램핑/카라반
								<input type="checkbox" name="category_code_small" value="d2"/>펜션
								<input type="checkbox" name="category_code_small" value="d3"/>풀빌라
								<input type="checkbox" name="category_code_small" value="d4"/>호텔
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="e1"/>호텔
								<input type="checkbox" name="category_code_small" value="e2"/>펫시터
								<input type="checkbox" name="category_code_small" value="e3"/>유치원
								<input type="checkbox" name="category_code_small" value="e4"/>펫택시
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="f1"/>미용
								<input type="checkbox" name="category_code_small" value="f2"/>목욕
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="g1"/>놀이터
								<input type="checkbox" name="category_code_small" value="g2"/>운동장
								<input type="checkbox" name="category_code_small" value="g3"/>훈련
								<input type="checkbox" name="category_code_small" value="g4"/>수영장
								<input type="checkbox" name="category_code_small" value="g5"/>스튜디오
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="h1"/>분양 
								<input type="checkbox" name="category_code_small" value="h2"/>교배
								<input type="checkbox" name="category_code_small" value="h3"/>유기견
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="i1"/>장례
							</div>
						</div>
					</div>
				</div>
				
				<div class="inputbox">
					<div class="inputtitle">메뉴등록</div>
					<div id="menubigbox" class="inputs">
<!-- 					<ul class="menuboxes"> -->
<!-- 						<li> -->
<!-- 							<div class="big_cate">동물병원 메뉴</div> -->
<!-- 							<br> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<span class="menu_name">메뉴명</span> -->
<!-- 							<span class="menubox_long">설명</span> -->
<!-- 							<span class="menu_price" style="width: 145px;">가격 / 예약</span> -->
<!-- 							<span class="menu_name"></span> -->
<!-- 						</li>  -->
<!-- 						<li> -->
<!-- 							<input class="menu_name form-control" type="text" name="menu_name" placeholder="메뉴명"/> -->
<!-- 							<textarea rows="3" class="menubox_long form-control" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~"></textarea> -->
<!-- 							<div class="menu_price"> -->
<!-- 								<div class="menu_price2"> -->
<!-- 								가격 -->
<!-- 								<input class="menu_price form-control" type="text" name="menu_price" placeholder="10000"/> -->
<!-- 								</div> -->
<!-- 								<div class="menu_reserve"> -->
<!-- 								예약 -->
<!-- 								<select class="settime form-control menu_price" name="menu_state"> -->
<!-- 									<option value="N">미사용</option> -->
<!-- 									<option value="T">시간제</option> -->
<!-- 									<option value="S">숙박제</option> -->
<!-- 								</select> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<span class="show_menu flright btn btn2 menu_price btn" > -->
<!-- 								+ -->
<!-- 							</span> -->
<!-- 						</li>  -->
<!-- 						<li> -->
<!-- 							<input class="menu_name form-control" type="text" name="menu_name" placeholder="멍멍개껌"/> -->
<!-- 							<textarea rows="3" class="menubox_long form-control" type="text" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~"></textarea> -->
<!-- 							<div class="menu_price"> -->
<!-- 								<div class="menu_price2"> -->
<!-- 								가격 -->
<!-- 								<input class="menu_price form-control" type="text" name="menu_price" placeholder="10000"/> -->
<!-- 								</div> -->
<!-- 								<div class="menu_reserve"> -->
<!-- 								예약 -->
<!-- 								<select class="settime form-control menu_price" name="menu_state"> -->
<!-- 									<option value="N">미사용</option> -->
<!-- 									<option value="T">시간제</option> -->
<!-- 									<option value="S">숙박제</option> -->
<!-- 								</select> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<span class="flright btn btn2 menu_price hide_menu"> -->
<!-- 								- -->
<!-- 							</span> -->
<!-- 						</li>  -->
<!-- 					</ul> -->
					</div>
				</div>
				<div class="inputbox lastbox">
					<div class="inputtitle">예약관련 설정</div>
					<div class="inputs">
						<div>※최대 예약일 : <input type="number" min="0" max="180" name="store_maxdate" placeholder="0" value="0" readonly/>일</div>
						<div class="subinfo">*최대 몇 일까지 예약 가능한가요? 1박2일의 경우 : 2일</div>
						<div class="subinfo">*숙박제 예약메뉴가 있는경우에 한해 작성가능합니다.</div>
						<div class="subinfo">*모든 숙박제에 공통으로 적용됩니다.</div>
						<div class="subinfo">*최대 1개월(30일)까지 작성할 수 있습니다.</div>
						<br>
						<div>※시간당 최대 허용인원 : <input type="number" min="0" max="200" name="store_maxman" placeholder="0" value="0" readonly/>명</div>
						<div class="subinfo">*한시간에 몇 명의 예약을 받을 수 있나요?</div>
						<div class="subinfo">*시간제 예약메뉴가 있는경우에 한해 작성가능합니다.</div>
						<div class="subinfo">*모든 숙박제에 공통으로 적용됩니다.</div>
						<div class="subinfo">*최대 한시간당 200명까지 등록할 수 있습니다.</div>
					</div>
				</div>
			
				<br>
					<div id="bot" class="flright" >
						<input class="btn greenbtn" value="이전 단계로" onclick="location.href='owner_toUpdate_store.do'" type="button"/>
						<input class="btn redbtn" value="취소" onclick="location.href='index.do'" type="button"/>
						<input class="btn greenbtn" value="입점신청" type="submit"/>
					</div>
					<br>
					<br>
					<br><br>
					<br>
					<br>
				
			</div>
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />