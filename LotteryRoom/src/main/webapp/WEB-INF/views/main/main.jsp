<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
form {
	width: 300px;
	display: inline-block;
	text-align: center;
	background-color: #ffffff;
	border: .10rem solid #e5e5e5;
	padding-bottom: 10px;
}

fieldset {
	border: none;
}

.bold {
	width: 994px;
	height: 240px;
	font-weight: bold;
	text-align: center;
	background-color: #ffffff;
	border: .10rem solid #e5e5e5;
	padding-bottom: 10px;
}

.bolda {
	width: 300px;
	height: 240px;
	text-align: center;
	background-color: #ffffff;
	border: .10rem solid #e5e5e5;
	padding-bottom: 10px;
}

legend {
	font-weight: bold;
	margin-top: 20px;
	font-family: "Playfair Display", Georgia, "Times New Roman", serif
}

.login {
	width: 250px;
	border: 0px solid rgb(0, 0, 0);
	border-radius: 10px;
	background-color: #ddd;
	padding: 20px;
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 5px;
	font-family: "Playfair Display", Georgia, "Times New Roman", serif
		/*rtl:Amiri, Georgia, "Times New Roman", serif*/;
}

.idpw {
	font-size: 12px;
	text-decoration: none;
	color: black;
	font-family: "Playfair Display", Georgia, "Times New Roman", serif
}

.container1 {
	color: #333;
	margin: 0 auto;
	text-align: center;
}

h3 {
	font-weight: bold;
	letter-spacing: .075rem;
	text-transform: uppercase;
}

li {
	display: inline-block;
	font-size: 1.5rem;
	list-style-type: none;
	padding-right: 1em;
	padding-left: 1em;
	text-transform: uppercase;
}

li span {
	font-size: 2.3rem;
}

.emoji {
	display: none;
}

.emoji span {
	font-size: 2rem;
}

.btn {
	width: 50px;
	height: 50px;
	font-size: 30px;
	border-width: 1px;
	background-color: rgb(255, 255, 255);
	font-size: 20px;
	border: 1px solid lightgray;
	margin: 5px;
	border-radius: 30px;
	pointer-events: none;
	font-weight: bold;
}
</style>

<tr>
	<td style="width: 1000px; height: 200px;">
		<fieldset class="bold">
			<div>
				<table style="width: 997px;">
					<tr>
						<td style="font-size: 25px;"><b id="ltTimes1"></b><b>회</b> 당첨결과 
					</tr>
					<tr>
						<td>(<span id="winDate"></span>)추첨</td>
					</tr>
					<tr>
						<td><button class="btn" id="btn1"></button>
							<button class="btn" id="btn2"></button>
							<button class="btn" id="btn3"></button>
							<button class="btn" id="btn4"></button>
							<button class="btn" id="btn5"></button>
							<button class="btn" id="btn6"></button> <span style="font-size: 40px; position: relative; top: 8px;"> + </span>
							<button class="btn" id="btn7"></button></td>
					</tr>
					<tr>
						<td><b id="ltTimes2"></b>회차 당첨금액 <b class="cumulativeAmount" style="font-size: 20px; color: brown;"></b>원</td>
					</tr>
				</table>
			</div>
			<br>
			<div class="container1">
				<h3 id="ltTimes3">회차 추첨일</h3>
				<div id="countdown">
					<ul>
						<li><span id="days"></span> 일 </li>
						<li><span id="hours"></span> 시간 </li>
						<li><span id="minutes"></span> 분 </li>
						<li><span id="seconds"></span> 초 </li>
					</ul>
				</div>
			</div>
		</fieldset>
	</td>
	<td><c:choose>
			<c:when test="${UserId == null }">
				<form action="login.do" method="get" style="height: 240px;">
					<fieldset>
						<legend>가즈아 복권방</legend>
						<button type="submit" class="login">Lottery Room Login</button>
					</fieldset>
					<fieldset>
						<a class="idpw" href="#">아이디 찾기</a><a class="idpw"> / </a><a
							class="idpw" href="#">비밀번호 찾기</a><a class="idpw"> / </a><a
							class="idpw" href="membership.do">회원가입</a> <a
							href="javascript:kakaoLogin();"><img
							src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png"
							style="margin-top: 10px; height: 40px; width: auto;"></a>
					</fieldset>
				</form>
			</c:when>
			<c:otherwise>
				<form action="logout.do" method="get" style="height: 240px;">
					<fieldset>
						<p style="margin-top: 40px;">${UserName }님</p>
					</fieldset>
					<fieldset>
						<a class="idpw" href="logout.do">로그아웃</a><a class="idpw"> / </a><a
							class="idpw" href="#">회원정보 변경</a>
					</fieldset>
				</form>
			</c:otherwise>
		</c:choose></td>
</tr>

<tr>
	<td style="width: 1000px; height: 500px;">
		<fieldset class="bold" style="height: 490px;">
			<iframe style="width: 100%; height: 100%;"
				src="mainBoard.do?mbGrade=E"></iframe>
		</fieldset>
	</td>

	<td style="width: 200px; height: 500px;">
		<fieldset class="bolda" style="height: 490px;">
			<div class="part2" style="float: left;">
				<h4>실시간 예상 당첨금</h4>
				<table class="part2" style="margin-top: 20px;">
					<tr>
						<td class="textleft" style="color: firebrick;">1등</td>
						<td id="firWn" style="color: firebrick;"></td>
					</tr>
				</table>
				<table class="part2">
					<tr>
						<td class="textleft">2등</td>
						<td id="secWn"></td>
					</tr>
				</table>
				<table class="part2">
					<tr>
						<td class="textleft">3등</td>
						<td id="thrWn"></td>
					</tr>
				</table>
				<table class="part2">
					<tr>
						<td class="textleft">4등</td>
						<td id="fourWn"></td>
					</tr>
				</table>
				<table class="part2">
					<tr>
						<td class="textleft">5등</td>
						<td id="fifWn"></td>
					</tr>
				</table>
			</div>
		</fieldset>
	</td>
</tr>
<div style="position: fixed; margin-left: 1180px; margin-top: 600px;">
	<a id="chat-channel-button" href="javascript:Kakaochat()"> <img
		src="./images/kakaotalk.png" style="width: 80px; height: 80px;"
		alt="카카오톡 채널 채팅하기 버튼" />
	</a>
</div>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
	crossorigin="anonymous"></script>
<script>
  Kakao.init('e2c2c7baf351005289e1b04b186f5015'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script>
  function chatChannel() {
    Kakao.Channel.chat({
      channelPublicId: '_xhTxnYxj',
    });
  }
  function Kakaochat(){
	  disconnectKakaoAccount();
	  kakaoLogout();
	  chatChannel();
	  
  }
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
console.log(${CuReward});
let firWn = ${CuReward * 0.6};
firWn = firWn.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
let secWn = ${CuReward * 0.25};
secWn = secWn.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
let thrWn = ${CuReward * 0.1};
thrWn = thrWn.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
let fourWn = ${CuReward * 0.04};
fourWn = fourWn.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
let fifWn = ${CuReward * 0.01};
fifWn = fifWn.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

document.getElementById("firWn").innerHTML = firWn;
document.getElementById("secWn").innerHTML = secWn;
document.getElementById("thrWn").innerHTML = thrWn;
document.getElementById("fourWn").innerHTML = fourWn;
document.getElementById("fifWn").innerHTML = fifWn;
(function() {
   const second = 1000,
      minute = second * 60,
      hour = minute * 60,
      day = hour * 24;

   let lotto = new Date("May 16, 2023 10:36:50");

     let countdown = lotto.getTime();
     let x = setInterval(function() {

         let now = new Date().getTime();
           let distance = countdown - now;

         document.getElementById("days").innerText =
            Math.floor(distance / (day));

         document.getElementById("hours").innerText =
            Math.floor((distance % (day)) / (hour));

         document.getElementById("minutes").innerText =
            Math.floor((distance % (hour)) / (minute));

         document.getElementById("seconds").innerText =
            Math.floor((distance % (minute)) / (second));

         if (distance < 0) {
        	 lotto.setDate(lotto.getDate() + 7);
             countdown = lotto.getTime();
             
        	 let xhtp = new XMLHttpRequest();
             xhtp.open('post', 'addLotto.do');
             xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
             xhtp.send('cumulativeAmount=${CuReward}');
         	 xhtp.onload = function () {
             let result = JSON.parse(xhtp.response);
             if (result.retCode == 'Success') {
                alert('당첨번호 발표 완료.');
                xhtp.open('get', 'getLotto.do');
             	xhtp.send();
             	xhtp.onload = function(){
             		console.log(xhtp.response)
             		let ltInfo = JSON.parse(xhtp.response);
             		let ltTimes1 = document.querySelector('#ltTimes1');
             		let ltTimes2 = document.querySelector('#ltTimes2');
             		let ltTimes3 = document.querySelector('#ltTimes3');
             		ltTimes1.innerText = ltInfo.ltInfo.ltTimes;
             		ltTimes2.innerText = ltInfo.ltInfo.ltTimes;
             		ltTimes3.innerText = ltInfo.ltInfo.ltTimes+1+'회차 추첨일';
             		
             		let winDate = document.getElementById('winDate');
             		winDate.innerText = ltInfo.ltInfo.winDate;
             		
             		let cumulativeAmount = document.querySelector(".cumulativeAmount");
             		cumulativeAmount.innerText = ltInfo.ltInfo.cumulativeAmount;

             		let winFir = document.getElementById('btn1');
             		let winSec = document.getElementById('btn2');
             		let winThr = document.getElementById('btn3');
             		let winFour = document.getElementById('btn4');
             		let winFive = document.getElementById('btn5');
             		let winSix = document.getElementById('btn6');
             		let winBonus = document.getElementById('btn7');
             		winFir.innerText = ltInfo.ltInfo.winFir;
             		winSec.innerText = ltInfo.ltInfo.winSec;
             		winThr.innerText = ltInfo.ltInfo.winThr;
             		winFour.innerText = ltInfo.ltInfo.winFour;
             		winFive.innerText = ltInfo.ltInfo.winFive;
             		winSix.innerText = ltInfo.ltInfo.winSix;
             		winBonus.innerText = ltInfo.ltInfo.winBonus;
             	} 
             } else if (result.retCode == 'Fail') {
                alert('처리 중 에러.');
             }

          }    	
       }
      }, 0);
}());

	//로또 번호 생성 시 직전 회차 정보 조회
	let xhtp = new XMLHttpRequest();
	xhtp.open('get', 'getLotto.do');
	xhtp.send();
	xhtp.onload = function(){
		console.log(xhtp.response)
		let ltInfo = JSON.parse(xhtp.response);
		let ltTimes1 = document.querySelector('#ltTimes1');
 		let ltTimes2 = document.querySelector('#ltTimes2');
 		let ltTimes3 = document.querySelector('#ltTimes3');
 		ltTimes1.innerText = ltInfo.ltInfo.ltTimes;
 		ltTimes2.innerText = ltInfo.ltInfo.ltTimes;
 		ltTimes3.innerText = ltInfo.ltInfo.ltTimes+1+'회차 추첨일';

		let winDate = document.getElementById('winDate');
		winDate.innerText = ltInfo.ltInfo.winDate;
 		
 		let originalDate = winDate.innerText;
 		let formattedDate = new Date(originalDate).toISOString().split('T')[0];
 		winDate.innerText = formattedDate;
		
		let cumulativeAmount = document.querySelector(".cumulativeAmount");
		cumulativeAmount.innerText = ltInfo.ltInfo.cumulativeAmount;
		
		let amount = parseInt(cumulativeAmount.innerText);
 		let formattedAmount = amount.toLocaleString();
 		cumulativeAmount.innerText = formattedAmount;

		let winFir = document.getElementById('btn1');
		let winSec = document.getElementById('btn2');
		let winThr = document.getElementById('btn3');
		let winFour = document.getElementById('btn4');
		let winFive = document.getElementById('btn5');
		let winSix = document.getElementById('btn6');
		let winBonus = document.getElementById('btn7');
		winFir.innerText = ltInfo.ltInfo.winFir;
		winSec.innerText = ltInfo.ltInfo.winSec;
		winThr.innerText = ltInfo.ltInfo.winThr;
		winFour.innerText = ltInfo.ltInfo.winFour;
		winFive.innerText = ltInfo.ltInfo.winFive;
		winSix.innerText = ltInfo.ltInfo.winSix;
		winBonus.innerText = ltInfo.ltInfo.winBonus;

		let winFirValue = parseInt(winFir.innerText);
		let winSecValue = parseInt(winSec.innerText);
		let winThrValue = parseInt(winThr.innerText);
		let winFourValue = parseInt(winFour.innerText);
		let winFiveValue = parseInt(winFive.innerText);
		let winSixValue = parseInt(winSix.innerText);
		let winBonusValue = parseInt(winBonus.innerText);
		
		function changeButtonColor(button, value) {
			  if (value >= 1 && value <= 10) {
			    button.style.backgroundColor = 'gold';
			  } else if (value >= 11 && value <= 20) {
			    button.style.backgroundColor = 'lightskyblue';
			  } else if (value >= 21 && value <= 30) {
			    button.style.backgroundColor = 'lightcoral';
			  } else if (value >= 31 && value <= 40) {
			    button.style.backgroundColor = 'lightgray';
			  } else if (value >= 41 && value <= 45) {
			    button.style.backgroundColor = 'lightgreen';
			  }
			}
		
		changeButtonColor(winFir, winFirValue);
		changeButtonColor(winSec, winSecValue);
		changeButtonColor(winThr, winThrValue);
		changeButtonColor(winFour, winFourValue);
		changeButtonColor(winFive, winFiveValue);
		changeButtonColor(winSix, winSixValue);
		changeButtonColor(winBonus, winBonusValue);
	} 

//e800e9ce61449ded246202aad160d909
	Kakao.init("e800e9ce61449ded246202aad160d909");
	console.log(Kakao.isInitialized());
	function kakaoLogin(){
		window.Kakao.Auth.login({
			scope : 'profile_nickname, account_email, birthday',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me', 
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account.email);
						location.href="kakaologin.do?email="+kakao_account.email;
					}
				});
			}
		});
	}
	
	if(${UserId == null}){
		console.log('1111');
		disconnectKakaoAccount()
	
	}
	function kakaoLogout() {
		  if (Kakao.Auth.getAccessToken()) {
		    Kakao.Auth.logout(function() {
		      console.log('Successfully logged out!');
		      Kakao.Auth.setAccessToken(undefined); // 엑세스 토큰 삭제
		    });
		  }
		}

		function disconnectKakaoAccount() {
		  if (Kakao.Auth.getAccessToken()) {
		    Kakao.API.request({
		      url: '/v1/user/unlink',
		      success: function (response) {
		        console.log(response);
		        kakaoLogout(); // 로그아웃 함수 호출
		      },
		      fail: function (error) {
		        console.log(error);
		      },
		    });
		  } else {
			    kakaoLogout(); // 로그아웃 함수 호출
		  }
		}
</script>