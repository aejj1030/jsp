<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일 업로드</title>
</head>
<body>
	<div align="center">
		<h2>파일업로드테스트</h2>


		<form name="f" action="fileUpload_ok.jsp" method="post"
			enctype="multipart/form-data">

			<table border="1" width="500">
				<tr>
					<th>올린사람</th>
					<td><input type="text" name="name"></td>
				</tr>

				<tr>
					<th>파일이름</th>
					<td><input type="file" name="filename"></td>
				</tr>

				<tr>
					<td align="center" colspan="2"><input type="submit"
						value="파일업로드"> <input type="reset" value="다시입력">
				</tr>


			</table>
		</form>
	</div>
</body>

</html>