<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/style.css">
<script type="text/javascript">
	function cheakValue2() {
		if(!document.data1.custno.value){
			alert("회원번호가 입력되지 않았습니다.");
			data1.custno.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
<section class="section">
	<h2>회원조회</h2>
	<form action="member_search_list.jsp" method="post" name = "data1" onsubmit="return cheakValue2()">
		<table border = "1" style = "margin-left: auto; margin-right: auto;">
			<tr>
				<th>회원번호</th>
				<td style = "width : 100"><input type="text" name = "custno" size = "10"></input></td>
			</tr>
			<tr>
				<td colspan = "2" style = "text-align : center;">
					<input type="button" value = "취소" onclick="location.href='member_search.jsp'">
					<input type="submit" value = "조회">
				</td>
			</tr>
		</table>
	</form>
</section>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>