<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
h4{
	padding-top: 10px;
	text-align: left;
}
all{
	width: 930px;
}
.part1{
	width: 900px;
}
table.part1{
	border: 1px solid;
	border-color: lightgray;
	border-collapse: collapse;
	height: 200px;
}
td{
	text-align: center;
}
.text, .textleft{
	text-align: left;
	padding-left: 50px;
	margin-left: 10px;
}
.textleft{
	font-size: 20px;
	
}
table.part2{
	border: 1px solid;
	border-color: lightgray;
	border-collapse: collapse;
	margin-bottom: 5px;
	width: 450px;
	height: 60px;
	font-weight: bold;
}
#nextLtTimes{
	vertical-align: bottom;
	padding-top: 15px;
	font-weight: bold;	
}
#cuReward{
	font-size: 40px;
	font-weight: bold;
}
#firWn, #secWn, #thrWn, #fourWn, #fifWn{
	text-align: center;
	font-size: 25px;
	padding-right: 30px;
}
.textall{
	padding-top: 80px;
}
</style>
<div id="all">
	<h4 class="part1">실시간 당첨금 내역</h4>
	<hr class="part1">
	<div class="part1">
		<table class="part1">
			<tr>
				<td style="vertical-align: bottom; font-size: 24px;"><span id="nextLtTimes" style="font-size: 28px;"></span>회차 누적 당첨금</td>
			</tr>
			<tr>
				<td style="vertical-align: top; font-size: 28px"><span id="cuReward" style="font-size: 50px; color: orange;"></span> 원</td>
			</tr>
		</table>
	</div>
	<br>
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
		</table >
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
	<div class="textall" style="float: left; width: 420px;">
		<p class="text">※ 주의사항</p>
		<div class="text">
		- 본 누적 당첨금은 당첨결과 발표 직전까지 합산된 복권 구매금액입니다.<br />
		- 고액 당첨금은 해당 회차의 복권 추첨일을 기준으로 <span style="color: red">유효기간 1년</span>에 한해 은행방문으로 수령 가능합니다. <br/>
		- 당첨금 지급신청 시 은행 영업시간 내 청구/등록하여야 하며, 당첨금 지급기한 마감일이 은행 영업일이 아닌 경우, 익 영업일을 지급기한 종료일로 합니다. <br/>
		- 지급기한일 초과 시 당첨자가 미수령한 당첨금액은 복권기금으로 귀속됩니다.
		</div>
	</div>
</div>
<script>
	console.log(${CuReward})
	let nextLtTimes = ${LtTimes + 1};
	document.getElementById("nextLtTimes").innerHTML = nextLtTimes;
	let cuReward = ${CuReward};
	cuReward = cuReward.toLocaleString();
	document.getElementById("cuReward").innerHTML = cuReward;

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
</script>