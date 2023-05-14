<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
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
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ===========================  내 정보 =========================== -->
	<div style="width:1000px;position:relative">
	<form action="updatemember.do" method="get" novalidate>
	<div>
	<div style="border:1px solid black; padding:20px; width:320px;">
		<table class="mypage" style="width:240px;">	
	  <tr style="border-bottom: 3px solid blue;">
	  
	    <td style="padding: 10px; color: blue; font-weight: bold;">
		  <span style="display: inline-block; text-align:center; white-space: nowrap;">
		    <img src="./images/사용자이미지.jpg" style="width: 50px; height: 50px;">
		    ${UserName}님
		  </span>
		</td>
	    
	    <td style="display: none;"><input name="userNo" value="${UserNo}"></td>
	  </tr>  	
	  <tr style="border-bottom: 1px solid #e9e9e9; padding: 10px;">
	    <td style="border-bottom: 1px solid #e9e9e9; padding: 10px;">아이디</td>
	    <td style="border-bottom: 1px solid #e9e9e9; padding: 10px;">${UserId}</td>
	  </tr>
	  
	  <tr class="tr">
	    <td style="border-bottom: 1px solid #e9e9e9; padding: 10px;">연락처</td>
	    <td style="border-bottom: 1px solid #e9e9e9;padding: 10px;">${Phone}</td>
	  </tr>
	  
	    <tr class="tr">
	    <td style="border-bottom: 1px solid #e9e9e9; padding: 10px;">주소</td>
	    <td style="border-bottom: 1px solid #e9e9e9; padding: 10px;">${Address}</td>
	  </tr>
	  
	   <tr class="tr">
	    <td style="border-bottom: 1px solid #e9e9e9; padding: 10px;">회원등급</td>
	      <c:choose>
	        <c:when test="${UserGrade == 'C'}">
	          <td style="border-bottom: 1px solid #e9e9e9; padding: 10px;">일반회원</td>
	        </c:when>
	        <c:when test="${UserGrade == 'A'}">
	          <td style="border-bottom: 1px solid #e9e9e9; padding: 10px;">관리자</td>
	        </c:when>
	      </c:choose>
	  </tr>
	<tr><td><button type="submit" style="position: relative; top:10px; left: 88px;" class="btn btn-primary" style="width: 10%;">정보수정</button></td></tr>
	</table>
	</div>
	</div>


<!-- ===========================  마일리지 현황 =========================== -->
	<div id="div" style="width:500px; position:absolute; right:10px; top:0px; padding:0px; border: 1px solid black; padding: 30px; width:400px;">
  <table class="mypage" style="border-collapse: collapse;">
    <tr style="width: 200px">
      <td style="display: none;">이름</td>
      <td style="display: none;">${UserName} 님</td>
      <td style="display: none;"><input name="userNo" value="${UserNo}"></td>
    </tr>
    
	    <tr>
    	    <td><span style="display: inline-block; text-align:center; white-space: nowrap;">
		    <img src="./images/돈.jpg" style="width: 50px; height: 50px;">회원님의 마일리지 현황입니다.</span></td>
		</tr>
		
	<tr class="tr" style="background-color: #DAE3F3; top:10px;">
	    <td style="border-bottom: 1px solid #e9e9e9; padding: 10px;">총 마일리지</td>
	    <td style="border-bottom: 1px solid #e9e9e9; padding: 10px; color:red; font-weight: bold; ">${Mileage}</td>
	  </tr>
    
    <tr>
    <td><button type="button" style="position: relative; left: 10px;" class="btn btn-primary" onclick="location.href='recharge.jsp'">충전하기</button></td>
    <td><button type="button" style="position: relative; left: 0px;" class="btn btn-primary" onclick="minus()">출금하기</button></td>
    </tr>
    
  </table>
</div>
 </form>
</div>
 
 <!-- ===========================  구매정보 =========================== -->
<div>
	<c:set var="no" value="${(totalcount-(pageInfo.pageNum-1) * 10) + 1 }"></c:set>
	<form>
	
	<table class="table">
		<thead>
			<tr>
				<th class="ccc">순번</th>
				<th class="ccc">구입일자</th>
				<th class="ccc">회차</th>
				<th class="ccc">복권번호</th>
				<th class="ccc">당첨결과</th>
				<th class="ccc">당첨금액</th>
			</tr>
		</thead>
<c:forEach var="lottery" items="${listInfo}" varStatus="status">
  <tr>
    <td>
      <c:out value="${no = no - 1}"></c:out>
    </td>
    <td>${lottery.ltDate}</td>
    <td>${lottery.ltTimes}</td>
    <td>${lottery.ltFir} ${lottery.ltSec} ${lottery.ltThr} ${lottery.ltFour} ${lottery.ltFive} ${lottery.ltSix}</td>
    <c:set var="isWinning" value="false"></c:set> <!-- 기본적으로 당첨되지 않았다고 가정합니다. -->
    <c:if test="${isWinning == false}">
      <c:forEach var="firItem" items="${fir}">
        <c:if test="${lottery.ltTimes == firItem.ltTimes}">
          <c:set var="isWinning" value="true"></c:set> <!-- 당첨되었음을 표시합니다. -->
          <c:set var="status" value="break"></c:set> <!-- 반복문을 중단하기 위해 status 값을 변경합니다. -->
        </c:if>
      </c:forEach>
    </c:if>
    <c:choose>
      <c:when test="${isWinning}">
        <td>당첨</td>
        <td><button type="button" onclick="location.href='listLotto.do?selectRound=${lottery.ltTimes}'">당첨금액확인</button></td>
      </c:when>
      <c:otherwise>
        <td>미당첨</td>
        <td>X</td>
      </c:otherwise>
    </c:choose>
  </tr>
</c:forEach>
	</table>
	<table>
	<tr>
	</tr>
	</table>
	</form>
	</div>
	<hr>
 	<div class="center">
	<div class="pagination">
	<c:if test="${pageInfo.prev }">
		<a href="mypage.do?page=${pageInfo.startPage-1 }">Previous</a>
	</c:if>
	<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
		<a class="${i == pageInfo.pageNum ? 'active' : '' }" href="mypage.do?page=${i }">${i } </a>
	</c:forEach>
	<c:if test="${pageInfo.next }">
		<a href="mypage.do?page=${pageInfo.endPage+1 }">Next</a>
	</c:if>
	</div></div> 
	
	
	
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