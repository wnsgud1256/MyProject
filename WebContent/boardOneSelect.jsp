<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>작성자</th>
			<td>${oneBoard.boardWriter}</td>
			<th>조회수</th>
			<td>${oneBoard.boardCount}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${oneBoard.boardTitle}</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${oneBoard.boardDate}</td>
			<th>최근 수정된 날짜</th>
			<td><c:if test="${oneBoard.boardLmd == null}">없음</c:if>${oneBoard.boardLmd}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${oneBoard.boardContent}</td>
		</tr>
	</table>
	<button onclick="location.href='main.do'">목록으로</button>
	<c:if test="${sessionid !=null}">
	<input type="button" value="글 수정" onclick="boardAction(0)">
	<input type="button" value="글 삭제" onclick="boardAction(1)">
	</c:if>
	
	<script>
		function boardAction(value) {
			if(value == 0) 
				location.href="boardUpdate.do?number=${oneBoard.boardNumber}";
			else if(value == 1) {
			let delCheck = confirm("해당 글을 정말 삭제하시겠습니까?");
				if(delCheck) {
					alert("삭제되었습니다.");
					location.href="boardDelete.do?number=${oneBoard.boardNumber}";
				} else {
					alert("삭제가 취소 되었습니다.")
				}
			
			}
		}
	</script>
</body>
</html>