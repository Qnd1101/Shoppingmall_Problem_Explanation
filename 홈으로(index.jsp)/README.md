## index.jsp
```jsp
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
### 액션 태그를 이용하여 각각의 페이지를 불러오는 형식으로 만듦.

## 완성 화면
![image](https://github.com/Qnd1101/Shoppingmall_Problem_Explanation/assets/107795830/8a8a9ce4-268c-4669-94d8-9fc919f2299d)