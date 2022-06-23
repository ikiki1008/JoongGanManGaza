<%@page import="team.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="team.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDao dao = new BoardDao();
	ArrayList<BoardDto> dtos = dao.noticelist();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="./js/jquery-3.6.0.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Gowun+Batang&family=Lato&family=M+PLUS+Rounded+1c&family=Noto+Serif+KR:wght@300;600;700&family=Open+Sans:wght@300&family=Poppins:wght@400;700&family=Secular+One&family=Source+Sans+Pro:wght@300&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 	<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>
	<script type="text/javascript" src="./js/AC.js"></script>
	<link rel="stylesheet" href="./css/boards.css">

</head>
       <style>
        /*-----------------------------------------------------------css 기본세팅*/

        @charset "UTF-8";

        * {
            list-style: none;
            margin: 0;
            border: 0;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        body {
            width: 100%;
            height: 100%;
        }
        /*----------------------------------------------------------------------*/
        /*--------------------------상단부분------------------------------------*/
        header {

            padding: 20px;
            text-align: center;
        }
        /*----------------------------------------------------------------------*/
        
        /*------------------------------------------------------------게시판 css*/
        body {
            background-color: white;
        }

        main {
            height: fit-content;
        }

        main h1 {
            text-align: center;
            padding: 3%;
        }

        .list {
            text-align: center;
            position: relative;
            padding: 3%;
        }
        
        /*버튼 스타일*/
        .list #btns {
            width: 100%;
        }

        .list #btns button {
            border: 2px solid rgba(166, 166, 166, 0.8);
            padding: 7px;
            background-color: white;
            border-radius: 4px;
            font-weight: bold;
            color: #a6a6a6;
            width: fit-content;
            width: 90px;
        }

        .list #btns button:hover {
            background-color: rgba(166, 166, 166, 0.2);
        }

        .list #btns #btnright{
            position: relative;
            margin-left: 75%;
        }
        /*-----------------------------------------------------------------------*/

        .list {
            background-color: white;
        }

        table * {
            padding: 8px;
        }

        table {
            width: 100%;
            height: auto;
            text-align: center;
            border-top: 2px solid #a6a6a6;
            border-bottom: 2px solid #a6a6a6;
            border-spacing: 0px;
            padding: 15px;
        }

        #tablestyle {
            padding: 0 15% 0 15%;
        }

        table thead {
            border-top: 1px solid;
            border-bottom: 1px solid;
        }

        .tb1 .tb5 {
            width: 5%; 
        }

        .tb2 {
            width: 60%;
        }

        .tb3 .tb4 {
            width: 15%;
        }

        table td {
            border-top: 1px solid #a6a6a6;
        }
		table tr:hover {
            background-color: #dbdbdb;
        }
        table tbody tr {
            border-bottom: 1px solid;
        }
        /*-----------------------------------------------------------------------*/
        /*------------------------밑에 추가페이지 설정----------------------------*/
        .page_wrap {
            text-align:center;
            font-size:0;
         }
        .page_nation {
            display:inline-block;
        }
        .page_nation .none {
            display:none;
        }
        .page_nation a {
            display:block;
            margin:0 3px;
            float:left;
            border:1px solid #e6e6e6;
            width:28px;
            height:28px;
            line-height:28px;
            text-align:center;
            background-color:#fff;
            font-size:13px;
            color:#999999;
            text-decoration:none;
        }
        .page_nation .arrow {
            border:1px solid #ccc;
        }
        .page_nation .pprev {
            background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
            margin-left:0;
        }
        .page_nation .prev {
            background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
            margin-right:7px;
        }
        .page_nation .next {
            background:#f8f8f8 url('img/page_next.png') no-repeat center center;
            margin-left:7px;
        }
        .page_nation .nnext {
            background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
            margin-right:0;
        }
        .page_nation a.active {
            background-color:#42454c;
            color:#fff;
            border:1px solid #42454c;
        }
        /*-----------------------------------------------------------------------*/
    </style>
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
    <div class="list"><br>


        <div id="tablestyle">
            <div id="btns">
                <button id="btnleft" onclick="location.href='main.jsp'">홈으로</button>
                <%if(id!=null) {%>
                <button id="btnright" onclick="location='noticewrite.jsp'">게시글작성</button>
                <%} else{%>
                <button id="btnright" onclick="cwrite()">게시글작성</button>
                <%} %>
            </div>
            <br>
            <table>
                <thead>
                    <tr style="background-color: white;">
                        <th class="tb1">순서</th>
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
	                	<td><a href="noticeRead.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a></td>
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
</body>
<script>
function cwrite(){
	alert("로그인 해주세요");
	location='login.html';
}
</script>
</html>