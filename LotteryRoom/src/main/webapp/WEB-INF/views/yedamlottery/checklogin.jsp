<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복권구매 선택 페이지</title>
</head>
<body>
<table>
	<tr>
	<c:choose>
	<c:when test="${Mileage < 1000 }">
	<td><button type="button" onclick="alert('마일리지가 부족합니다.');">자동구매</button></td>
	<td><button type="button" onclick="alert('마일리지가 부족합니다.');">수동구매</button></td>
	</c:when>
	<c:otherwise>
	<td><button type="button" onclick="location.href='buyAuto.do'">자동구매</button></td>
	<td><button type="button" onclick="location.href='buyManual.do'">수동구매</button></td>
	</c:otherwise>
	</c:choose>
	</tr>
</table>
</body>
<script>
</script>
</html>