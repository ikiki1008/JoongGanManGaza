<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>main index</title>
    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Gowun+Batang&family=Lato&family=M+PLUS+Rounded+1c&family=Noto+Serif+KR:wght@300;600;700&family=Open+Sans:wght@300&family=Poppins:wght@400;700&family=Secular+One&family=Source+Sans+Pro:wght@300&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
	<script type="text/javascript" src="./js/AC.js"></script>
	<link rel="stylesheet" href="./css/main.css">
</head>

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
    <div class="none">
    </div>

    <!--from here starts to see the banner moving!!!-->
    <div id="move">
        <div class="slideshow-container">
            <div class="mySlides fade">
              <div class="numbertext">1 / 3</div>
              <img src="http://theventi.co.kr/new/upload/banner/30927906_JQHRrz8m_20220427094802.png" style="width:100%">
            </div>
            
            <div class="mySlides fade">
              <div class="numbertext">2 / 3</div>
              <img src="http://theventi.co.kr/new/upload/banner/30927906_jtnri1fv_20220405052342.png" style="width:100%">   
            </div>
            
            <div class="mySlides fade">
              <div class="numbertext">3 / 3</div>
              <img src="http://theventi.co.kr/new/upload/banner/30927906_QD0WGPcy_20210429105621.png" style="width:100%"> 
            </div>
            
        </div>
        <br>
        <div style="text-align:center">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
        </div>
    </div>
    

    <div id="moveIt">
        <div><img src="./img/pic4.jpg"><img src="./img/pic5.jpg"></div>
    </div>
    
    <section id="section">
        <article>
            저희 카페를 <strong>가까이에서 경험</strong>해보세요!<br><br>
            <small>차별화된 커피 경험을 누릴 수 있는 <strong>리저브 매장</strong></small><br>
            <small>다양한 방법으로 편리하게 즐길 수 있는 <strong>드라이브 스루 매장</strong></small><br>
            <small>함께해서 더 따뜻할 수 있는 지역사회 소통 공간 <strong>커뮤니티 매장</strong></small><br>
            <br><button onClick="location.href='gage.jsp'">매장 찾기</button>
        </article>
    </section>
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
    <!--사진 움직이는 스크립트, body안에 넣지 않으면 적용 안되더라-->
    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}    
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";  
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 3000); // 3초마다 이미지 슬라이딩
        }


        function debounce(func, wait = 20, immediate = true) {
        var timeout;
        return function () {
            var context = this,
            args = arguments;
            var later = function () {
            timeout = null;
            if (!immediate) func.apply(context, args);
            };
            var callNow = immediate && !timeout;
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
            if (callNow) func.apply(context, args);
        };
        }

        const sliderImages = document.querySelectorAll(".slide-in");

        function checkSlide() {
        sliderImages.forEach((sliderImage) => {
            // 뷰포트 최상단 기준
            const imageHalf = window.scrollY + window.innerHeight;
            const isViewBottomPast =
            imageHalf > sliderImage.offsetTop + sliderImage.height / 2;
            // 뷰포트 최하단 기준
            const imageBottom = sliderImage.offsetTop + sliderImage.height;
            const isViewTopPast = window.scrollY < imageBottom;
            if (isViewBottomPast && isViewTopPast) {
            sliderImage.classList.add("active");
            } else {
            sliderImage.classList.remove("active");
            }
        });
        }

        window.addEventListener("scroll", debounce(checkSlide));

    </script> 
</html>