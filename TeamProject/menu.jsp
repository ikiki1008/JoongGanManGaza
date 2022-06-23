<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MENU</title>
    <script src="./js/jquery-3.6.0.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Gowun+Batang&family=Lato&family=M+PLUS+Rounded+1c&family=Noto+Serif+KR:wght@300;600;700&family=Open+Sans:wght@300&family=Poppins:wght@400;700&family=Secular+One&family=Source+Sans+Pro:wght@300&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
<script type="text/javascript" src="./js/AC.js"></script>
<style>
    body{
        margin: 0; 
        padding: 0;
        padding-top: 0;
        box-sizing: border-box;
        font-family: 'Noto Serif KR', serif;
        background-color: #fff;
       
    }
    
    #pText{
        text-align: right;
        font-family: Verdana, Geneva, Tahoma, sans-serif;
        font: bold;

    } 
    #footer{
        text-align: center;
        background-color: rgb(236, 236, 236);
        font-size: small;
        padding-top: 10px;
        padding-bottom: 10px;
        float: center;
    }

    .image {
        display: block;
        width: 100%;
        height: auto; 
    }

    .text {
        color: black;
        font-size: 20px;
        position: absolute;
        top: 50%;
        left: 50%;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        white-space: nowrap;
    }
    #menupic{
        text-align: center;
    }
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
</style>
</head>

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
    <div class="none">
    </div>
    
    <br><br><br><br>
    <!--menu part-->
    <div id="menupic">
        <strong><p>COFFEE</p></strong>
        <img src="./img/menupic2.jpg">
        <br><br>
        <img src="./img/menupic.jpg">
        <br><br>
        <strong><p>ADE & SMOOTHIE</p></strong>
        <img src="./img/menupic4.jpg">
        <br><br>
        <strong><p>TEA</p></strong>
        <img src="./img/menupic6.jpg">
        <br><br>
        <strong><p>DESSERT</p></strong>
        <img src="./img/menupic5.jpg">
    </div>
    <br><br>
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