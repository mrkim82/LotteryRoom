<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이쿠조 복권방 회원가입</title>
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
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" action="membership.do" method="post" novalidate>
					<c:choose>
					<c:when test="${VOInfo.userId != null}">
					<div class="mb-3">
						<label for="email">아이디(이메일)</label> <input type="email" name="userId"
							class="form-control" id="email" value="${VOInfo.userId }" readonly>
					</div>
					</c:when>
					<c:otherwise>
					<div class="mb-3">
					<c:choose>
					<c:when test="${Idfeed.userId == null }">
						<label for="email">아이디(이메일)</label> <input type="email" name="userId"
							class="form-control" id="emailid" placeholder="you@example.com"
							required>
							  <button style="width: 80px; margin-top:5px;" class="btn btn-primary btn-sm btn-block" type="button" onclick="redirectToFeed()">중복확인</button>
					        <script>
					            function redirectToFeed() {
					                var inputElement = document.getElementById("emailid");
					                var inputUserId = inputElement.value;
					
					                if (inputUserId.trim() !== '') {
					                    var encodedUserId = encodeURIComponent(inputUserId);
					                    var url = 'feed.do?userId=' + encodedUserId;
					                    window.location.href = url;
					                }
					            }
					        </script>
							</c:when>
							<c:otherwise>
							<label for="email">아이디(이메일)</label> <input type="email" name="userId"
							class="form-control" id="emailid" placeholder="you@example.com"
							value="${Idfeed.userId}" required>
							<button style="width: 80px;" class="btn btn-primary btn-sm btn-block"  type="button" onclick="redirectToFeed()">중복확인</button>
							<script>
				            function redirectToFeed() {
				                var inputElement = document.getElementById("emailid");
				                var inputUserId = inputElement.value;
				
				                if (inputUserId.trim() !== '') {
				                    var encodedUserId = encodeURIComponent(inputUserId);
				                    var url = 'feed.do?userId=' + encodedUserId;
				                    window.location.href = url;
				                }
				            }
				            var idFeed = '${Idfeed.userId}'; // Idfeed 속성에서 userId 값을 가져옴
				            
				            if (idFeed == '') {
				                alert('이미 사용 중인 아이디입니다.');
				            } else{
				            	alert('사용 가능한 아이디입니다.');
				            }
				            
				      		</script>
							</c:otherwise>
							</c:choose>
					</div>
					</c:otherwise>
					</c:choose>
					<div class="mb-3">
						<label for="email">비밀번호</label> <input type="password" minlength="8" maxlength="12"
							class="form-control" id="password" name="userPw" placeholder="비밀번호 8-15자리 입력"
							required>
						<div class="invalid-feedback" >비밀번호 8-15자리 입력해주세요.</div>
					</div>
					<div class="mb-3" style="width:320px;">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="name" name="userName" placeholder="" value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="mb-3" style="width:320px;">
							<label for="phone">휴대전화</label> <input type="text" minlength="13" maxlength="13"
								class="form-control" id="phone" name="phone" placeholder="010-0000-0000" value="" required>
							<div class="invalid-feedback">휴대전화를 입력해주세요.</div>
						</div>
					<div class="mb-3" style="margin-top: -20px;">
						<label class="form-label mt-4">생년월일</label>
						<div class="bir_inline">
							<span class="ps_box"> <input style="width:200px; margin-right:20px;" type="number"
								class="form-control" id="yy" name="birthYear" placeholder="년(4자)" max="2004" maxlength="4">
							</span> <span class="ps_box"> <input style="width:160px; margin-right:20px;" type="number"
								class="form-control" id="mm" name="birthMonth" placeholder="월" max="12" maxlength="2">
							</span> <span class="ps_box"> <input style="width:160px; margin-right:20px;" type="number"
								class="form-control" id="dd" name="birthDay" placeholder="일" max="31" maxlength="2">
							</span>
						</div>
					</div>
					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" id="address" name="address1" placeholder="서울특별시 강남구"
							required>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="address2">상세주소<span class="text-muted">&nbsp;(필수아님)</span></label> <input type="text" class="form-control" id="address2"  name="address2"
							placeholder="상세주소를 입력해주세요.">
					</div>
					
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						완료</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2021 YD</p>
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
  </script>
</body>
</html>