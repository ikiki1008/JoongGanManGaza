<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/AC.css">
<script type="text/javascript" src="./js/AC.js"></script>


<!------------------- DB에서 값 받아옴 ----------------------------------------->
<%
String id = (String)session.getAttribute("id");
//DBCP로 변경
Context initCtx = new InitialContext();
Context envCtx = (Context)initCtx.lookup("java:comp/env");
DataSource ds = (DataSource)envCtx.lookup("jdbc/team");
Connection con = ds.getConnection();

String sql = "select name,pass,tel,email from account where id='"+id+"'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String name="";
String pass="";
String tel="";
String email="";
	while(rs.next()){
		name = rs.getString("name");
		pass = rs.getString("pass");
		tel = rs.getString("tel");
		email = rs.getString("email");
	}
	rs.close();
	con.close();
	stmt.close();
%>
<!------------------------------------------------------------------------->


<title>회원정보수정</title>
</head>
<body>
<div class="register">
        <h3>회원정보수정</h3>
        <form action="editPro.jsp">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        이름 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="text" class="name" name="name" id="name" onkeypress="javascript:return onlyKorean('name');" value="<%=name%>" placeholder="이름을 입력하세요" autofocus required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        아이디 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="text" id="id" name="id" pattern="[A-Za-z]+" value="<%=id%>" minlength="4" maxlength="16" readonly required> <!-- disabled을 사용하면 form action을 통한 값 전달이 안돼서 readonly를 사용 -->
                    </li>

                </ul>
                <ul class="container">
                    <li class="item center">
                        비밀번호 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="password" id="pass" name="pass" onchange="same()" pattern="[A-Za-z0-9]+" value="<%=pass%>" placeholder="영소문자 4자~16자" minlength="4" maxlength="16" required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        비밀번호 확인 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="password" id="pass2" name="pass" onchange="same()" pattern="[A-Za-z0-9]+" placeholder="영소문자  4자~16자" minlength="4" maxlength="16" required>
                    </li>
                    <li class="item">
                    	<span id="same"></span>
                    </li>
                </ul>

                <ul class="container">
                    <li class="item center">
                        전화번호 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="tel" id="tel" name="tel" value="<%=tel%>" placeholder="-빼고 입력해주세요." minlength="11" maxlength="11" pattern="[0-9]+" required="required">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        이메일 
                    </li>
                    <li class="item">
                        <input type="email" id="email" name="email" value="<%=email %>" placeholder="이메일을 입력해주세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <button class="submit" onclick="ACupdate()">수정하기</button>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <input type="submit" class="submit" onclick="delfunc()" value="탈퇴하기">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <input type="button" class="submit" onclick="window.close()" value="취소">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                
            </div>
        </form>
    </div>
</body>
</html>