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
<form action="boardUpdateOk.do" method="POST">
		<table border="1">
		<tr>
			<th>�ۼ���</th>
			<td>${Info.boardWriter}</td>
		</tr>
		<tr>
			<th>����</th>
			<td><input type="text" name="title" value="${Info.boardTitle}"></td>
		</tr>
		<tr>
			<th>�ۼ�����</th>
			<td>${Info.boardDate}</td>
		</tr>
		<tr>
			<th>����</th>
			<td><textarea name="content">${Info.boardContent}</textarea></td>
		</tr>
	</table>
	<input type="hidden" name="number" value="${Info.boardNumber}">
	<input type="submit" value="���� ����" onclick="updateCheck();">
	<input type="reset" value="���" onclick="history.go(-1)"> 
</form>

<script>
	function updateCheck() {
		let upCheck = confirm("�ش� ���� ���� ���� �Ͻðڽ��ϱ�?");
			if(upCheck){
				alert("������ ���� �Ǿ����ϴ�.");
			}
	}
</script>

</body>
</html>