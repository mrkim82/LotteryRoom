<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Membership Withdrawal</title>
<style>
body {
  font-family: Arial, sans-serif;
}

@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');

h1 {
  font-size: 24px;
  margin-bottom: 20px;
}

p {
  margin-bottom: 10px;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-left: 83px;
}

.div{
	border: 3px solid black;
	height: 530px;
	width: 400px;
	margin-left: 280px;
	margin-top : 50px;
}

button:hover {
  background-color: #45a049;
}
</style>
</head>
<body>
  <form action="deletemember.do" method="POST" novalidate>
    <div class="div">
      <h1 style="margin-left:30px; margin-top: 20px; font-family: 'Hahmlet', serif;">정말 회원 탈퇴를 하시겠습니까?</h1>
      <img src="./images/유병재.jpg" width="300px" height="300px" style="margin-left:45px;">
      <p style="margin-left:35px; margin-top:30px; font-family: 'Hahmlet', serif;">**마일리지 보유중이시면 탈퇴가 불가합니다**</p>
      <p style="margin-left:30px; font-family: 'Hahmlet', serif;">**현재 보유 마일리지는 ${VOInfo.mileage} 마일리지 입니다**</p>
      
      <c:choose>
        <c:when test="${VOInfo.mileage == null || VOInfo.mileage == 0}">
          <button type="submit">탈퇴</button>
        </c:when>
        <c:otherwise>
          <button type="button" onclick="alert('마일리지 보유중입니다.');" >탈퇴</button>
        </c:otherwise>
      </c:choose>
      
      <button class="cancel-btn" type="button" onclick="alert('회원 탈퇴를 취소했습니다.');">취소</button>
    </div>  
  </form>
</body>
</html>