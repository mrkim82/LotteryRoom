<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.mi{
display: none;
}
</style>
<form action="updateCS.do" method="get">
	<table >
	<tr>
		<th>제목</th> <td><input type="text" readonly value="${VOInfo.cbTitle}"></td>
	</tr>
	<tr>
		<th>작성일</th> <td><input type="text" readonly value="${cbDate}"></td>
    </tr>
    <tr>
   		<th>작성자</th> <td><input type="text" readonly value="${VOInfo.userName }"></td>
	</tr>
	<tr class = "mi">
		<th>고유번호</th> <td><input type="text" name="cbId"  readonly value="${VOInfo.cbId }"></td>
	</tr>
	<c:choose>
	<c:when test="${VOInfo.cbGrade == 'C'}">
		<tr style="display: block;">
				<th>첨부파일: ${fileType }</th>
				<td>
				<c:if test="${VOInfo.cbAttach != null }">
				<c:choose>
					<c:when test="${fileType == 'image'}">
						<img width="200px" height="200px" src="images/${VOInfo.cbAttach }">
					</c:when>
					<c:otherwise>
						<a href="images/${VOInfo.cbAttach}">${VOInfo.cbAttach}</a>
					</c:otherwise>
				</c:choose>
				</c:if>
				</td>
			</tr>
	</c:when>
	</c:choose>
	<tr>
	<th>내용</th> <td><textarea rows="10" cols="30"  readonly>${VOInfo.cbSubject }</textarea></td>
	</tr>
	</table>
	<hr>
	<table>
		<tr>
		<c:choose>
		<c:when test="${UserGrade == 'A'}">
		<td><button type="submit">수정</button></td>
		<td><button type="button" 
		onclick="location.href='removeCS.do?cbId=${VOInfo.cbId}&cbGrade=${VOInfo.cbGrade}'">삭제</button></td>
		</c:when>
		<c:when test="${(UserGrade == 'C' && VOInfo.cbGrade == 'C') && (UserNo == VOInfo.userNo)}">
		<td><button type="submit">수정</button></td>
		<td><button type="button" 
		onclick="location.href='removeCS.do?cbId=${VOInfo.cbId}&cbGrade=${VOInfo.cbGrade}'">삭제</button></td>
		</c:when>
		</c:choose>
		<!-- 전체 리스트페이지 이동 시 페이징 한 값이 필요 -->
		<td><button type="button" 
		onclick="location.href='listCS.do?cbGrade=${VOInfo.cbGrade}&page=${pageNum}'">목록</button></td>
		</tr>
	</table>

</form>
<c:choose>
<c:when test="${VOInfo.cbGrade == 'C'}">

<!-- 댓글정보. -->
<table class="table">
	<thead>
		<tr>
			<th>댓글번호</th>
			<th>글내용</th>
			<th>작성자</th>
			<th>댓글삭제</th>
		</tr>
	</thead>
	<tbody id="tlist">
	</tbody>
</table>

<table style="display: none;">
	<tbody>
		<tr class="template">
			<td></td>
			<td><input type="text" class="reply"></td>
			<td>${UserName }</td>
			<td><button>수정</button>
		</tr>
	</tbody>
</table>


<!-- 댓글등록. -->
<div id="content">
	<input type="text" id="reply"> <span>${UserNo }</span>
	<button type="button" id="addBtn">댓글등록</button>
</div>

</c:when>
</c:choose>
<script>
	let showFields = ['replyId', 'replySubject', 'userName']
	let xhtp = new XMLHttpRequest(); //Ajax 호출.
	xhtp.open('get', 'listReply.do?cbId=${VOInfo.cbId}');
	xhtp.send();
	xhtp.onload = function () {
		//console.log(xhtp.response);
		let tlist = document.querySelector('#tlist');
		//목록생성.
		let data = JSON.parse(xhtp.response);
		for (let reply of data) {
			let tr = makeTrFunc(reply);
			tlist.append(tr);
		}
	}

	// tr 생성해주는 함수.
	function makeTrFunc(reply = {}) {
		let tr = document.createElement('tr');
		tr.id = reply.replyId; // tr 속성추가: 댓글번호

		// td 생성.
		for (let prop of showFields) {
			let td = document.createElement('td');
			td.innerText = reply[prop];
			tr.append(td);
		}
		
		// tr 클릭이벤트(수정).
		tr.addEventListener('dblclick', function (e) {
			let userName = this.children[2].innerText;
			
			if(userName != '${UserName }' && '${UserName}' != '관리자') {
				alert('권한이 없습니다.');
				return;
			}
			
			// 수정중인 댓글이 있을 경우 수정 불가
			for(let i of document.querySelector('#tlist').children){
				if(i.className == 'template'){
					alert('수정 진행 중인 건이 있습니다.');
					return;
				}
			}
			let template = document.querySelector('.template').cloneNode(true);
			template.children[0].innerText = reply.replyId;
			template.children[1].children[0].value = reply.replySubject;
			template.children[2].innerText = reply.userName;
			template.querySelector('button').addEventListener('click', function (e) {
				// Ajax 호출.
				let replyId = reply.replyId;
				let replyUpdateSubject = this.parentElement.parentElement.children[1].children[0].value;
				
				let xhtp = new XMLHttpRequest();
				xhtp.open('post', 'updateReply.do');
				xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xhtp.send('replyId='+replyId+'&replySubject='+replyUpdateSubject);
				xhtp.onload = function() {
					let result = JSON.parse(xhtp.response);
					if (result.retCode == 'Success') {
						// 화면변경.
						alert('성공.');
						console.log(result.data);
						let newTr = makeTrFunc(result.data);
						oldTr = document.querySelector('.template');
						document.getElementById('tlist').replaceChild(newTr, oldTr);
					} else if (result.retCode == 'Fail') {
						alert('처리중 에러.');
					} else {
						alert('알수 없는 반환값.');
					}
				}
			});
			// 화면전환.
			document.getElementById('tlist').replaceChild(template, tr);
		})
		
		//삭제버튼.
		let btn = document.createElement('button');
		btn.addEventListener('click', function (e) {
			let userName = btn.parentElement.previousElementSibling.innerText;

			if (userName != '${UserName}' && '${UserName}' != '관리자') {
				alert('권한이 없습니다.');
				return;
			}
			let replyId = btn.parentElement.parentElement.id;
			// db에서 삭제 후... 화면에서 삭제.
			let xhtp = new XMLHttpRequest();
			xhtp.open('post', 'removeReply.do');
			xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			xhtp.send('replyId=' + replyId); // 요청방식 post일 경우에 parameter를 send() 포함.

			xhtp.onload = function () {
				let result = JSON.parse(xhtp.response);
				if (result.retCode == 'Success') {
					// 화면에서 지우기.
					btn.parentElement.parentElement.remove(); // 제거.
					alert('삭제 완료');
				} else if (result.retCode == 'Fail') {
					alert('처리중 에러발생.');
				} else {
					alert('알수 없는 결과값입니다.');
				}
			}
		});
		btn.innerText = 'X';
		let td = document.createElement('td');
		td.append(btn);
		tr.append(td);
		
		return tr; //생성한 tr 을 반환.
	}
	
	// 등록이벤트...
	document.querySelector("#addBtn").addEventListener('click', addReplyFnc);

	function addReplyFnc(e) {
		// 로그인 여부를 체크해서 로그인 정보가 없으면 로그인화면으로 이동하기.
		let userNo = document.querySelector('#content span').innerText;
		if (userNo == null || userNo == '') {
			alert("로그인 후에 처리하세요.");
			location.href = 'login.do';
			return;
		}
		let replySubject = document.querySelector('#reply').value;
		if (replySubject == null || replySubject == '') {
			alert("댓글 내용을 입력하세요.");
			document.getElementById("reply").focus();
			return;
		}
	
		// Ajax 호출.  post 형태
		let xhtp = new XMLHttpRequest();
		xhtp.open('post', 'addReply.do');
		xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhtp.send('userNo=${UserNo }&replySubject=' + replySubject + "&cbId=${VOInfo.cbId}&userName=${UserName}");
		xhtp.onload = function () {
			let result = JSON.parse(xhtp.response);
			if (result.retCode == 'Success') {
				let tr = makeTrFunc(result.data);
				tlist.append(tr);

				document.getElementById("reply").value = '';
				document.getElementById("reply").focus();
			} else if (result.retCode == 'Fail') {
				alert('처리중 에러.');
			}
		}
	}
</script>