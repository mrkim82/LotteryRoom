<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보 수정</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
.bir_inline {
	display: flex;
	flex-direction: row;
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원정보 수정</h4>
				<form class="validation-form" action="updatemember.do" method="post" novalidate>
						<div class="mb-3" style="width:320px;">
							<label for="phone">새로운 전화번호를 입력해주세요</label> <input type="text" minlength="13" maxlength="13" class="form-control" id="phone" name="phone" placeholder="010-0000-0000" value="${VOInfo.phone }" required>
							<div class="invalid-feedback">휴대전화를 입력해주세요.</div>
						</div>
					<div class="mb-3">
						  <label for="password">변경 할 비밀번호 8-15자리 입력해주세요</label>
						  <input type="password" minlength="8" maxlength="15" class="form-control" id="password" name="userPw" placeholder="새로운 비밀번호 8-15자리 입력해주세요" required>
						  <div class="invalid-feedback">새로운 비밀번호 8-15자리 입력해주세요.</div>
						</div>
						
						<div class="mb-3">
						    <label for="passwordConfirm">비밀번호 확인</label>
						    <input type="password" minlength="8" maxlength="15" class="form-control" id="passwordConfirm" name="userPw2" placeholder="비밀번호 확인" required oninput="checkPasswordMatch()">
						    <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
						</div>
					
					<div class="mb-3">
						<label for="address">변경 할 주소를 입력해주세요</label> <input type="text"
							class="form-control" id="address" name="address" placeholder="상주시 신봉동 청구아파트 101동 1502호" value="${VOInfo.address }" required >
						<div class="invalid-feedback">변경 할 주소를 입력해주세요.</div>
					</div>
					
					<hr class="mb-4">
					<div class="mb-4"></div>
					<button class="btn btn-primary" type="submit" style="width: 49%;">완료</button>
  					<button class="btn btn-primary" style="width: 49%;" onclick="location.href='mypage.do'">취소</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
		</footer>
	</div>
	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');
      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
    function checkPasswordMatch() {
        var password = document.getElementById("password").value;
        var passwordConfirm = document.getElementById("passwordConfirm").value;

        if (password !== passwordConfirm) {
          document.getElementById("passwordConfirm").setCustomValidity("변경하실 비밀번호가 일치하지 않습니다.");
        } else {
          document.getElementById("passwordConfirm").setCustomValidity("");
        }
      }
  </script>
</body>
</html>