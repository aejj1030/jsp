<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε�</title>
</head>
<body>
	<div align="center">
		<h2>���Ͼ��ε��׽�Ʈ</h2>


		<form name="f" action="fileUpload_ok.jsp" method="post"
			enctype="multipart/form-data">

			<table border="1" width="500">
				<tr>
					<th>�ø����</th>
					<td><input type="text" name="name"></td>
				</tr>

				<tr>
					<th>�����̸�</th>
					<td><input type="file" name="filename"></td>
				</tr>

				<tr>
					<td align="center" colspan="2"><input type="submit"
						value="���Ͼ��ε�"> <input type="reset" value="�ٽ��Է�">
				</tr>


			</table>
		</form>
	</div>
</body>

</html>