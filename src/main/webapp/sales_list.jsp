<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String sql = 
		"select mb.custno as custno, mb.custname as custname, " +
		"case when mb.grade = 'A' then 'VIP' " +
		"when mb.grade = 'B' then '일반' " +
		"else '직원' end as grade, " +
		"sum(price) as sum " + 
		"from member_tbl_02 mb, money_tbl_02 mo " +
		"where mb.custno = mo.custno(+) " +
		"group by mb.custno, mb.custname, mb.grade " +
		"order by sum desc";
		
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	int sumPrice = 0;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>
<header>
	<jsp:include page = "layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page = "layout/nav.jsp"></jsp:include>
</nav>
<section class="section">
	<h2>회원매출조회</h2>
	<form>
	<table border = "1" style = "width : 500px; margin-left : auto; margin-right : auto;">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
		<%while(rs.next()){ %>
			<tr>
				<td><%= rs.getInt("custno") %></td>
				<td><%= rs.getString("custname") %></td>
				<td><%= rs.getString("grade") %></td>
				<td><%= rs.getString("sum") %></td>
			</tr>
			<% sumPrice += rs.getInt("sum"); %>
		<% } %>
		<tr>
			<td colspan = "3">총합</td>
			<td><%= sumPrice %></td>
		</tr>
	</table>
	</form>
</section>
<footer>
	<jsp:include page = "layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>