<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Hahmlet&display=swap');

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
	font-size:20px;
	padding: 0px;
	font-family: 'Hahmlet', serif;
}

table, th, td{
	border: 1px solid #444444;
	border-collapse: collapse;
}

thead{
	border-left: none;
}

.table{
	width:100%;	
	height : 70%;
	test-align : center;
	boarer-top: 1px solid #948e8e;
}
.pagination a:hover:not(.active) {background-color: #ddd;}
.ccc{
	width:10%;
	text-align: center;
	border-bottom: 1px solid lightgray;
	border-left: 1px solid lightgray;
	border-right: 1px solid lightgray;
}
.cccc{
	width:15%;
	text-align: center;
	border-bottom: 1px solid lightgray;
	border-left: 1px solid lightgray;
	border-right: 1px solid lightgray;
}
.ccccc{
	width:40%;
	border-bottom: 1px solid lightgray;
	border-left: 1px solid lightgray;
	border-right: 1px solid lightgray;
}
a{
text-decoration: none;
color : black;
}
</style>
<div>
<c:choose>
<c:when test="${listInfo[0].mbGrade == 'E' }">
<a class="boardname" href="mainBoard.do?mbGrade=E">공지사항</a><a> | </a><a class="boardname" href="mainBoard.do?mbGrade=K">언론보도</a><a> | </a><a class="boardname" href="mainBoard.do?mbGrade=J">커뮤니티</a>
</c:when>
<c:when test="${listInfo[0].mbGrade == 'K' }">
<a class="boardname" href="mainBoard.do?mbGrade=E">공지사항</a><a> | </a><a class="boardname" href="mainBoard.do?mbGrade=K">언론보도</a><a> | </a><a class="boardname" href="mainBoard.do?mbGrade=J">커뮤니티</a>
</c:when>
<c:when test="${listInfo[0].mbGrade == 'J' }">
<a class="boardname" href="mainBoard.do?mbGrade=E">공지사항</a><a> | </a><a class="boardname" href="mainBoard.do?mbGrade=K">언론보도</a><a> | </a><a class="boardname" href="mainBoard.do?mbGrade=J">커뮤니티</a>
</c:when>
</c:choose>
	<c:set var="no" value="${(totalcount-(pageInfo.pageNum-1) * 10) + 1 }"></c:set>
	<form style="padding-top: 10px;">
	<table class="table">
		<thead>
			<tr>
				<th class="ccc" style="border-right: 1px solid lightgray;">글번호</th>
				<th class="cccc" style="display:none;">고유번호</th>	
				<th class="ccccc" style="border-right: 1px solid lightgray;">제목</th>
				<th class="cccc" style="border-right: 1px solid lightgray;">작성자</th>
				<th class="ccc" style="display:none;">조회수</th>
			</tr>
		</thead>
		<c:forEach var="multi" items="${listInfo }">
			<tr>
				<td class="ccc">
					<c:out value="${no= no-1 }"></c:out>
				</td>
				
				<td class="ccc" style="display:none;">${multi.mbId }</td>
				<c:choose>
				<c:when test="${(UserGrade == 'A' || UserGrade == 'C')}">
				<td class="ccc"><a href="getMulti.do?mbId=${multi.mbId }&page=${pageInfo.pageNum }" target="_top">${multi.mbTitle }</a></td>
				</c:when>
				<c:when test="${multi.mbGrade == 'K'}">
				<td class="ccc"><a href="getMulti.do?mbId=${multi.mbId }&page=${pageInfo.pageNum }" target="_top">${multi.mbTitle }</a></td>
				</c:when>
				<c:otherwise>
				<td class="ccc"><a href="#" onclick="alert('조회권한이 없습니다.');">${multi.mbTitle }</a></td>
				</c:otherwise>
				</c:choose>
				<td class="cccc">${multi.userName }</td>
				<td style="display:none;">${multi.mbHit }</td>
				</tr>
		</c:forEach>
	</table>
	</form>
	</div>
	<hr>
	<div class="center">
	<div class="pagination">
	<c:if test="${pageInfo.prev }">
		<a href="listMulti.do?page=${pageInfo.startPage-1 }&mbGrade=${listInfo[0].mbGrade}"  target="_top">Previous</a>
	</c:if>
	<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
		<a class="${i == pageInfo.pageNum ? 'active' : '' }" href="listMulti.do?page=${i }&mbGrade=${listInfo[0].mbGrade}"  target="_top">${i } </a>
	</c:forEach>
	<c:if test="${pageInfo.next }">
		<a href="listMulti.do?page=${pageInfo.endPage+1 }&mbGrade=${listInfo[0].mbGrade}"  target="_top">Next</a>
	</c:if>
	</div></div>