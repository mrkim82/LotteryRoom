<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
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
	font-size:30px;
	padding: 0px;
}
.table{
	width:1110px;	
	test-align : center;
}
.pagination a:hover:not(.active) {background-color: #ddd;}
.ccc{
	width:100px;
}
.cccc{
	width:200px;
}
.ccccc{
	width:610px;
}
a{
text-decoration: none;
color : black;
}
</style>
<div >
<c:choose>
<c:when test="${listInfo[0].mbGrade == 'E' }">
<p class="boardname">공지사항</p>
</c:when>
<c:when test="${listInfo[0].mbGrade == 'K' }">
<p class="boardname">언론보도</p>
</c:when>
<c:when test="${listInfo[0].mbGrade == 'J' }">
<p class="boardname">커뮤니티</p>
</c:when>
</c:choose>
	<c:set var="no" value="${(totalcount-(pageInfo.pageNum-1) * 10) + 1 }"></c:set>
	<form>
	<table class="table">
		<thead>
			<tr>
				<th class="ccc">글번호</th>
				<th class="ccc">고유번호</th>	
				<th class="ccccc">제목</th>
				<th class="cccc">작성자</th>
				<th class="ccc">조회수</th>
			</tr>
		</thead>
		<c:forEach var="multi" items="${listInfo }">
			<tr>
				<td>
					<c:out value="${no= no-1 }"></c:out>
				</td>
				
				<td>${multi.mbId }</td>
				<c:choose>
				<c:when test="${(UserGrade == 'A' || UserGrade == 'C')}">
				<td><a href="getMulti.do?mbId=${multi.mbId }&page=${pageInfo.pageNum }">${multi.mbTitle }</a></td>
				</c:when>
				<c:when test="${multi.mbGrade == 'K'}">
				<td><a href="getMulti.do?mbId=${multi.mbId }&page=${pageInfo.pageNum }">${multi.mbTitle }</a></td>
				</c:when>
				<c:otherwise>
				<td><a href="#" onclick="alert('조회권한이 없습니다.');">${multi.mbTitle }</a></td>
				</c:otherwise>
				</c:choose>
				<td>${multi.userName }</td>
				<td>${multi.mbHit }</td>
				</tr>
		</c:forEach>
	</table>
	<table>
	<tr>
		<c:choose>
		<c:when test="${UserGrade == 'A'}">
		<td><button type="button" onclick="location.href='addMulti.do?mbGrade=${listInfo[0].mbGrade}'">글작성</button></td>
		</c:when>
		<c:when test="${UserGrade == 'C' && listInfo[0].mbGrade == 'J'}">
		<td><button type="button" onclick="location.href='addMulti.do?mbGrade=${listInfo[0].mbGrade}'">글작성</button></td>
		</c:when>
		</c:choose>
	</tr>
	</table>
	</form>
	</div>
	<hr>
	<div class="center">
	<div class="pagination">
	<c:if test="${pageInfo.prev }">
		<a href="listMulti.do?page=${pageInfo.startPage-1 }&mbGrade=${listInfo[0].mbGrade}">Previous</a>
	</c:if>
	<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
		<a class="${i == pageInfo.pageNum ? 'active' : '' }" href="listMulti.do?page=${i }&mbGrade=${listInfo[0].mbGrade}">${i } </a>
	</c:forEach>
	<c:if test="${pageInfo.next }">
		<a href="listMulti.do?page=${pageInfo.endPage+1 }&mbGrade=${listInfo[0].mbGrade}">Next</a>
	</c:if>
	</div></div>