<%@page import="team.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

//클라이언트에서 전달된 데이터
String id = request.getParameter("id");

LoginDao dao = new LoginDao();

dao.delete(id);
%>
<script>
// 탈퇴 완료 메시지창
alert("탈퇴가 완료되었습니다!");
// 창 닫기
window.close();
opener.location.href='main.jsp';
<%
session.invalidate();
%>
</script>