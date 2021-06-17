<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

	//session.removeAttribute("id"); // 개별삭제
	session.invalidate(); // 섹션값 전체 삭제
%>

<script type = "text/javascript">
	alert("로그아웃됨. 로그인 페이지로 이동")
	location.href = "sessionTest1.jsp"
</script>