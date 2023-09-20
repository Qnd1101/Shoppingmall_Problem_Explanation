<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.custno.value){
			alert("회원 번호를 입력해주세요.");
			data.custno.focus();
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
<section class="section">
	<h2>회원 조회</h2>
	<form name="data" action="member_search_list.jsp" method="post" onsubmit="return checkValue()">
	<table border = "1" style = "margin-left : auto; margin-right : auto;">
		<tr>
			<th>회원 번호</th>
			<td><input type="text" name = "custno"></input></td>
		</tr>
		<tr>
			<td colspan = "2" style = "text-align : center;">
				<input type="button" value="취소" onclick="location.href='member_search.jsp'"></input>
				<input type="submit" value="조회"></input>
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