<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="com.hk.conred.dtos.ReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script> -->
<%
	ReserveDto dto=(ReserveDto)request.getAttribute("dto");
	UDto uldto=(UDto)session.getAttribute("uldto");
%>
<script type="text/javascript">
function requestPay(){
	var IMP=window.IMP;
	IMP.init('imp83419041');
	
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card',
	    merchant_uid : '<%=dto.getReserve_seq()%>',   
	    name : '주문명:결제테스트asd',
	    amount : 1, 
	    buyer_email : 'sdasdff4@naver.com',
	    buyer_name : '<%=uldto.getUser_name()%>',
	    buyer_addr : '서울특별시 강남구 삼성동'
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
	    	
// 	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID asd: ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID asd: ' + rsp.merchant_uid;
	    			msg += '\결제 금액asd : ' + rsp.paid_amount;
	    			msg += '카드 승인번호asd : ' + rsp.apply_num;
// 	    			location.href='test_reserve_success.do?msg='+msg;
	    			alert(msg);
// 	    		} else {
// 	    			alert("ㅜㅜ")
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
// 	    		}
	            
	    	});
	    	var msg = '결제가 완료되었습니다.';
			msg += '\n고유ID asd: ' + rsp.imp_uid;
			msg += '\n상점 거래ID asd: ' + rsp.merchant_uid;
			msg += '\결제 금액asd : ' + rsp.paid_amount;
			msg += '카드 승인번호asd : ' + rsp.apply_num;
	    	//성공시 이동할 페이지
			location.href='test_reserve_success.do?msg='+msg;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg); 
	    }
	});
	
}
</script>
</head>
<body>
<h1>예약 상세페이지</h1>	
<label>아이디:<%=dto.getUser_id()%></label>
<label>매뉴일렬번호:<%=dto.getMenu_seq()%></label>
<label>매장일렬번호:<%=dto.getStore_seq()%></label>
<label>예약시간:<%=dto.getReserve_time()%></label>
<label>예약상태:<%=dto.getReserve_state()%></label>
<label>메뉴(서비스)가격:<%=dto.getReserve_price()%></label>
<label>예약등록일:<%=dto.getReserve_regdate()%></label>
<button onclick="requestPay()">결제하기</button>
</body>
</html>