<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="team.LoginDao" %>
<%@page import="team.LoginDto" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//클라이언트에서 전달된 데이터
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	LoginDao dao = new LoginDao();
	LoginDto dto = new LoginDto(name, id, pass, birth, tel, email);
	dao.insert(dto);
%>
<script>
//메시지창
alert("회원가입이 완료되었습니다!");
//창닫기
window.self.close();
</script>