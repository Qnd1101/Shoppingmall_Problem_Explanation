## sales_list.jsp (테이블에 저장된 회원매출조회)

### DB 연결 및 SQL문을 작성하여 '회원번호, 회원성명, 고객등급, 매출'을 출력할 수 있도록 만듦
```jsp
<%
	request.setCharacterEncoding("UTF-8");

	String sql = 
		"select mb.custno as custno, mb.custname as custname, " +
		"case when mb.grade = 'A' then 'VIP' " +
		"when mb.grade = 'B' then '일반' " +
		"else '직원' end as grade, " +
		"sum(price) as sum " + 
		"from member_tbl_02 mb, money_tbl_02 mo " +
		"where mb.custno = mo.custno " +
		"and price is not null" +
		"group by mb.custno, mb.custname, mb.grade " +
		"order by sum desc";
		
	// SQL문 해석
	// 검색(select) : 회원번호, 회원성명, 고객등급, 매출 
	// 정보가 들어있는 테이블(from) : member_tbl_02, money_tbl_02
	// 조건(where) : member 테이블과 money 테이블의 기본키인 custno를 통해서 조인문 체결
        //              그리고 매출이 없으면 출력하지 않는 조건(사실 내부조인을 통해서 널값은 조회하지 않음)
	// ~를 기준으로(group by) : 수학함수를 제외한 셀렉트문에 있는 모든 것
	// 정렬(order by) : 매출을 기준으로 정렬
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	int sumPrice = 0;
%>  
```
```jsp
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
```

## 완성화면
![image](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/assets/107795830/86f994cb-008b-4de8-b4f8-9a0a29f4baca)
