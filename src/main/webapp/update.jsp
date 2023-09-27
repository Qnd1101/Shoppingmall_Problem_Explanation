<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%
	String sql = "select * FROM member_tbl_02 where custno = ?";
				
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.valueOf(request.getParameter("custno")));
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
<html>
<head>
<script type = "text/javascript">
	function checkValue(){
		if(!document.data.custname.value){
			alert("회원성명이 입력되지 않았습니다.");
			data.custname.focus();
			return false;
		} else if(!document.data.phone.value){
			alert("회원전화가 입력되지 않았습니다.");
			data.phone.focus();
			return false;
		} else if(!document.data.address.value){
			alert("회원주소가 입력되지 않았습니다.");
			data.address.focus();
			return false;
		} else if(!document.data.joindate.value){
			alert("가입일자가 입력되지 않았습니다.");
			data.joindate.focus();
			return false;
		} else if(!document.data.grade.value){
			alert("고객등급이 입력되지 않았습니다.");
			data.grade.focus();
			return false;
		} else if(!document.data.city.value){
			alert("도시코드가 입력되지 않았습니다.");
			data.city.focus();
			return false;
		}
		alert("회원정보 수정이 완료되었습니다.")
		return true;
	}

	function checkDel() {
		if (confirm("삭제하시겠습니까?") == true){ 
			alert("삭제되었습니다");
			return location.href="update_d.jsp?custno=<%= rs.getString("custno")%>;
		}
		alert("삭제가 취소되었습니다.");
		return false;
		
	}

</script>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
<section class="section">
	<h2>홈쇼핑 회원 정보 수정</h2>
	<form name="data" action="update_p.jsp" method="post" onsubmit="return checkValue()">
		<table border="1" style="margin-left:auto; margin-right:auto;">
			<tr>
				<th>회원번호</th>
				<td><input name="custno" value="<%= rs.getString("custno") %>" type="text" readonly></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input name="custname" value=<%= rs.getString("custname") %> type="text"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input name="phone" value=<%= rs.getString("phone") %> type="text"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input name="address" value="<%= rs.getString("address") %>" type="text"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input name="joindate" value=<%= rs.getString("joindate") %> type="text"></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP, B:일반, C:직원]</th>
				<td><input name="grade" value=<%= rs.getString("grade") %> type="text"></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input name="city" value=<%= rs.getString("city") %> type="text"></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="수정"></input>
					<input type="button" value="조회" onclick="location.href='member_list.jsp'"></input>
					<input type="button" value="삭제" onclick="checkDel()"></input>
				</td>
			</tr>
		</table>
	</form>	
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>

</body>
</html>