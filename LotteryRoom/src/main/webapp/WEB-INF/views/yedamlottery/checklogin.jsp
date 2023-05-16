<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
img{
 color: transparent;
 text-shadow: 0 0 0 black;
}
table{
 color: transparent;
 text-shadow: 0 0 0 black;
}

.btn-3d {
  position: relative;
  display: inline-block;
  font-size: 22px;
  padding: 20px 60px;
  color: white;
  margin: 20px 10px 10px;
  border-radius: 6px;
  text-align: center;
  transition: top .01s linear;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
.btn-3d.blue:hover   {background-color: #699DD1;}


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
</style>
<meta charset="UTF-8">
<title>복권구매 선택 페이지</title>
</head>
<body>
<h4><strong style="font-family: 'Hahmlet', serif;">복권구매</strong></h4>
<hr>
<img src="./images/공모양.png" alt="여기에 뭐 적어야함?" style="width:800px; height:400px; margin-left:100px;">
<table>
	<tr>
	<c:choose>
	<c:when test="${Mileage < 1000 }">
	<td><button type="button" style="margin-left:250px; margin-top:100px;" class="btn-3d blue" onclick="alert('마일리지가 부족합니다.');">자동구매</button></td>
	<td><button type="button" style="margin-left:50px; margin-top:100px;" class="btn-3d blue" onclick="alert('마일리지가 부족합니다.');">수동구매</button></td>
	</c:when>
	<c:otherwise>
	<td><button type="button" style="margin-left:250px; margin-top:100px;" class="btn-3d blue" onclick="location.href='buyAuto.do'">자동구매</button></td>
	<td><button type="button" style="margin-left:50px; margin-top:100px;" class="btn-3d blue" onclick="location.href='buyManual.do'">수동구매</button></td>
	</c:otherwise>
	</c:choose>
	</tr>
</table>
</body>
<script>
</script>
</html>