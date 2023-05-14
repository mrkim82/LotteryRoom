<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head><style>
.center {
  text-align: center;
}

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 4px;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}
.boardname{
	width:1110px;
	font-weight:bold; 
	font-size:30px;
	padding: 0px;
}
.table{
	width:1110px;	
	test-align : center;
}
.pagination a:hover:not(.active) {background-color: #ddd;}
.ccc{
	width:100px;
}
.cccc{
	width:200px;
}
.ccccc{
	width:610px;
}
a{
text-decoration: none;
color : black;
}
</style>
<meta charset="UTF-8">
<title>충전하기</title>
</head>
<body>
<p>충전하기 공간입니다.</p>
<p>현재 마일리지 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${Mileage }" />원 </p>
<%-- <p>현재 마일리지 : <span id="mileage"><fmt:formatNumber type="number" maxFractionDigits="3" value="${Mileage}" />원</span></p>--%>
	
	<table>
	
		<tr>
		<td><button type="button" onclick="location.href='recharge.jsp'">충전하기</button></td>
		<td><button type="button" onclick=minus()>출금하기</button></td>
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