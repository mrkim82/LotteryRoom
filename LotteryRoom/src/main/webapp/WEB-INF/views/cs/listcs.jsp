<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');
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
.ccca {
	display:none;
}
a{
text-decoration: none;
color : black;
}
</style>
<div >
<c:choose>
<c:when test="${listInfo[0].cbGrade == 'F' }">
<p class="boardname" style="font-family: 'Hahmlet', serif;">FAQ</p>
</c:when>
<c:when test="${listInfo[0].cbGrade == 'C' }">
<p class="boardname" style="font-family: 'Hahmlet', serif;">1:1문의</p>
</c:when>
</c:choose>
	<c:set var="no" value="${(totalcount-(pageInfo.pageNum-1) * 10) + 1 }"></c:set>
	<form>
	<table class="table">
		<thead>
			<tr>
				<th class="ccc">글번호</th>
				<th class="ccca">고유번호</th>	
				<th class="ccccc">제목</th>
				<th class="cccc">작성자</th>
				<th class="ccc">조회수</th>
			</tr>
		</thead>
		<c:forEach var="cs" items="${listInfo }">
			<tr>
				<td>
					<c:out value="${no= no-1 }"></c:out>
					
				</td>
				<td class="ccca">${cs.cbId }</td>
				<c:choose>
				<c:when test="${(cs.cbGrade == 'C') && (UserGrade == 'A' || (UserNo == cs.userNo))}">
				<td><a href="getCS.do?cbId=${cs.cbId }&page=${pageInfo.pageNum }">${cs.cbTitle }</a></td>
				</c:when>
				<c:when test="${cs.cbGrade == 'F'}">
				<td><a href="getCS.do?cbId=${cs.cbId }&page=${pageInfo.pageNum }">${cs.cbTitle }</a></td>
				</c:when>
				<c:otherwise>
				<td><a href="#" onclick="alert('조회권한이 없습니다.');">${cs.cbTitle }</a></td>
				</c:otherwise>
				</c:choose>
				<td>${cs.userName }</td>
				<td>${cs.cbHit }</td>
				</tr>
		</c:forEach>
	</table>
	<table>
	<tr>
		<c:choose>
		<c:when test="${UserGrade == 'A'}">
		<td><button type="button" onclick="location.href='addCS.do?cbGrade=${listInfo[0].cbGrade}'">글작성</button></td>
		</c:when>
		<c:when test="${UserGrade == 'C' && listInfo[0].cbGrade == 'C'}">
		<td><button type="button" onclick="location.href='addCS.do?cbGrade=${listInfo[0].cbGrade}'">글작성</button></td>
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
		<a href="listCS.do?page=${pageInfo.startPage-1 }&cbGrade=${listInfo[0].cbGrade}">Previous</a>
	</c:if>
	<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
		<a class="${i == pageInfo.pageNum ? 'active' : '' }" href="listCS.do?page=${i }&cbGrade=${listInfo[0].cbGrade}">${i } </a>
	</c:forEach>
	<c:if test="${pageInfo.next }">
		<a href="listCS.do?page=${pageInfo.endPage+1 }&cbGrade=${listInfo[0].cbGrade}">Next</a>
	</c:if>
	</div></div>