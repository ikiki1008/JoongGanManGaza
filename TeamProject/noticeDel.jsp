<%@page import="team.BoardDto"%>
<%@page import="team.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

//클라이언트에서 전달된 데이터

//String nick = (String)session.getAttribute("nick");
String num = request.getParameter("num");

BoardDao dao = new BoardDao();
dao.noticedel(num);


response.sendRedirect("notice.jsp");

%>
<script>
alert("삭제되었습니다");
</script>