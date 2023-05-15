
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="border-end bg-white" id="sidebar-wrapper" >

	<div class="list-group list-group-flush" style="display:none;" id=MultiSide>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="listMulti.do?mbGrade=E">공지사항</a>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="listMulti.do?mbGrade=K">언론보도</a>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="listMulti.do?mbGrade=J">커뮤니티</a>
	</div>

	<div class="list-group list-group-flush" style="display:none;" id=CSSide>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="listCS.do?cbGrade=F">FAQ</a>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="listCS.do?cbGrade=C">1:1문의</a>
	</div>
	
	<div class="list-group list-group-flush" style="display:none;" id=LotterySide>

		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="introduce.do">복권소개</a>
		<c:choose>
		<c:when test="${UserId == null }">
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="main.do" onclick="alert('로그인 후 사용가능합니다.');">복권구매</a>
		</c:when>
		<c:otherwise>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="buyLottery.do">복권구매</a>
		</c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${UserId == null }">
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="main.do" onclick="alert('로그인 후 사용가능합니다.');">충전하기</a>
		</c:when>
		<c:otherwise>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="plusMileage.do?userId=${UserId }">충전하기</a>
		</c:otherwise>
		</c:choose>
		
	</div>

	<div class="list-group list-group-flush" style="display:none; width: 160px;" id=StoreSide>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="storelist.do">전국 판매점</a>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="storesearch.do">근처 판매점</a>
	</div>

	<div class="list-group list-group-flush" style="display:none; width: 160px;" id=ResultSide>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="listLotto.do">회차별 당첨내역</a>
		<a class="list-group-item list-group-item-action list-group-item-light p-3" href="liveReward.do">실시간 당첨금</a>
	</div>
	
		<div class="list-group list-group-flush" style="display:none; width: 160px;" id=MypageSide>
      <a class="list-group-item list-group-item-action list-group-item-light p-3" href="mypage.do">내 정보</a>
      <a class="list-group-item list-group-item-action list-group-item-light p-3" href="deletemember.do?userNo=${UserNo}">회원탈퇴</a>
   </div>
	
</div>
<script>
	
	let path;
	if(document.location.href.lastIndexOf('?') > 0){
		path = document.location.href.substring(document.location.href.lastIndexOf('/'),document.location.href.lastIndexOf('?'));
	}else{
		path = document.location.href.substring(document.location.href.lastIndexOf('/'));
	}
	
	if(path=="/listMulti.do" || path=="/getMulti.do" || path=="/addMulti.do" || path=="/updateMulti.do"){
		document.getElementById('MultiSide').style="display:block";
	} else if(path=="/listCS.do" || path=="/getCS.do" || path=="/addCS.do" || path=="/updateCS.do"){
		document.getElementById('CSSide').style="display:block";
	} else if(path=="/introduce.do" || path=="/plusMileage.do" || path=="/buyLottery.do" || path=="/buyAuto.do" || path=="/buyManual.do"){
		document.getElementById('LotterySide').style="diplay:block";
	} else if(path=="/storelist.do" || path=="/storesearch.do"){
		document.getElementById('StoreSide').style="diplay:block";
	} else if(path=="/listLotto.do" || path=="/liveReward.do"){
		document.getElementById('ResultSide').style="diplay:block";
	} else if(path=="/mypage.do" || path=="/deletemember.do"){
		document.getElementById('MypageSide').style="diplay:block";
	}
	
	
</script>