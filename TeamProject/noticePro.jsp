<%@page import="team.BoardDto"%>
<%@page import="team.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

//클라이언트에서 전달된 데이터

String id = (String)session.getAttribute("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDao dao = new BoardDao();
BoardDto dto = new BoardDto(id,title,content);
dao.noticeinsert(dto);

response.sendRedirect("notice.jsp");

%>