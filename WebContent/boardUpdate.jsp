<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
html,body {height: 100%;}
</style>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		let changeStyle = $("#footer-basic"); //푸터 css 변경법
		changeStyle.css('position', 'absolute');
	});
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container" style="margin:100px auto auto auto;">
<div class="row justify-content-md-center">
<form action="boardUpdateOk.do" method="POST" onsubmit="return updateCheck();">
		<table class="table table-sm">
		<tr>
			<th>작성자</th>
			<td>${Info.boardWriter}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" size="50" maxlength="100" value="${Info.boardTitle}" autocomplete="off" style="border:none; background-color: #D8D8D8" id="title"></td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${Info.boardDate}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="content" name="content" cols="100" rows="10"autocomplete="off">${Info.boardContent}</textarea></td>
		</tr>
	</table>
	<input type="hidden" name="number" value="${Info.boardNumber}">
	<input type="submit" class="btn btn-success" value="게시글 수정">
	<input type="reset" class="btn btn-danger" value="취소" onclick="history.go(-1)"> 
</form>
</div>
</div>
<script>
	function updateCheck() {
		
		let title = $("#title").val();
		let content = $("#content").val();
		
		if(title==""){
			alert("제목을 써주세요");
			return false;
		} else if(content==""){
			alert("내용을 써주세요");
			return false;
		}
		
		let upCheck = confirm("해당 글을 정말 수정 하시겠습니까?");
			if(upCheck){
				alert("게시글이 수정 되었습니다.");
			} else {
				alert("게시글 수정이 취소 되었습니다..");
				return false;
			}
	}
</script>
<jsp:include page="bootstrap4.jsp" />
	<jsp:include page="footer.jsp"/>
	
</body>
</html>