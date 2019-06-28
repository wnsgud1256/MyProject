<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
html,body {height: 100%;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
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
<form action="boardinsert.do" method="Post">
	<table class="table table-sm">
		<tr>
			<th>작성자</th>
			<td>${sessionid}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" size="50" maxlength="100" placeholder="제목을 입력하세요" autocomplete="off" id="title" style="border:none; background-color:#D8D8D8;"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" cols="100" rows="10" placeholder="내용을 입력하세요" autocomplete="off" id="content" style="border:none;"></textarea></td>
		</tr>
	</table>
	<button class="btn btn-success"id="form1">글 올리기</button>
	<input type="reset" class="btn btn-danger" onclick="location.href='main.do?page=1'" value="취소"> 
	<input type="hidden" value="1" name="page">
</form>
</div>
</div>
<script>
$("#form1").on("click", function() {
	let title = $("#title").val();
	let content = $("#content").val();
	
	if(title==""){
		alert("제목을 써주세요");
		return false;
	} else if(content==""){
		alert("내용을 써주세요");
		return false;
	}
	document.getElementById("form1").submit();
})
</script>

<jsp:include page="bootstrap4.jsp" />

<jsp:include page="footer.jsp"/>
</body>
</html>