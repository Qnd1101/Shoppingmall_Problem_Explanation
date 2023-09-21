## member_list.jsp ( 테이블에 저장된 회원목록조회 )
### [회원 목록 조회 - member_list.jsp (코드)](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/blob/main/src/main/webapp/member_list.jsp)

### DB연결 및 SQL문을 작성하여 회원목록 조회

```jsp
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
```

### ResultSet 객체인 rs에 저장되어 있는 값을 next()를 이용해 들어있는 내용 까지 출력

```jsp
<% while(rs.next()){ %>
<tr>
	<td><a href = ""><%=rs.getString("custno")%></a></td>
		<td><%=rs.getString("custname")%></td>
		<td><%=rs.getString("phone")%></td>
		<td><%=rs.getString("address")%></td>
		<td><%=rs.getString("joindate")%></td>
		<td><%=rs.getString("grade")%></td>
		<td><%=rs.getString("city")%></td>
	</tr> 
<% } %>
```

## 완성화면
![image](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/assets/107795830/e1a001da-d361-4456-ae67-4241ba756fa5)

## update.jsp (회원 정보 수정 페이지)

### [회원 정보 수정 - update.jsp (코드)](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/blob/main/src/main/webapp/update.jsp)

### a태그를 통해 선택한 회원번호의 행 전체를 불러와서 '홈쇼핑 회원 정보 수정' 페이지를 만든다.
```jsp
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
```
```jsp
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
```

## 완성화면
![image](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/assets/107795830/94653880-adb1-44dd-b3a2-808c5e3790db)

## update_p.jsp (회원번호에 해당하는 '행' 수정하는 코드)
### [회원 정보 수정(back-and) - update_p.jsp (코드)](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/blob/main/src/main/webapp/update_p.jsp)

### update.jsp 에서 수정 버튼을 눌렀을 때 반응하는 코드
```jsp
<%
	request.setCharacterEncoding("UTF-8");	

	String sql = "update member_tbl_02 set custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno = ?";
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("custname"));
	pstmt.setString(2, request.getParameter("phone"));
	pstmt.setString(3, request.getParameter("address"));
	pstmt.setString(4, request.getParameter("joindate"));
	pstmt.setString(5, request.getParameter("grade"));
	pstmt.setString(6, request.getParameter("city"));
	pstmt.setInt(7, Integer.parseInt(request.getParameter("custno")));	
	
	pstmt.executeUpdate();
%>
```
## update_d.jsp (회원번호에 해당하는 '행' 삭제하는 코드)

### [회원 정보 삭제(back-end) - update_d.jsp (코드)](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/blob/main/src/main/webapp/update_d.jsp)

### update.jsp 에서 삭제 버튼을 눌렀을 떄 반응하는 코드
```jsp
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = DBConnect.getConnection();
	String sql = "delete from member_tbl_02 where custno = " + Integer.parseInt(request.getParameter("custno"));
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.executeUpdate();
%>
```
