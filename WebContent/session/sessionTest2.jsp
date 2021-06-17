<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원전용페이지</title>
</head>
		<body>
		
		<% String id = (String) session.getAttribute("id"); 
			if(id == null){%>
			<script type = "text/javascript">
			
			alert("로그인을 해주세요,,")
			location.href="sessionTest1.jsp"
			
			</script>	
<% 		return;	}
		%>
		
		
				<h1> 회원 전용 페이지</h1>
				<h2> 회원만 볼 수 있도록,, 로그인이 안됐을때는 접근할 수 없게</h2>
				<a href = "session Test3.jsp"> 로그아웃 </a>
		</body>
</html>