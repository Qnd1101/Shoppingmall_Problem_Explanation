<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%
	String sql = "select custno, custname, phone,"
		+ "address, to_char(joindate, 'yyyy-mm-dd') as joindate,"
		+ " case when grade = 'A' then 'VIP'"
		+ " when grade = 'B' then '일반'"
		+ " else '직원' end as grade, city "
		+ "from member_tbl_02 order by custno";
			
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>
<header>
	<jsp:include page = "layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page = "layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
	<h2>회원목록조회/수정</h2>
	<form>
	<table border = "1" style = "width : 850px; margin-left : auto; margin-right : auto;">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<% while(rs.next()){ %>
		<tr style = "text-align : center;">
			<td><a href = "update.jsp?custno=<%= rs.getString("custno")%>"><%=rs.getString("custno")%></a></td>
			<!-- update.jsp에 매개변수명 click_custno를 선언, 매개변수 값으로는 회원번호를 오라클에서 읽어들인 값을 저장 -->
			<td><%=rs.getString("custname")%></td>
			<td><%=rs.getString("phone")%></td>
			<td><%=rs.getString("address")%></td>
			<td><%=rs.getString("joindate")%></td>
			<td><%=rs.getString("grade")%></td>
			<td><%=rs.getString("city")%></td>
		</tr> 
		<% } %>
	</table>
	</form>
</section>
<footer>
	<jsp:include page = "layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>