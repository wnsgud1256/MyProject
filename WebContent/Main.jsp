<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	window.history.forward();
	function noBack(){
		window.history.forward();
		
	}
</script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<c:choose>
				<c:when test="${sessionid != null}">
					<p>어서오세요${sessionid}님</p>
					<form action="logOut.do" method="Post">
						<input type="submit" value="로그아웃" class="btn btn-outline-success">
					</form>
				</c:when>
				<c:otherwise>
					<button class="btn btn-outline-success" onclick="location.href='Login.jsp'">로그인 페이지로 이동</button>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="row">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일자</th>
						<th>최근에 수정된 시간</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="board">
						<tr>
							<td>${board.boardWriter}</td>
							<td><a href="oneselect.do?number=${board.boardNumber}">${board.boardTitle}</a></td>
							<td>${board.boardDate}</td>
							<td><c:if test="${board.boardLmd == null}">없음</c:if>${board.boardLmd}</td>
							<td>${board.boardCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${sessionid != null}">
				<button onclick="location.href='boardInsert.jsp'">글쓰기</button>
			</c:if>
		</div>
	</div>
	

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>