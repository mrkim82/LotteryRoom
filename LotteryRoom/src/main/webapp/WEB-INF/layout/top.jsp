<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Hahmlet&display=swap');
</style>
<div>
    <header class="blog-header lh-1 py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
            
    		<img src="./images/현용이형.png" title="현용" style="width: 50px;">
    		<img src="./images/희영이누나.png" title="희영" style="width: 50px;">
    		<img src="./images/욱환.png"  title="욱환" style="width: 50px;">
    		<img src="./images/성현이.png" title="성현" style="width: 50px;">
			</div>
            
            <div class="col-4 text-center">
                <a class="blog-header-logo text-body-emphasis" href="main.do">LotteryRoom</a>
            </div>
            <div class="col-6 d-flex justify-content-end align-items-center" style="margin-left: -200px; font-family: 'Hahmlet', serif;">
                <c:choose>
                    <c:when test="${UserId == null }">
                        <a class="aaa" style="font-family: 'Hahmlet', serif;">반갑습니다 방문자님</a>
                    </c:when>
                    <c:otherwise>
                        <a class="aaa" style="font-family: 'Hahmlet', serif;">${UserName }님 반갑습니다</a>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${UserId == null }">
                        <a class="aaa" href="login.do" style="font-family: 'Hahmlet', serif;">로그인</a>
                        <a class="aaa" href="listCS.do?cbGrade=F" style="font-family: 'Hahmlet', serif;">고객센터</a>
                    </c:when>
                    <c:otherwise>
                        <a class="aaa" href="logout.do" style="font-family: 'Hahmlet', serif;">로그아웃</a>
                        <a class="aaa" href="mypage.do" style="font-family: 'Hahmlet', serif;">마이페이지</a>
                        <a class="aaa" href="listCS.do?cbGrade=F" style="font-family: 'Hahmlet', serif;">고객센터</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </header>
</div>

	<div class="nav-scroller py-1 mb-2"
		style="border-bottom: 1px solid #e5e5e5">
		<nav class="nav d-flex justify-content-between" style=" font-size: 20px; text-align: center; font-weight: 100px;">
			<a class="p-2 link-secondary" href="introduce.do" style="color: white; font-family: 'Black Han Sans', sans-serif;">예담복권</a> <a
				class="p-2 link-secondary" href="listLotto.do" style="color: white; font-family: 'Black Han Sans', sans-serif;">당첨내역</a> <a
				class="p-2 link-secondary" href="storelist.do" style="color: white; font-family: 'Black Han Sans', sans-serif;">판매점</a> <a
				class="p-2 link-secondary" href="listMulti.do?mbGrade=E" style="color: white; font-family: 'Black Han Sans', sans-serif;">게시판</a>
		</nav>
	</div>
</div>