<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/AC.css">
<script type="text/javascript" src="./js/AC.js"></script>
<title>회원가입</title>
</head>
<body>
<div class="register">
        <h3>회원가입</h3>
        <form name="form" action="CApro.jsp?" method="post">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        이름 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="text" class="name" name="name" id="name" onkeypress="javascript:return onlyKorean('name');" placeholder="이름을 입력해주세요" required autofocus>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        아이디 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="text" name="id" id="id" class="input_id" pattern="[A-Za-z0-9]+" placeholder="영소문자 4자~16자" minlength="4" maxlength="16" required>
                    </li>
                    <li class="item">
                         <input type="button" class="idcheck" name="idcheck" id="idcheck" onclick="gocheck()" value="중복확인">
                    </li>
                </ul>
                
                <ul class="container">
                    <li class="item center">
                        비밀번호 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="password" name="pass" id="pass" onchange="same()" pattern="[A-Za-z0-9]+" placeholder="영소문자 4자~16자" minlength="4" maxlength="16" required="required">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        비밀번호 확인 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="password" name="pass2" id="pass2" onchange="same()" pattern="[A-Za-z0-9]+" placeholder="영소문자  4자~16자" minlength="4" maxlength="16" required="required">
                    </li>
                    <li class="item">
                        <span id="same"></span>
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        생년월일 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="date" name="birth" id="birth" min="1950-06-25" required="required">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>

                  <ul class="container">
                    <li class="item center">

                </ul>
                <ul class="container">
                    <li class="item center">
                        전화번호 <img src="./img/ess.gif" alt="필수"/>
                    </li>
                    <li class="item">
                        <input type="tel" name="tel" id="tel" placeholder="-빼고 입력해주세요." minlength="11" maxlength="11" pattern="[0-9]+" required="required">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        이메일 
                    </li>
                    <li class="item">
                        <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요.">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <input type="submit" class="submit" onclick="ACsubmit()" value="가입하기">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <input type="button" class="submit" onclick="window.close()" value="취소하기">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
            </div>
        </form>
    </div>

    
</body>
<script>
/*---------------------------------------------------------*/
// js 파일에 따로 뽑아두면 birth의  max 설정이 바로 안돼서 페이지 내부에 둠
// 생일 입력 부분의 날짜 지정 최대를 오늘 날짜로 
var today = new Date();
var day = today.getDate();
var month = today.getMonth() + 1; //January is 0!
var year = today.getFullYear();

if (day < 10) {
   day = '0' + day;
}

if (month < 10) {
   month = '0' + month;
} 
    
today = year + '-' + month + '-' + day;
document.getElementById("birth").setAttribute("max",today);
/*-----------------------------------------------------------*/
// 아이디 중복확인 체크
 function gocheck(){
		var go = document.getElementById('id').value;
		if(go!=""){		
		location="checkId.jsp?id="+go;
		}else if(go==""){
			alert("아이디를 입력해주세요");
			document.getElementById('id').focus();
		}
	}
/*----------------------------------------------------------*/
</script>
</html>
