<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");

//DBCP로 변경
Context initCtx = new InitialContext();
Context envCtx = (Context)initCtx.lookup("java:comp/env");
DataSource ds = (DataSource)envCtx.lookup("jdbc/team");
Connection con = ds.getConnection();

String sql = "select title, content from notice where num='"+num+"'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
String title="";
String content="";
while(rs.next()){
	title = rs.getString("title");
	content = rs.getString("content");
}

	rs.close();
	con.close();
	stmt.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>공지사항 상세글페이지</title>
</head>
<body>
<style>
    /*dropDown MenuBar css!*/
    li {list-style: none; }           
    .logo {margin: 50px 0; font-size: 30px; text-align: center; font-family: 'Abril Fatface', cursive; }            
    .topMenu {width: 100%; margin-bottom: 20px; text-align: center; height: 40px; }
    .topMenu:after {content: ""; display: block; clear: both; }
    .menu01>li {float: left; width: 20%; line-height: 40px; }
    .menu01 span {font-size: 20px; font-weight: bold; }           
    .dept01 {display: none; padding: 20px 0; border-bottom: 1px solid #ccc; }           
    #nop {float: none; }           
    .none:after {content: ""; display: block; clear: both; }

    
</style>
<style>
.p{
font-size:10px;
}
    button {
    margin: 5px;
    }

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 5px 10px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-indigo {
    background-color: rgb(255, 240, 218);
    color: #434344;
}

.w-btn-indigo-outline {
    border: 3px solid rgb(255, 240, 218);
    color: #434344;
}

.w-btn-indigo-outline:hover {
    color: #434344;
    background: rgb(255, 240, 218);
}

/*footer*/
#footer{
        text-align: center;
        background-color: rgb(236, 236, 236);
        font-size: small;
        padding-top: 10px;
        padding-bottom: 10px;
        float: center;
    }

    /*사진위에 텍스트*/
    .background-wrap {
        background-image: url('./img/banner1.jpg');
        background-size: 100% 250px;
        width: 100%;
        height: 250px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

.content {
  display: flex;
  flex-direction: column;
}

.content span {
  color: black;
}

.content span:nth-child(1) {
  font-size: 25px;
  font-weight: bold;
}
</style>

<body>
	<% 
		String id = null;
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
	%>
	<header style="text-align:right;">
	<%if(id == null){%>
    <button class="w-btn w-btn-indigo" type="button" onClick="location.href='login.html'">SIGN IN</button>
    <button class="w-btn w-btn-indigo" type="button" onClick="createPopupWin('createAccount.jsp','회원가입',750,650)">SIGN UP</button>
    <%} else{ %>
    <button class="w-btn w-btn-indigo" type="button" onClick="createPopupWin('edit.jsp','회원수정',750,660)">MY </button>
    <button class="w-btn w-btn-indigo" type="button" onClick="outc()">LOGOUT</button>
    <%} %>
	</header>
    
    <main> 
    <div class="logo">
        <span class="logo" onclick="location='main.jsp'">THE COM MID CAFE</span>
    </div>
    <div class="topMenu">
        <ul class="menu01">
            <li><span onClick="location.href='menu.jsp'">MENU</span>
                <ul class="dept01">
                    <li id="nop" onClick="location.href='menu.jsp'">COFFEE & DESSERTS</li>
                </ul>
            </li>
            <li><span onClick="location.href='gage.jsp'">STORE</span>
                <ul class="dept01">
                    <li id="nop" onClick="location.href='gage.jsp'">ABOUT US</li>
                </ul>
            </li>
            <li><span onClick="location.href='board.jsp'">BOARD</span>
                <ul class="dept01">
                    <li id="nop" onClick="location.href='board.jsp'">BOARD</li>
                </ul>
            </li>
            <li><span onClick="location.href='qna.jsp'">QnA</span>
                <ul class="dept01">
                    <li id="nop" onClick="location.href='qna.jsp'">QnA</li>
                </ul>
            </li>
            <li><span onClick="location.href='notice.jsp'">NOTICE</span>
                <ul class="dept01">
                    <li id="nop" onClick="location.href='notice.jsp'">NOTICE</li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="text-on-img">
        <div class="background-wrap">
          <div class="content">
            <span>공지사항</span><br>
          </div>
        </div>
    </div>
	<hr>
	<div class="container">
		<div class="row">
			<form method="post" action="noticeUpdateWrite.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 상세페이지</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" id="title" name="bbsTitle" class="form-control" maxlength="50" value="<%=title %>" disabled="disabled"></td>
					</tr>
					<tr>
						<td><textarea id="content" name="bbsContent" class="form-control" maxlength="2048" style="height: 350px" disabled><%=content %></textarea></td>
						<input type="hidden" id="num" name="num" value="<%=num %>">				
					</tr>
				</tbody>
			</table>
			<input type="button" style="margin:3px;" class="btn btn-primary pull-right" onclick="location.href='notice.jsp'" value="목록">
			<input type="button" style="margin:3px;" class="btn btn-primary pull-left" onclick="delfunc()" value="삭제">
			<input type="submit" style="margin:3px;" class="btn btn-primary pull-right" value="수정하기">
			</form>						
		</div>
	</div>
		<br>
	 <footer id="footer">
        <p><br>더벤티코리아 부산 부산광역시 해운대구 센텀서로 30, 2507호 (KNN타워)<br>
            더벤티코리아 서울 서울특별시 구로구 디지털로33길 27 408~414호<br>
            (주)에스앤씨세인 사업자번호 : 534-88-00122 대표이사 : 박수암 강삼남 최준경<br>
            가맹문의 1661-4553 고객센터 1644-0513<br>
            회사소개 가맹절차 사이트이용약관 개인정보 처리방침 고객상담 사이트맵<br>
            Copyright ⓒ THEVENTI. All right Reserved.<br>
        </p>
    </footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<!------------------------------- 글 삭제 확인 메시지박스 ---------------------------------->
	<script>
	function delfunc(){
		var del = confirm("삭제하시겠습니까?");
		if(del==true){ // 확인을 누르면 밑의 페이지로 이동
			location.href='noticeDel.jsp?num=<%=num%>';
		}else{} // 메시지창에서 취소 누르면 아무것도 안 일어남
	}
	</script>
	<!--------------------------------------------------------------------------------->
	<script>
    //dropdown Menubar, JQuery on!
        $(document).on('mouseover', '.topMenu span', function() {
        $('.dept01').slideDown(300);
    });
    $(document).on('mouseover', 'div', function () {
        if (!$(this).hasClass('topMenu')) {
            $('.dept01').slideUp(300);
        }
    });
</script>

</body>
</html>