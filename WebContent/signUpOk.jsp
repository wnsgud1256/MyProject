<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="SignUpOk.do" method="POST" onsubmit="return signCheck();">
	���̵� : <input type="text" name="id" id="id" value="${sign.memberId}" readonly="readonly">
	��й�ȣ  : <input type="password" name="pw" id="pw" value="${sign.memberPw}" readonly="readonly">
	�̸� : <input type="text" name="name" id="name" value="${sign.memberName}" readonly="readonly">
	������� : <input type="text" name="birth" id="birth" value="${sign.memberBirth}" readonly="readonly">
	�̸���  : <input type="text" name="email" id="email" value="${sign.memberEmail}" readonly="readonly">
	
	<input type="submit" value="ȸ������" >
	<input type="reset" onclick="history.go(-1)">
</form>	

<script>
	function signCheck() {
		let siCheck = confirm("�Է��� ������ Ȯ���մϱ�?"); 
			if(siCheck){
				alert("ȸ�������� �����մϴ�.");
			} else {
				alert("�Էµ� ������ �ٽ��ѹ� Ȯ�����ֽñ� �ٶ��ϴ�.");
				return false;
			}
	}
</script>
</body>
</html>