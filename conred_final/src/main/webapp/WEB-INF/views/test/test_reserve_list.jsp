<%@page import="com.hk.conred.dtos.ReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk.conred.dtos.UDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	List<ReserveDto> list=(List<ReserveDto>)request.getAttribute("list");
%>
<body>
<h1><%=list.get(0).getUser_id()%>님의 예약목록</h1>
<table>
	<tr>
		<th>예약일렬번호</th>
		<th>메뉴일렬번호</th>
		<th>매장일렬번호</th>
		<th>예약시간</th>
		<th>예약상태</th>
		<th>메뉴(서비스)가격</th>
		<th>예약등록일</th>
	</tr>
	<%
		for(ReserveDto dto: list){
	%>
	
	<tr>
		<td><%=dto.getReserve_seq()%></td>
		<td><%=dto.getMenu_seq()%></td>
		<td><%=dto.getStore_seq()%></td>
		<td><%=dto.getReserve_time()%></td>
		<td style="color:red;font-weight: bold;"><%=isY(dto.getReserve_state())%></td>
		<td><%=dto.getReserve_price()%></td>
		<td><%=dto.getReserve_regdate()%></td>
		<td><a href="test_reserve_detail.do?reserve_seq=<%=dto.getReserve_seq()%>">결제하기</a></td>
	</tr>    
	<%
		} 
	 %>
</table>
<%!
	public String isY(String m){
		if(m.equals("R")){				//Reservation
			return "진행중";				//예약은했지만 결제는 안한 상태
		}else if(m.equals("P")){		//Payed
			return "결제완료";				//결제가 완료된 상태
		}else if(m.equals("C")){		//Canceled
			return "예약취소";				//예약을 취소했거나, 결제를 하지않아 취소된 상태
		}else if(m.equals("O")){		//Over
			return "리뷰 남기거나 리뷰 기간만료";	//예약후 결제까지 한 사람이 리뷰을 남기거나 리뷰기간(2주)이 만료된 상태
		}else{
			return "";
		}
	}
%>
</body>
</html>