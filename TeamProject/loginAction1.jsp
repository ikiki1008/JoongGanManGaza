<%@page import="team.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
LoginDao dao = new LoginDao();
int check = dao.checkUser(id, pass);

if(check==1){
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
}else{
	%>
	<script>
	alert("아이디,비밀번호가 틀렸거나 회원이 아닙니다.");
	location.href="login.html";
	</script>
	<%
}
%>
