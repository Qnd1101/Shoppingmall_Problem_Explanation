<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import ="DB.DBConnect" %>   
 <%@ page import = "java.sql.*" %>
    
 <%
 	int in_custno = Integer.parseInt(request.getParameter("custno"));
 	request.setCharacterEncoding("UTF-8"); //오라클에 한글 입력시 깨지지 않음
 	String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate, "+
		"case when grade = 'A' then 'VIP' when grade = 'B' then '일반' when grade = 'C' then '직원' end as grade, "+
		"city from member_tbl_02 where custno = "+ in_custno;
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
 %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>쇼핑몰 회원등록</title>
</head>
<body>

<header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
 </header>

 <nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
 </nav>
		
 <section class="section">
   	 <h2>홈쇼핑 회원 조회 결과</h2>

<form>
	<%if(rs.next()){ %>
		<table border = "1" style = "margin-left: auto; margin-right: auto;">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<tr>
				<th><%=rs.getString("custno")%></th>
				<th><%=rs.getString("custname")%></th>
				<th><%=rs.getString("phone")%></th>
				<th><%=rs.getString("address")%></th>
				<th><%=rs.getString("joindate")%></th>
				<th><%=rs.getString("grade")%></th>
				<th><%=rs.getString("city")%></th>
			</tr>
			<tr style="text-align: center">
					<td  colspan="7" >
						<input type="button" value="홈으로"  onclick = "location.href='index.jsp'"> <!-- "location.href=는 현재 브라우저에 연결페이지 로딩 -->
					</td>
			</tr>
		</table>
	<%}else{ %>
	
	<nav style="text-align: center">
		<p>회원 번호 <%=in_custno%>의 회원 정보가 없습니다.</p><br>
		<input type="button" value="다시 조회"  onclick = "location.href='member_search.jsp'  "> <!-- "location.href=는 현재 브라우저에 연결페이지 로딩 -->
	</nav>
	<%} %>
</form>	
   	
 </section>
		
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>