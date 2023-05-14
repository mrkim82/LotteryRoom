<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<style>
	</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form action="deletemember.do" method="POST" novalidate>
  <p>정말로 회원 탈퇴하시겠습니까?</p>
  	<p>현재 ${VOInfo.mileage } 마일리지를 보유하고 계십니다</p>
  	<c:choose>
  		<c:when test="${VOInfo.mileage == null || VOInfo.mileage == 0 }">
	  		<button type="submit">회원 탈퇴</button>
  		</c:when>
  		<c:otherwise>
  			<button type="button" onclick="alert('보유 마일리지가 존재합니다.');">회원 탈퇴</button>
  		</c:otherwise>
  	</c:choose>  
  </form>
	
</body>
</html>