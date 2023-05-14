<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

	#ltResult{
		border: 1px solid lightgray;
		border-width: 1px;
		width: 930px;
		padding: 10px;
	}
	#ltR-title{
		font-size: 28px;
		font-weight: bold;
	}
	table {
		margin-left: auto;
		margin-right: auto;
	}

	form{
		width: 930px;
		margin-left: 0px;
		margin-right: 0px;
		padding: 0px;
	}

	#infoTable {
		width: 100%;
		border-top: 1px solid #948e8e;
		border-collapse: collapse;
		line-height: 60px;
	}
	
	.borderStyle{
		border-bottom: 1px solid lightgray;
		border-left: 1px solid lightgray;
		padding: 10px;
		
	}
	
	#rank{
		border-left: none;
	}
	
	#price0, #price1, #price2, #price3, #price4{
		color: indianred;
	}
	
	thead{
		border-bottom: 1px solid lightgray;
		border-left: none;
		padding: 10px;
		text-align: center;
	}
	
	td {
		text-align: center;
	}

	.right {
		text-align: right;
	}

	.btn{
		width: 50px;
		height: 50px;
		font-size: 30px;
		border-width : 1px ;
		background-color: rgb(255, 255, 255);
		font-size : 20px;
		border: 1px solid lightgray;
		margin: 5px;
		border-radius: 30px;
		pointer-events: none;
	}
	
	.gold{
		background-color: gold;
	}
	.lightskyblue{
		background-color: lightskyblue;
	}
	
	.lightcoral{
		background-color: lightcoral;
	}
	
	.lightgray{
		background-color: lightgray;
	}
	
	.lightgreen{
		background-color: lightgreen;
	}
	
	.basicBtn{
		background-color: black;
		color: white;
		font-size: 14px;
		width: 48px;
		height: 28px;
		position: relative;
		bottom: 1.5px;
	}

</style>

<form action="listLotto.do" method="get">
	<p class="right">회차 바로가기
		<select name="selectRound" id="selectRound">
			<c:forEach var="listRound" items="${list}">
				<option data-list="${listRound.ltTimes}" data-time="${lottoResult.ltTimes }"
					${listRound.ltTimes==lottoResult.ltTimes ? 'selected' : '' }>
					<c:out value="${listRound.ltTimes}"></c:out>
				</option>
			</c:forEach>
		</select>
		<button class="basicBtn" type="submit">조회</button>
	</p>
	<div>
		<table id="ltResult">
				<tr id="ltR-title">
					<td style="padding-top: 40px;">${lottoResult.ltTimes}회 당첨결과</td>
				</tr>
				<tr>
					<td>(${winDate} 추첨)</td>
				</tr>
			<tbody>
				<tr>
					<td><button class="btn" id="btn1">${lottoResult.winFir}</button>
					<button class="btn" id="btn2">${lottoResult.winSec}</button>
					<button class="btn" id="btn3">${lottoResult.winThr}</button>
					<button class="btn" id="btn4">${lottoResult.winFour}</button>
					<button class="btn" id="btn5">${lottoResult.winFive}</button>
					<button class="btn" id="btn6">${lottoResult.winSix}</button>
					<span style="font-size: 40px; font-weight: bold; position: relative; top: 5px;">+</span>
					<button class="btn" id="btn7">${lottoResult.winBonus}</button></td>
				</tr>
				<tr id="">
					<td style="height: 30px; text-align: right; padding-right: 240px; padding-bottom: 20px;"><pre>당첨번호                        보너스</pre></td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	<table id="infoTable">
		<thead>
			<tr style="line-height: 40px;">
				<th style="border-right: 1px solid lightgray;">순위</th>
				<th style="border-right: 1px solid lightgray;">등위별 총 당첨금액</th>
				<th style="border-right: 1px solid lightgray;">당첨인원 수</th>
				<th style="border-right: 1px solid lightgray;">1인당 당첨금액</th>
				<th>당첨기준</th>
			</tr>
		</thead>
		<tbody id="winnerInfo">
			<c:forEach var="wnInfo" items="${Info}">
				<tr>
					<td class="borderStyle" id="rank">${wnInfo.winRank}등</td>
					<c:choose>
						<c:when test="${wnInfo.winRank == 1}">
							<td id="price0" class="borderStyle">${wnInfo.winPrice}</td>
							<td id="num0" class="borderStyle">${wnInfo.winNum}</td>
							<td id="result0" class="borderStyle"></td>
							<td class="borderStyle">당첨번호 <b>6개</b> 숫자일치</td>
						</c:when>
						<c:when test="${wnInfo.winRank == 2}">
							<td id="price1" class="borderStyle">${wnInfo.winPrice}</td>
							<td id="num1" class="borderStyle">${wnInfo.winNum}</td>
							<td id="result1" class="borderStyle"></td>
							<td style="line-height: 20px;" class="borderStyle">당첨번호 <b>5개</b> 숫자일치<br>+<b>보너스</b>숫자일치</td>
						</c:when>
						<c:when test="${wnInfo.winRank == 3}">
							<td id="price2" class="borderStyle">${wnInfo.winPrice}</td>
							<td id="num2" class="borderStyle">${wnInfo.winNum}</td>
							<td id="result2" class="borderStyle"></td>
							<td class="borderStyle">당첨번호 <b>5개</b> 숫자일치</td>
						</c:when>
						<c:when test="${wnInfo.winRank == 4}">
							<td id="price3" class="borderStyle">${wnInfo.winPrice}</td>
							<td id="num3" class="borderStyle">${wnInfo.winNum}</td>
							<td id="result3" class="borderStyle"></td>
							<td class="borderStyle">당첨번호 <b>4개</b> 숫자일치</td>
						</c:when>
						<c:when test="${wnInfo.winRank == 5}">
							<td id="price4" class="borderStyle">${wnInfo.winPrice}</td>
							<td id="num4" class="borderStyle">${wnInfo.winNum}</td>
							<td id="result4" class="borderStyle"></td>
							<td class="borderStyle">당첨번호 <b>3개</b> 숫자일치</td>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
<script>

	var price = ${Info[0].winPrice};
	document.getElementById("price0").innerHTML = price.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	price = ${Info[1].winPrice};
	document.getElementById("price1").innerHTML = price.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	price = ${Info[2].winPrice};
	document.getElementById("price2").innerHTML = price.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	price = ${Info[3].winPrice};
	document.getElementById("price3").innerHTML = price.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	price = ${Info[4].winPrice};
	document.getElementById("price4").innerHTML = price.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";

	var num = ${Info[0].winNum};
	document.getElementById("num0").innerHTML = num.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	num = ${Info[1].winNum};
	document.getElementById("num1").innerHTML = num.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	num = ${Info[2].winNum};
	document.getElementById("num2").innerHTML = num.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	num = ${Info[3].winNum};
	document.getElementById("num3").innerHTML = num.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	num = ${Info[4].winNum};
	document.getElementById("num4").innerHTML = num.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	var calculatedValue = ${Info[0].winPrice / Info[0].winNum};
	document.getElementById("result0").innerHTML = calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	calculatedValue = ${Info[1].winPrice / Info[1].winNum};
	document.getElementById("result1").innerHTML = calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	calculatedValue = ${Info[2].winPrice / Info[2].winNum};
	document.getElementById("result2").innerHTML = calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	calculatedValue = ${Info[3].winPrice / Info[3].winNum};
	document.getElementById("result3").innerHTML = calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	calculatedValue = ${Info[4].winPrice / Info[4].winNum};
	document.getElementById("result4").innerHTML = calculatedValue.toFixed().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
	
	const btn1 = document.getElementById('btn1');
	const btn2 = document.getElementById('btn2');
	const btn3 = document.getElementById('btn3');
	const btn4 = document.getElementById('btn4');
	const btn5 = document.getElementById('btn5');
	const btn6 = document.getElementById('btn6');
	const btn7 = document.getElementById('btn7');
	
	const num1 = parseInt(btn1.textContent);
	const num2 = parseInt(btn2.textContent);
	const num3 = parseInt(btn3.textContent);
	const num4 = parseInt(btn4.textContent);
	const num5 = parseInt(btn5.textContent);
	const num6 = parseInt(btn6.textContent);
	const num7 = parseInt(btn7.textContent);
	
	if (num1 >= 1 && num1 <= 10) {
		btn1.classList.add('gold');
		} else if (num1 >= 11 && num1 <= 20) {
		  btn1.classList.add('lightskyblue');
		} else if (num1 >= 21 && num1 <= 30) {
		  btn1.classList.add('lightcoral');
		} else if (num1 >= 31 && num1 <= 40) {
		  btn1.classList.add('lightgray');
		} else if (num1 >= 41 && num1 <= 45) {
		  btn1.classList.add('lightgreen');
	}
	
	if (num2 >= 1 && num2 <= 10) {
		  btn2.classList.add('gold');
		} else if (num2 >= 11 && num2 <= 20) {
		  btn2.classList.add('lightskyblue');
		} else if (num2 >= 21 && num2 <= 30) {
		  btn2.classList.add('lightcoral');
		} else if (num2 >= 31 && num2 <= 40) {
		  btn2.classList.add('lightgray');
		} else if (num2 >= 41 && num2 <= 45) {
		  btn2.classList.add('lightgreen');
	}
	
	if (num3 >= 1 && num3 <= 10) {
		  btn3.classList.add('gold');
		} else if (num3 >= 11 && num3 <= 20) {
		  btn3.classList.add('lightskyblue');
		} else if (num3 >= 21 && num3 <= 30) {
		  btn3.classList.add('lightcoral');
		} else if (num3 >= 31 && num3 <= 40) {
		  btn3.classList.add('lightgray');
		} else if (num3 >= 41 && num3 <= 45) {
		  btn3.classList.add('lightgreen');
	}
	
	if (num4 >= 1 && num4 <= 10) {
		  btn4.classList.add('gold');
		} else if (num4 >= 11 && num4 <= 20) {
		  btn4.classList.add('lightskyblue');
		} else if (num4 >= 21 && num4 <= 30) {
		  btn4.classList.add('lightcoral');
		} else if (num4 >= 31 && num4 <= 40) {
		  btn4.classList.add('lightgray');
		} else if (num4 >= 41 && num4 <= 45) {
		  btn4.classList.add('lightgreen');
	}
	
	if (num5 >= 1 && num5 <= 10) {
		  btn5.classList.add('gold');
		} else if (num5 >= 11 && num5 <= 20) {
		  btn5.classList.add('lightskyblue');
		} else if (num5 >= 21 && num5 <= 30) {
		  btn5.classList.add('lightcoral');
		} else if (num5 >= 31 && num5 <= 40) {
		  btn5.classList.add('lightgray');
		} else if (num5 >= 41 && num5 <= 45) {
		  btn5.classList.add('lightgreen');
	}
	
	if (num6 >= 1 && num6 <= 10) {
		  btn6.classList.add('gold');
		} else if (num6 >= 11 && num6 <= 20) {
		  btn6.classList.add('lightskyblue');
		} else if (num6 >= 21 && num6 <= 30) {
		  btn6.classList.add('lightcoral');
		} else if (num6 >= 31 && num6 <= 40) {
		  btn6.classList.add('lightgray');
		} else if (num6 >= 41 && num6 <= 45) {
		  btn6.classList.add('lightgreen');
	}
	
	if (num7 >= 1 && num7 <= 10) {
		  btn7.classList.add('gold');
		} else if (num7 >= 11 && num7 <= 20) {
		  btn7.classList.add('lightskyblue');
		} else if (num7 >= 21 && num7 <= 30) {
		  btn7.classList.add('lightcoral');
		} else if (num7 >= 31 && num7 <= 40) {
		  btn7.classList.add('lightgray');
		} else if (num7 >= 41 && num7 <= 45) {
		  btn7.classList.add('lightgreen');
	}
	
</script>