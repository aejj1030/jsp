<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//세션값 다 지워버리고
	session.invalidate();
%>
<script type = "text/javascript">
	alert("로그아웃~~~룰루")
	location.href="login.jsp"
</script>