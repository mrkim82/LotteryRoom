<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.usno{
display: none;
}
</style>
<!DOCTYPE html>
<form action="addMulti.do" method="post" enctype="multipart/form-data">
	<table >
	<tr>
		<th>제목</th> <td><input type="text" name="mbTitle"></td>
	</tr>
    <tr>
		<th>작성자</th> <td><input type="text" name="userName"  readonly value="${UserName }"></td>
	</tr>
	<tr class = "usno">
		<th>작성자번호</th> <td><input type="text" name="userNo"  readonly value="${UserNo }"></td>
	</tr>
	<tr class = "usno">
		<th>게시판 구분</th> <td><input type="text" name="mbGrade"  readonly value="${VOInfo.mbGrade }"></td>
	</tr>
	<tr>
		<th>내용</th> <td><textarea rows="10" cols="30" name="mbSubject"></textarea></td>
	</tr>
	<c:choose>
		<c:when test="${VOInfo.mbGrade == 'K'}">
	<tr>
		<th>첨부이미지</th> <td><input multiple="multiple" type="file" name="mbAttach"></td>
	</tr>
	</c:when>
	</c:choose>
	</table>
	<hr>
	<table>
		<tr>
		<td><button type="submit">저장</button></td>
		<td><button type="button" 
		onclick="location.href='listMulti.do?mbGrade=${VOInfo.mbGrade}'">취소</button></td>
		</tr>
	</table>

</form>
