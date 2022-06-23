<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가게소개</title>
    <script src="./js/jquery-3.6.0.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Gowun+Batang&family=Lato&family=M+PLUS+Rounded+1c&family=Noto+Serif+KR:wght@300;600;700&family=Open+Sans:wght@300&family=Poppins:wght@400;700&family=Secular+One&family=Source+Sans+Pro:wght@300&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
</head>
<link rel="stylesheet" href="./css/main.css">
<script type="text/javascript" src="./js/AC.js"></script>
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

    #footer{
        text-align: center;
        background-color: rgb(236, 236, 236);
        font-size: small;
        padding-top: 10px;
        padding-bottom: 10px;
        float: center;
    }

    h2{
        text-align:center;
    }
    /*사진위에 텍스트 css*/

    .background-wrap {
        background-image: url('./img/soge1.jpg');
        background-size: 800px 450px;
        width: 800px;
        height: 450px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left: 23%;
    }
    .text-on-image{
        margin-left: 25%;
    }

.content {
  display: flex;
  flex-direction: column;
}

.content span {
  color: white;
}

.content span:nth-child(1) {
  font-size: 25px;
  font-weight: bold;
}

.content span:nth-child(2) {
  font-size: 20px;
}

.background-wrap1 {
        background-image: url('./img/soge2.jpg');
        background-size: 800px 450px;
        width: 800px;
        height: 450px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left: 23%;
    }
    .text-on-image1{
        margin-left: 25%;
    }

    /*전화 png*/
    .call{
        background-image: url('./img/telephone.png');
        background-size: 100px 100px;
        width: 100px;
        height: 100px;
		margin:0px auto;
    }

    /*위치*/
    #h3{
    	text-align:center;
        font-size: 30px;
    }

    #map{
        text-align:center;
    }

    .p{
        text-align:center;
    }

    /*버튼 css*/
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

    <h2 id="h2">About Us</h2>
    <br><br>
    <div class="text-on-img">
        <div class="background-wrap">
          <div class="content">
            <span>스트레스 프리 커피.</span><br>
            <span>우리는 '불편함'을 최소화하고<br>
                '건강한' 커피를 만드는 데 집중합니다.<br>
                현대인이 과도한 카페인으로부터 비롯된<br>
                수면불편, 불편한 식습관, 불편한 <br>
                일상에서 벗어날 수 있는<br>
                <br>
                스트레스 프리 커피를 지향합니다.</span>
          </div>
        </div>
    </div>
    <div class="text-on-img1">
        <div class="background-wrap1">
          <div class="content">
            <span>심플. 그리고 테이스티.</span><br>
            <span>중간만가자 카페는 심플하고 테이스티합니다.<br>
                전문가의 손길이 닿은 품질 좋은 커피가<br>
                심플해지는 것은 당신의 라이프를<br>
                <br>
                더욱 지적이고 아름답게 하는 것이기에.</span>
          </div>
        </div>
    </div>


    <br><br><br><br>
    <h3 id="h3">Call Us!</h3>
    <div class="call"></div>

    <p class="p">051-733-3333</p>

    <br><br>
    <h3 id="h3">Find Us!</h3>
    <div id="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3261.6387162417855!2d129.06926391447902!3d35.165629980317696!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568eca70d07d243%3A0xca0acf886f784030!2z64-Z7J2Y6rO87ZWZ64yA7ZWZ6rWQ!5e0!3m2!1sko!2skr!4v1655534502388!5m2!1sko!2skr" width="700" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>

    <br><br><br><br>
    <!--footerrrrrrrrrrrrrrrrr-->
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
</html>