<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name="userInfo" method="post" action="SignUp.do" onsubmit="return checkValue();">
<table>
	<tr>
		<th>���̵�</th> 
		<td><input type="text" name="id" onkeydown="inputIdChk();">
		<input type="button"  value="�ߺ�Ȯ�� " onclick="openIdChk();">
		<input type="hidden" name="idVal" value="idNoCheck">
		</td>
	</tr>
	<tr>
		<th>��й�ȣ</th> 
		<td><input type="password" name="pw" id="pw"></td>
	</tr>
	<tr>
		<th>��й�ȣ Ȯ�� </th>
		<td><input type="password" id="pwCheck"></td>
	</tr>
	<tr>
		<th>�̸�</th> 
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>�������</th> 
		<td><input type="text" name="birth" placeholder="ex)20001030"></td>
	</tr>
	<tr>
		<th>�̸���</th> 
		<td><input type="text" name="email"></td>
	</tr>
</table>
	<input type="submit" value="����">
	<input type="reset" value="���" onclick="location.href='Login.jsp'">
</form>
<script>
	function checkValue() {
		let form = document.userInfo;
		let emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let Check = /^[a-zA-Z0-9]{4,12}$/; // ���̵� �����ȿ�� �˻� ���Խ�
		let birthCheck =/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		
		
		if(!form.id.value){
			alert("���̵� �Է��ϼ���.");
			return false;
		}
		if(form.idVal.value !="idCheck"){
			alert("���̵� �ߺ�üũ�� ���ּ���.");
			return false;
		}
		if(!Check.test(form.id.value)){
			alert("���̵�� 4~12���� ���� ��ҹ��ڿ� ���ڷθ� �Է� ���ּ���.")
			return false;
		}
		if(!form.pw.value){
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}
		if(!Check.test(form.pw.value)){
			alert("��й�ȣ��  4~12���� ���� ��ҹ��ڿ� ���ڷθ� �Է� ���ּ���.")
			return false;
		}
		if(form.pw.value != form.pwCheck.value){
			alert("��й�ȣ�� ��й�ȣȮ�ζ��� �����ϰ� �Է��ϼ���.");
			return false;
		}
		if(!form.name.value){
			alert("�̸��� �Է��ϼ���.");
			return false;
		}
		if(form.email.value==""){
			alert("�̸����� �Է��� �ּ���.");
			return false;
		}
		if(!emailCheck.test(form.email.value)){
			alert("�������� ���� �̸��� �����Դϴ�.");
			return false;
		}
		if(isNaN(form.birth.value)){
			alert("��������� ��Ŀ� ���� �ʽ��ϴ�. ex)2000�� 10�� 30�ϻ�  ->20001030");
			return false;	
		}if(!birthCheck.test(form.birth.value)){
			alert("��������� ��Ŀ� ���� �ʽ��ϴ�. ex)2000�� 10�� 30�ϻ�  ->20001030");
			return false;
		} 
	
	}
	function openIdChk(){
		window.name = "parentForm"; //�θ�â �̸�
		window.open("idCheckForm.jsp","checkForm","width=500, height=300 resizable=no, scrollbars=no");
	}
	function inputIdChk(){ //���̵� �ߺ�üũ ����
		document.userInfo.idVal.value ="idNoCheck";
	}
	
</script>
</body>
</html>