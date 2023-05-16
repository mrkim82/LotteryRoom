<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.mi{
display: none;
}
#buttonTable {
  text-align: center;
}
.usno{
display: none;
}
body {
  font-family: Arial, sans-serif;
}

table {
  width: 100%;
  margin-bottom: 20px;
  border-collapse: collapse;
}

th {
  background-color: #f5f5f5;
  padding: 10px;
  text-align: left;
}

td {
  padding: 10px;
  border-bottom: 1px solid #eee;
}

input[type="text"], textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  margin: 10px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #45a049;
}
input[type="text"], textarea {
  width: 650px;  /* 원하는 너비로 변경하세요. 예: 150%, 200px 등 */
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  box-sizing: border-box;
}
.buttonMove1{
	position:relative;
	left:300px;
}
.buttonMove2{
	position:relative;
	left:30px;
}
</style>
<!DOCTYPE html>
<form action="updateCS.do" method="post" enctype="multipart/form-data">

	<table >
	<tr>
		<th>제목</th> <td><input type="text" name="cbTitle" value="${VOInfo.cbTitle }"></td>
	</tr>
    <tr>
		<th>작성자</th> <td><input type="text" name="userName"  readonly value="${UserName }"></td>
	</tr>
	<tr class = "mi">
		<th>고유번호</th> <td><input type="text" name="cbId"  readonly value="${VOInfo.cbId }"></td>
	</tr>
	<tr class = "mi">
		<th>게시판 구분</th> <td><input type="text" name="cbGrade"  readonly value="${VOInfo.cbGrade }"></td>
	</tr>
	<tr>
		<th>내용</th> <td><textarea rows="10" cols="30" name="cbSubject"> ${VOInfo.cbSubject }</textarea></td>
	</tr>
	<c:choose>
	<c:when test="${VOInfo.cbGrade == 'C'}">
	<tr>
		<th>첨부이미지</th> <td><input multiple="multiple" type="file" name="cbAttach"  value="${VOInfo.cbAttach }"></td>
	</tr>
	</c:when>
	</c:choose>
	</table>
	<hr>
	<table>
		<tr>
		<td><button class="buttonMove1" type="submit">저장</button></td>
		<td><button class="buttonMove2" type="button" 
		onclick="location.href='listCS.do?cbGrade=${VOInfo.cbGrade}'">취소</button></td>
		</tr>
	</table>

</form>
