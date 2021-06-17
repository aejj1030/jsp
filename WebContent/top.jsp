<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<html>
<head>
<title>홈페이지</title>
	<link rel = "stylesheet" type = "text/css" href = "style.css"	>
	<script type = "text/javascript">
		function checkMember(){
			window.open("<%=request.getContextPath()%>/member/memberSsn.jsp	", "check", "width = 640, height=400")
		}
	</script>
</head>
<body>

<%
		//아이디로 로그인하면 로그인 - > 로그아웃 바뀌는 작업중,, session 저장중,,
		//로그인하면 로그인정보를 session에 저장하는것일뿐!!!
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		boolean isLogin = false;
		if(id!=null && name!= null){
			isLogin = true;
		}


%>
	<div align = "center">
		<table border = "1" width = "800" height = "650">
		<tr hight ="10%">
			<td align = "center" colspan = "2" > 
			<!-- =request.getContextPath() 는 절대경로 -->
			<%System.out.println(request.getContextPath()) ;%>
			<%System.out.println(request.getRequestURI()) ;%>
			<a href = " <%=request.getContextPath()%>/index.jsp">main </a>
			
			<% if (isLogin) {%>
			<a href = "<%=request.getContextPath() %>/login/logout.jsp"> 로그아웃</a>	
			<%} else { %>
			<a href = " <%=request.getContextPath()%>/login/login.jsp"> 로그인 </a>
			<% } %>
			<a href = "javascript:checkMember()"> 회원가입 </a>
			<!-- 같은 내용이 하나의 페이지에서 실행할 수 있는 방법을 알아보자 -->
			
			<a href = " <%=request.getContextPath()%>/member/memberAll.jsp"> 회원보기</a>
			<a href = " <%=request.getContextPath()%>/member/memberAll.jsp?mode=find"> 회원찾기</a>
			<a href = " <%=request.getContextPath() %>/board/list.jsp"	>게시판</a>

			</td>
		</tr>

		
		<tr height = "80%">
			<td width = "20%" valign = "top" > 
			<% if(isLogin){%>
				<b>[<%=name %>]님이 로그인중,,,,,</b>
			<%}else{%>
				<b>로그인을 해주세요</b>
<%} %>	
			<br><br>
			<jsp:include page="/count/count.jsp"></jsp:include>
			</td>
			<td>
	