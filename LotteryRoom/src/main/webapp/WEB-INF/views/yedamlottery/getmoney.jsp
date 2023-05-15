<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head><style>
form {
	width: 600px;
}
.btn-3d {
  position: relative;
  display: inline-block;
  font-size: 22px;
  padding: 20px 60px;
  color: white;
  margin: 20px 10px 10px;
  right:30px;
  border-radius: 6px;
  text-align: center;
  transition: top .01s linear;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
.btn-3d.blue:hover   {background-color: #e2e2e2;}

.btn-3d:active {
  top: 9px;
}
.btn-3d.blue {
  background-color: #6DA2D9;
  box-shadow: 0 0 0 1px #6698cb inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 rgba(110, 164, 219, .7),
        0 8px 0 1px rgba(0,0,0,.4),
        0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.blue:active {
  box-shadow: 0 0 0 1px #6191C2 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 0 0 1px rgba(0,0,0,0.4);
}
.p1 {
	margin-left:350px;
	font-weight:bold;
	font-size : 30px;
	color:#FF0000;
	font-family: 'Roboto', sans-serif;
	
	letter-spacing: 0.05em;
    line-height: 1.5;
	
}
td{
	color: transparent;
	text-shadow: 0 0 0 black;
 	}
 	
 	
</style>
<meta charset="UTF-8">
<title>충전하기</title>
</head>
<body>
<h2><strong>충전하기</strong></h2>
<hr>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<img src="./images/욱환.png" alt="..." style="width: 300px; height: 300px; margin-left: 350px; color: transparent; text-shadow: 0 0 0 black; position: relative; left: 20px;">
<p class="p1">충전과 출금 공간입니다.</p>
<p class="p1">현재 마일리지 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${Mileage }" />원 </p>
<%-- <p>현재 마일리지 : <span id="mileage"><fmt:formatNumber type="number" maxFractionDigits="3" value="${Mileage}" />원</span></p>--%>
	<table style="margin-left:300px;">
		<tr>
		<td><button type="button" class="btn-3d blue" onclick="location.href='recharge.jsp'">충전하기</button></td>
		<td><button type="button" style="margin-left:50px; background-color: #0b1e7e; color: white;" class="btn-3d" onclick="minus()">출금하기</button></td>
		</tr>
	</table>
	<script>
	function minus(){
		let minus = prompt('출금할 금액 적어주세요');
		minus = Number(minus);
		if(minus > ${Mileage}){
			alert('현재 마일리지보다 큰 금액은 출금할 수 없습니다');
			return;
		}
		fetch("minusMileage.do?userId=${UserId}&mileage=" + minus)
		.then(result => result.json())
		.then(resolve => {
			console.log(resolve.real);
			let mileage = document.querySelector('#mileage');
			mileage.innerText = resolve.real;
		})
		.catch(error => console.log(error));
		location.href="plusMileage.do?userId=${UserId}";
	}
	
	</script>
</body>
</html>