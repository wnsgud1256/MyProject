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
<form action="boardinsert.do" method="Post">
	<table border="1">
		<tr>
			<th>�ۼ���</th>
			<td><input type="text" name="writer" value="${sessionid}" readonly></td>
		</tr>
		<tr>
			<th>����</th>
			<td><input type="text" name="title" placeholder="������ �Է��ϼ���"></td>
		</tr>
		<tr>
			<th>����</th>
			<td><textarea name="content" placeholder="������ �Է��ϼ���"></textarea></td>
		</tr>
	</table>
	<input type="submit" value="�� �ø���">
	<input type="reset" value="���" onclick="history.go(-1)">
</form>
</body>
</html>