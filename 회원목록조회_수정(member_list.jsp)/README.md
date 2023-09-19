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
