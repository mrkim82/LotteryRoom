<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<header class="blog-header lh-1 py-3">
		<div
			class="row flex-nowrap justify-content-between align-items-center">
			<div class="col-4 pt-1"></div>
			<div class="col-4 text-center">
				<a class="blog-header-logo text-body-emphasis" href="main.do" style="font-size: 40px;">Lottery
					Room</a>
			</div>
			<div class="col-4 d-flex justify-content-end align-items-center">
				<c:choose>
					<c:when test="${UserId == null }">
						<a class="aaa">반갑습니다 방문자님</a>
					</c:when>
					<c:otherwise>
						<a class="aaa">${UserName }님 반갑습니다 </a>
					</c:otherwise>
					
				</c:choose>
				<c:choose>
					<c:when test="${UserId == null }">
						<a class="aaa" href="login.do">로그인</a> <a class="aaa" href="listCS.do?cbGrade=F">고객센터</a>
					</c:when>
					<c:otherwise>
						<a class="aaa" href="logout.do">로그아웃</a> <a class="aaa" href="mypage.do">마이페이지</a> <a class="aaa" href="listCS.do?cbGrade=F">고객센터</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>

	<div class="nav-scroller py-1 mb-2"
		style="border-bottom: 1px solid #e5e5e5;">
		<nav class="nav d-flex justify-content-between"">
			<a class="p-2 link-secondary" href="introduce.do" style="color: white;">예담복권</a> <a
				class="p-2 link-secondary" href="listLotto.do" style="color: white;">당첨내역</a> <a
				class="p-2 link-secondary" href="storelist.do" style="color: white;">판매점</a> <a
				class="p-2 link-secondary" href="listMulti.do?mbGrade=E" style="color: white;">게시판</a>
		</nav>
	</div>
</div>