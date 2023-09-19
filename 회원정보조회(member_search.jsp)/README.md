## member_search.jsp(회원정보조회 - input 화면)
### [회원정보조회 - input 화면 코드](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/blob/main/src/main/webapp/member_search.jsp)
### 유효성 체크 함수

```jsx
function cheakValue2() {
	if(!document.data1.custno.value){
		alert("회원번호가 입력되지 않았습니다.");
		data1.custno.focus();
		return false;
	}
	return true;
}
```


## member_search_list.jsp(회원정보조회 - output 화면)

### [회원정보조회 - output 화면 코드](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/blob/main/src/main/webapp/member_search_list.jsp)
### DB연결 및 input에서 가져온 값을 조회

```jsp
<%@ page import ="DB.DBConnect" %> 
<%@ page import = "java.sql.*" %>
    
 <%
 	int in_custno = Integer.parseInt(request.getParameter("custno"));
 	request.setCharacterEncoding("UTF-8");
 	String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate, "+
		"case when grade = 'A' then 'VIP' when grade = 'B' then '일반' when grade = 'C' then '직원' end as grade, "+
		"city from member_tbl_02 where custno = "+ in_custno;
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
 %>
```

### 회원 번호가 존재한다면 true(if조건 참), 존재하지 않는다면 false(if조건 거짓)

```jsp
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
				<td colspan="7">
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
```

## 완성화면
![image](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/assets/107795830/09d89e54-55be-4518-8fe4-2f9e1be2997a)
