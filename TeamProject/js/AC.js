/*---------------------------------------------------------*/
//
//
//
//						회원 관리 자바 스크립트					   //
//
//
//
/*---------------------------------------------------------*/

//-----------------------------------------------------------
// 자식창 생성 조정 함수 : left랑 top을 조절해서 화면 중간 쯤에 창 생성
function createPopupWin(pageURL, pageTitle
        ,popupWinWidth, popupWinHeight
        ) {
	
	var left = (screen.width - popupWinWidth) / 2;
    var top = (screen.height - popupWinHeight) / 4;
	var myWindow = window.open(pageURL, pageTitle,
        'resizable=no, location=no, width=' + popupWinWidth
        + ', height=' + popupWinHeight + ', top='
        + top + ', left=' + left).window;
}

//------------------------------------------------------------ 
// ↓ 비밀번호확인과 일치여부로 표시 나타내기
    function same(){
        var same = document.getElementById('same');
        if(pass.value!="" && pass2.value!=""){
                if(pass.value==pass2.value){
                    same.innerHTML='비밀번호가 일치합니다.'
                    same.style.color='blue';
                    same.style.fontSize='7pt';
                    
                }
                else{
                    same.innerHTML='비밀번호가 다릅니다.';
                    same.style.color='red';
                    same.style.fontSize='7pt';
                }
            }
        }
//-------------------------------------------------------------
// 회원가입 필수정보입력체크
    function ACsubmit(){
        var namec = document.getElementById('name');
        var idc = document.getElementById('id');
        var passc = document.getElementById('pass');
        var pass2c = document.getElementById('pass2');
        var birthc = document.getElementById('birth');
        var telc = document.getElementById('tel');
        
        if(namec.value==""){
            alert("이름을 입력해주세요");
            namec.focus();
        }
        else if(idc.value==""){
            alert("아이디를 입력해주세요");
            idc.focus();
        }
        else if(passc.value==""){
            alert("비밀번호를 입력해주세요");
            passc.focus();
        }
        else if(pass2c.value==""){
            alert("비밀번호확인을 입력해주세요");
            pass2c.focus();
        }
        else if(birthc.value==""){
            alert("생년월일을 선택해주세요");
            birthc.focus();
        }
        else if(telc.value==""){
            alert("전화번호를 입력해주세요");
            telc.focus();
        }else if(namec.value != ""){
        		if(idc.value != ""){
        			if(passc.value != ""){
        				if(pass2c.value != ""){
        					if(passc.value == pass2c.value){
        						if(birthc.value != ""){
        							if(telc.value != ""){
        								//부모창을 페이지 이동시킴
	                                    opener.location.href="login.html";
        							}
        						}
        					}
        				}
        			}
        		}
        }    
    }
//---------------------------------------------------------------------
// 회원정보수정 필수정보입력체크
    function ACupdate(){
        var namec = document.getElementById('name');
        var passc = document.getElementById('pass');
        var pass2c = document.getElementById('pass2');
        var telc = document.getElementById('tel');
        
        if(namec.value==""){
            alert("이름을 입력해주세요");
            namec.focus();
        }
        else if(idc.value==""){
            alert("아이디를 입력해주세요");
            idc.focus();
        }
        else if(passc.value==""){
            alert("비밀번호를 입력해주세요");
            passc.focus();
        }
        else if(pass2c.value==""){
            alert("비밀번호확인을 입력해주세요");
            pass2c.focus();
        }
        else if(birthc.value==""){
            alert("생년월일을 선택해주세요");
            birthc.focus();
        }
        else if(telc.value==""){
            alert("전화번호를 입력해주세요");
            telc.focus();
        }   
    }
//---------------------------------------------------------------------
// 이름칸 한글 체크 한글 이외에 문자 들어가면 이름 칸 초기화
    function onlyKorean(inputId) {
        var str=document.getElementById(inputId).value;
        for (i = -1; i < str.length; i++) {
            if (!((str.charCodeAt(i) > 0x3130 && str.charCodeAt(i) < 0x318F) || (str.charCodeAt(i) >= 0xAC00 && str.charCodeAt(i) <= 0xD7A3))) {
    
                alert("한글만 입력해 주세요");
                document.getElementById('name').value="";
                
                } 
            }
        }
//----------------------------------------------------------------------
// 탈퇴하기 함수 , confirm으로 확인 취소 버튼이 있는 메시지 창을 띄움
	function delfunc(){
		var del = confirm("탈퇴하시겠습니까?");
		if(del==true){
			location.href='ACDel.jsp?id='+(document.getElementById('id').value);
		}else{}
	}
//-----------------------------------------------------------------------
// 로그인 안됐을때 사용
function cwrite(){
	alert("로그인 해주세요");
	location='login.html';
}
// 로그아웃 시 물어봄
function outc(){
	var out = confirm("로그아웃 하시겠습니까?");
	if(out==true){
		location="logoutAction.jsp";
	}
}
