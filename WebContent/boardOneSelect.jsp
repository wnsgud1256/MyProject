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
			<th>�ۼ���</th>
			<td>${oneBoard.boardWriter}</td>
			<th>��ȸ��</th>
			<td>${oneBoard.boardCount}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${oneBoard.boardTitle}</td>
		</tr>
		<tr>
			<th>�ۼ�����</th>
			<td>${oneBoard.boardDate}</td>
			<th>�ֱ� ������ ��¥</th>
			<td><c:if test="${oneBoard.boardLmd == null}">����</c:if>${oneBoard.boardLmd}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${oneBoard.boardContent}</td>
		</tr>
	</table>
	<button onclick="location.href='main.do'">�������</button>
	<c:if test="${sessionid !=null}">
	<input type="button" value="�� ����" onclick="boardAction(0)">
	<input type="button" value="�� ����" onclick="boardAction(1)">
	</c:if>
	
	<script>
		function boardAction(value) {
			if(value == 0) 
				location.href="boardUpdate.do?number=${oneBoard.boardNumber}";
			else if(value == 1) {
			let delCheck = confirm("�ش� ���� ���� �����Ͻðڽ��ϱ�?");
				if(delCheck) {
					alert("�����Ǿ����ϴ�.");
					location.href="boardDelete.do?number=${oneBoard.boardNumber}";
				} else {
					alert("������ ��� �Ǿ����ϴ�.")
				}
			
			}
		}
	</script>
</body>
</html>