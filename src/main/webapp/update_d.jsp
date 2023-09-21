<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = DBConnect.getConnection();
	String sql = "delete from member_tbl_02 where custno = " + Integer.parseInt(request.getParameter("custno"));
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.executeUpdate();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="member_list.jsp"></jsp:forward>
</body>
</html>