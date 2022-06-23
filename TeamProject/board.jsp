<%@page import="java.util.ArrayList"%>
<%@page import="team.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDao dao = new BoardDao();
	ArrayList<BoardDto> dtos = dao.boardlist();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
	<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>
	<script type="text/javascript" src="./js/AC.js"></script>
	<link rel="stylesheet" href="./css/boards.css">
</head>
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
            <span>자유게시판</span><br>
          </div>
        </div>
    </div>
        <hr>   
    <div class="list"><br>


        <div id="tablestyle">
            <div id="btns">
                <button id="btnleft" onclick="location.href='main.jsp'">홈으로</button>
                <%if(id!=null) {%>
                <button id="btnright" onclick="location='boardwrite.jsp'">게시글작성</button>
                <%} else{%>
                <button id="btnright" onclick="cwrite()">게시글작성</button>
                <%} %>
            </div>
            <br>
            <table>
                <thead>
                    <tr style="background-color: white;">
                        <th class="tb1">NO</th>
                        <th class="tb2">제목</th>
                        <th class="tb3">작성자</th>
                        <th class="tb4">작성일</th>

                    </tr>
                </thead>

                <tbody>
                	<tr>
                	<%
                	for(BoardDto dto : dtos){
                	%>
	                	<td><%=dto.getNum()%></td>
	                	<td><a href="boardRead.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a></td>
	                	<td><%=dto.getId()%></td>
	                	<td><%=dto.getDt()%></td>
                	</tr>
                	<%
                	}
                	%>
                    

                </tbody>
            </table>
            <br>
            
                <div class="page_wrap">
                    <div class="page_nation">
                       <a class="arrow pprev" href="#"><<</a>
                       <a class="arrow prev" href="#"><</a>
                       <a href="#" class="active">1</a>
                       <a href="#">2</a>
                       <a href="#">3</a>
                       <a href="#">4</a>
                       <a href="#">5</a>
                       <a href="#">6</a>
                       <a href="#">7</a>
                       <a href="#">8</a>
                       <a href="#">9</a>
                       <a href="#">10</a>
                       <a class="arrow next" href="#">></a>
                       <a class="arrow nnext" href="#">>></a>
                    </div>
                 </div>
             
        </div>
    <br>
    </div>
    </main>
            <footer id="footer">
        <p><br>더벤티코리아 부산 부산광역시 해운대구 센텀서로 30, 2507호 (KNN타워)<br>
            더벤티코리아 서울 서울특별시 구로구 디지털로33길 27 408~414호<br>
            (주)에스앤씨세인 사업자번호 : 534-88-00122 대표이사 : 박수암 강삼남 최준경<br>
            가맹문의 1661-4553 고객센터 1644-0513<br>
            회사소개 가맹절차 사이트이용약관 개인정보 처리방침 고객상담 사이트맵<br>
            Copyright ⓒ THEVENTI. All right Reserved.<br>
        </p>
    </footer>
</body>
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
</html>