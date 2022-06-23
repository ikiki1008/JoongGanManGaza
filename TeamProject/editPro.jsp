<%@page import="team.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

//클라이언트에서 전달된 데이터
String id = request.getParameter("id");

String name = request.getParameter("name");
String pass = request.getParameter("pass");
String tel = request.getParameter("tel");
String email = request.getParameter("email");

LoginDao dao = new LoginDao();
dao.update(id, name, pass, tel, email);

%>
<script>
// 수정완료 메시지창
alert("수정이 완료되었습니다!");
// 창 닫기
window.close();
</script>