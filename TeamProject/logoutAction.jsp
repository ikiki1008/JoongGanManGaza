<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃 후 메인으로 ㄱ</title>
</head>
<body>
	<%
		session.invalidate(); //로그아웃한 회원의 세션을 빼앗음으로 최종적으로 로그아웃됨
	%>
	<script>
		location.href='main.jsp'; //로그아웃후 메인페이지로 ㄱ
	</script>
</body>
</html>