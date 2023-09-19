## join.jsp (DB연결 및 데이터 불러오기, 유효성 체크 함수)

### [회원 등록(front) - join.jsp (코드)](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/blob/main/src/main/webapp/join.jsp)

### DB연결 및 데이터 불러오기
```jsp
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

```jsp
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
## join_p.jsp ( DB연결 및 DB 테이블에 데이터 저장 )

### [회원 등록(back-end) - join_p.jsp (코드)](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/blob/main/src/main/webapp/join_p.jsp)

### DB연결 및 DB 테이블에 데이터 저장

```jsp
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