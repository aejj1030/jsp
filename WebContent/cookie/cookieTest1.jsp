<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��Ű�׽�Ʈ1</title>
</head>
<body>
<%

	Cookie ck = new Cookie("id", "admin");
	ck.setMaxAge(24*60*60);
	response.addCookie(ck);


%>

</body>
</html>