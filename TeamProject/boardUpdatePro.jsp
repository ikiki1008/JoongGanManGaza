<%@page import="team.BoardDto"%>
<%@page import="team.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

//클라이언트에서 전달된 데이터

String id = (String)session.getAttribute("id");
String title = request.getParameter("bbsTitle");
String content = request.getParameter("bbsContent");
String num = request.getParameter("num");


BoardDao dao = new BoardDao();
dao.boardupdate(title,content,num);

response.sendRedirect("board.jsp");

%>