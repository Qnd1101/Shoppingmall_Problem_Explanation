# 홈쇼핑 회원관리 프로그램

노션 페이지 생성일: 2023년 9월 5일 오후 1:59

## 목차

## 1. 프로젝트 준비 - 환경 세팅

> encoding - UTF-8 세팅 (page 기본 인코딩 설정)
Tomcat 연결
Oracle 연결
(ojdbc6.jar import)
> 
> 
> ![이미지](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/assets/107795830/19693a8b-7189-4e6c-95c9-1643b6d2b13b)

> 

---

## 2. 테이블 생성 및 삽입

### SQL (코드)

```sql
DROP TABLE member_tbl_02;
CREATE TABLE member_tbl_02(
	custno number(6) primary key,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(60),
	joindate date,
	grade char(2),
	city char(2)
);

INSERT INTO MEMBER_TBL_02 VALUES(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
INSERT INTO MEMBER_TBL_02 VALUES(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
INSERT INTO MEMBER_TBL_02 VALUES(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'C', '30');
INSERT INTO MEMBER_TBL_02 VALUES(100004, '최사랑', '010-1111-5555', '울릉군 울릉웁 독도2리', '20151113', 'A', '30');
INSERT INTO MEMBER_TBL_02 VALUES(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
INSERT INTO MEMBER_TBL_02 VALUES(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');

SELECT * FROM MEMBER_TBL_02;

DROP TABLE money_tbl_02;
CREATE TABLE money_tbl_02(
	custno number(6),
	salenol number(8),
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate date,
	primary key(custno, salenol)
);

INSERT INTO MONEY_TBL_02 VALUES(100001, '20160001', '500', '5', '2500', 'A001', '20160101');
INSERT INTO MONEY_TBL_02 VALUES(100001, '20160002', '1000', '2', '4000', 'A002', '20160101');
INSERT INTO MONEY_TBL_02 VALUES(100001, '20160003', '500', '3', '1500', 'A008', '20160101');
INSERT INTO MONEY_TBL_02 VALUES(100002, '20160004', '2000', '1', '2000', 'A004', '20160102');
INSERT INTO MONEY_TBL_02 VALUES(100002, '20160005', '500', '1', '500', 'A001', '20160103');
INSERT INTO MONEY_TBL_02 VALUES(100003, '20160006', '1500', '2', '3000', 'A003', '20160103');
INSERT INTO MONEY_TBL_02 VALUES(100004, '20160007', '500', '2', '1000', 'A001', '20160104');
INSERT INTO MONEY_TBL_02 VALUES(100004, '20160008', '300', '1', '300', 'A005', '20160104');
INSERT INTO MONEY_TBL_02 VALUES(100004, '20160009', '600', '1', '600', 'A006', '20160104');
INSERT INTO MONEY_TBL_02 VALUES(100004, '20160010', '3000', '1', '3000', 'A007', '20160106');

SELECT * FROM money_tbl_02;

select max(custno) from member_tbl_02;
```

---

## 3. Dynamic Web Project 생성

### 3-1) 톰캣 연결 확인

![Untitled](%E1%84%92%E1%85%A9%E1%86%B7%E1%84%89%E1%85%AD%E1%84%91%E1%85%B5%E1%86%BC%20%E1%84%92%E1%85%AC%E1%84%8B%E1%85%AF%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB%E1%84%85%E1%85%B5%20%E1%84%91%E1%85%B3%E1%84%85%E1%85%A9%E1%84%80%E1%85%B3%E1%84%85%E1%85%A2%E1%86%B7%20125741c29a7b4932a583bac62366bf4a/Untitled%201.png)

---

## 4. index.jsp, layout(header, nav, section, footer), css(style) 생성

![Untitled](%E1%84%92%E1%85%A9%E1%86%B7%E1%84%89%E1%85%AD%E1%84%91%E1%85%B5%E1%86%BC%20%E1%84%92%E1%85%AC%E1%84%8B%E1%85%AF%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB%E1%84%85%E1%85%B5%20%E1%84%91%E1%85%B3%E1%84%85%E1%85%A9%E1%84%80%E1%85%B3%E1%84%85%E1%85%A2%E1%86%B7%20125741c29a7b4932a583bac62366bf4a/Untitled%202.png)

### css (코드)

```css
@charset "UTF-8";

* {
	margin : 0;
	padding : 0;
}

#header {
	width : 100%;
	height : 80px;
	background-color : blue;
	color : white;
	text-align : center;
	line-height : 80px;
}

#nav {
	width : 100%; height : 40px;
	background-color : #8977ad; Color : white;
	line-height : 40px;
}

#nav ul li a {
	float : left;
	padding : 0 10px;
}

ul li {
	list-style : none;
}

a {
	text-decoration : none;
	color : white;
}

.section {
	width : 100%; height : 100%;
	background-color : lightgray;
	position : fixed;
}
.section tr th{
	width : 240px;
}
.section tr td{
	width : 360px;
}

.section tr td input {
	padding : 3px;
}

.c_input{
	width : 200px;
}

h2 {
	text-align : center;
	padding : 20px 0;
}

p {
	padding : 0 10px;
}

#footer {
	width : 100%; height : 40px;
	background-color : skyblue;
	color : white;
	text-align : center;
	line-height : 40px;
	position : absolute;
	bottom : 0;
	font-size : 13px;
}
```

### layout (코드)

## header

```jsx
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 id = "header">쇼핑몰 회원 관리 ver 1.0</h1>
</body>
</html>
```

## nav

```jsx
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav id = "nav">
	<ul>
		<li><a href = "#">회원등록</a></li>
		<li><a href = "#">회원목록조회/수정</a></li>
		<li><a href = "#">회원매출조회</a></li>
		<li><a href = "index.jsp">홈으로</a></li>
	</ul>
</nav>
</body>
</html>
```

## section

```jsx
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class = "section">

	<h2>쇼핑몰 회원관리 프로그램</h2>
	<p>
		쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작서하는 프로그램이다. <br>
		프로그램 작성 순서 <br>
		1. 회원정보 테이블을 생성한다. <br>
		2. 매출정보 테이블을 생성한다. <br>
		3. 회원정보, 매출정보테이블에 제시된 문제지의 참조데이터를 추가 생성한다.<br>
		4. 회원정보 입력 화면프로그램을 작성한다.<br>
		5. 회원정보 조회 프로그램을 작성한다.<br>
		6. 회원매출정보 조회 프로그램을 작성한다.
	</p>
</section>
</body>
</html>
```

## footer

```jsx
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<footer id = "footer">
HRDKOREA Copyrightⓒ2016 All rights reserved,Human Resources Development Service of Korea.
</footer>
</body>
</html>
```

### index (코드)

```jsx
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<section>
	<jsp:include page = "layout/section.jsp"></jsp:include>
</section>
<footer>
	<jsp:include page = "layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>
```

---

## 5. DB연결 클래스파일 생성

### DBConnect (코드)

```jsx
package DB;

import java.sql.*;

public class DBConnection{
	public static Connection getConnection(){
		Connection conn = null; // Connection(연결객체) 변수 conn 선언

		String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 연결 드라이버 주소
		String id = "system"; // 계정 아이디
		String pw = "1234"; // 계정 비번

		try{
			Class.forName("oracle.jdbc.OracleDriver"); 
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 성공 했다미안");
		} catch(Exception e){
			e.printStackTrace();;
		}
		return conn;
	}
}
```

---

## 6. join.jsp 완성(DB연결 및 데이터 불러오기, 유효성 체크 함수)

### 회원 등록(front) - join.jsp (코드)

```jsx
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "DB.DBConnection" %>
<%@ page import = "java.sql.*" %>
<%
	String sql = "select max(custno) from member_tbl_02";
	
	//DB 연결 기능을 객체변수 conn 에 저장 -> 1.DB 연결
	Connection conn = DBConnection.getConnection();
	
	// sql변수에 저장되어 있는 문장이 쿼리문이 됨 -> 2. DB 연결 후 쿼리문이 생성
	// PreparedStatement <- 쿼리문 형식으로 변환 해준다.
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// 변수 pstmt에 저장되어 있는 SQL문을 실행하여 객체 변수 rs에 저장
	// 쿼리문 결과값을 받아온다.
	ResultSet rs = pstmt.executeQuery();
	
	// 기준이 되는 변수에 결과값이 저장되어 있는 경우 next()를 호출하여 마지막 값을 확인
	// 결과값이 없을 경우엔 실행 하지 않아도 됨.
	rs.next();
	
	int num = rs.getInt(1) + 1;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/style.css">
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
		return true;
	}
</script>
</head>
<body>
<header>
	<jsp:include page = "layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page = "layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
	<h2> 홈쇼핑 회원 등록 </h2>
	<form name = "data" action="join_p.jsp" method = "post" onsubmit="return checkValue()">
		<table border = "1" style = "margin-left: auto; margin-right: auto;">
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input class = "c_input" type = "text" name = "custno" value = "<%= num %>" readonly></td>
			</tr>
		
			<tr>
				<th>회원성명</th>
				<td><input class = "c_input" type = "text" name = "custname" ></td>
			</tr>
		
			<tr>
				<th>회원전화</th>
				<td><input class = "c_input" type = "text" name = "phone"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input class = "c_input" type = "text" name = "address"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input class = "c_input" type = "text" name = "joindate"></td>
			</tr>
		
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td><input class = "c_input" type = "text" name = "grade"></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input class = "c_input" type = "text" name = "city"></td>
			</tr>
			
			
			
			<tr>
				<td colspan = "2" style = "text-align : center;">
					<input type="submit" value="등록" >
					<input type="button" value="취소" onclick= "location.href='join.jsp'"><!-- location.href <- 현재 브라우저에 연결페이지 로딩 -->
					<input type="button" value="조회">
				</td>
			</tr>
		</table>
	</form>
</section>
<footer>
	<jsp:include page = "layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>
```

### DB연결 및 데이터 불러오기

```java
<@% page import = "DB.DBConnect" %> <!-- DB connect -->
<%@ page import = "java.sql.*" %> <!-- SQL import -->

<%
	String sql = "select max(custno) from member_tbl_02";
	
	//DB 연결 기능을 객체변수 conn 에 저장 -> 1.DB 연결
	Connection conn = DBConnect.getConnection();
	
	// sql변수에 저장되어 있는 문장이 쿼리문이 됨 -> 2. DB 연결 후 쿼리문이 생성
	// PreparedStatement <- 쿼리문 형식으로 변환 해준다.
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// 변수 pstmt에 저장되어 있는 SQL문을 실행하여 객체 변수 rs에 저장
	// 쿼리문 결과값을 받아온다.
	ResultSet rs = pstmt.executeQuery();
	
	// 기준이 되는 변수에 결과값이 저장되어 있는 경우 next()를 호출하여 마지막 값을 확인
	// 결과값이 없을 경우엔 실행 하지 않아도 됨.
	rs.next();
	
	int num = rs.getInt(1) + 1;
%>
```

### 유효성 체크 함수

```java
<script type = "text/javascript">
	function checkValue(){
		if(!document.data.custname.value){ // 'custname' 이라는 name에 value가 없을 경우
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
		alert("회원등록이 완료되었습니다.");
		return true; // 모든 입력 사항이 입력 되었을 때 'true' 반환
	}
</script>
```

---

## 7. join_p.jsp ( DB연결 및 DB 테이블에 데이터 저장 )

### 회원 등록(back-end) - join_p.jsp (코드)

```jsx
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DB.DBConnection" %>	
<%@ page import = "java.sql.*" %>
<%
	String sql = "insert into member_tbl_02 values (?, ?, ?, ?, ?, ?, ?)";
	
	// 오라클에 한급 입력시 깨지지 않음
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// 웹 브라우저에서 불러오는 데이터는 문자열 형식으로 인식되므로, 
	// 숫자 데이터면 형변환 *Integer.parseInt() 메서드를 이용해야 한다.
	pstmt.setInt(1, Integer.parseInt(request.getParameter("custno")));
	
	pstmt.setString(2, request.getParameter("custname"));
	pstmt.setString(3, request.getParameter("phone"));
	pstmt.setString(4, request.getParameter("address"));
	pstmt.setString(5, request.getParameter("joindate"));
	pstmt.setString(6, request.getParameter("grade"));
	pstmt.setString(7, request.getParameter("city"));
	
	// 데이터베이스 질의문을 실행하여 데이터 변경 작업을 수행하고 그 결과를 알려주는 역할을 한다.
	pstmt.executeUpdate(); // 쿼리문을 실행하고, 순서대로 member_tbl_02에 기록
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page= "index.jsp"></jsp:forward>
<!-- 데이터입력 수행 완료 후 index 페이지로 이동 -->
</body>
</html>
```

### DB연결 및 DB 테이블에 데이터 저장

```java
<%
	String sql = "insert into member_tbl_02 values (?, ?, ?, ?, ?, ?, ?)";
	
	// 오라클에 한글 입력시 깨지지 않음
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// 웹 브라우저에서 불러오는 데이터는 문자열 형식으로 인식되므로, 
	// 숫자 데이터면 형변환 *Integer.parseInt() 메서드를 이용해야 한다.
	pstmt.setInt(1, Integer.parseInt(request.getParameter("custno")));
	
	pstmt.setString(2, request.getParameter("custname"));
	pstmt.setString(3, request.getParameter("phone"));
	pstmt.setString(4, request.getParameter("address"));
	pstmt.setString(5, request.getParameter("joindate"));
	pstmt.setString(6, request.getParameter("grade"));
	pstmt.setString(7, request.getParameter("city"));
	
	// 데이터베이스 질의문을 실행하여 데이터 변경 작업을 수행하고 그 결과를 알려주는 역할을 한다.
	pstmt.executeUpdate(); // 쿼리문을 실행하고, 순서대로 member_tbl_02에 기록
%>
```

---

## 8. 각 페이지 별 완성 화면
(회원등록, 회원목록조회/수정, 회원매출조회, 홈으로)

### 회원등록

![Untitled](%E1%84%92%E1%85%A9%E1%86%B7%E1%84%89%E1%85%AD%E1%84%91%E1%85%B5%E1%86%BC%20%E1%84%92%E1%85%AC%E1%84%8B%E1%85%AF%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB%E1%84%85%E1%85%B5%20%E1%84%91%E1%85%B3%E1%84%85%E1%85%A9%E1%84%80%E1%85%B3%E1%84%85%E1%85%A2%E1%86%B7%20125741c29a7b4932a583bac62366bf4a/Untitled%203.png)

### 회원목록조회/수정

![Untitled](%E1%84%92%E1%85%A9%E1%86%B7%E1%84%89%E1%85%AD%E1%84%91%E1%85%B5%E1%86%BC%20%E1%84%92%E1%85%AC%E1%84%8B%E1%85%AF%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB%E1%84%85%E1%85%B5%20%E1%84%91%E1%85%B3%E1%84%85%E1%85%A9%E1%84%80%E1%85%B3%E1%84%85%E1%85%A2%E1%86%B7%20125741c29a7b4932a583bac62366bf4a/Untitled%204.png)

### 회원매출조회

### 홈으로

![Untitled](%E1%84%92%E1%85%A9%E1%86%B7%E1%84%89%E1%85%AD%E1%84%91%E1%85%B5%E1%86%BC%20%E1%84%92%E1%85%AC%E1%84%8B%E1%85%AF%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB%E1%84%85%E1%85%B5%20%E1%84%91%E1%85%B3%E1%84%85%E1%85%A9%E1%84%80%E1%85%B3%E1%84%85%E1%85%A2%E1%86%B7%20125741c29a7b4932a583bac62366bf4a/Untitled%205.png)
