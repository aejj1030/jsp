<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵�ã��</title>
<link rel = "stylesheet" type = "text/css" href = "../style.css">

</head>
<body>
	<div align = "center" >
		<hr color = "blue" width = "300">
			<form name = "f" action = "checkMember.jsp"	 method = "post">
				<table width = "500" class = "outline">
					<tr>
						<th width = "20%"> ���̵� </th>
						<td><input type = "text" name = "name" class = "box"> </td>
					</tr>
					
					<tr>
						<td colspan = "2" align = "center" >
						<input type = "submit" value = "��ȸ">
						<input type = "reset" value = "���">
						
					</tr>
				</table>
			</form>
		<hr color = "blue" width = "300">
		</div>
</body>
</html>