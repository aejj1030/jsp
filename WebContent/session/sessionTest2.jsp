<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������������</title>
</head>
		<body>
		
		<% String id = (String) session.getAttribute("id"); 
			if(id == null){%>
			<script type = "text/javascript">
			
			alert("�α����� ���ּ���,,")
			location.href="sessionTest1.jsp"
			
			</script>	
<% 		return;	}
		%>
		
		
				<h1> ȸ�� ���� ������</h1>
				<h2> ȸ���� �� �� �ֵ���,, �α����� �ȵ������� ������ �� ����</h2>
				<a href = "session Test3.jsp"> �α׾ƿ� </a>
		</body>
</html>