<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<html>
<head>
<title>Ȩ������</title>
	<link rel = "stylesheet" type = "text/css" href = "style.css"	>
	<script type = "text/javascript">
		function checkMember(){
			window.open("<%=request.getContextPath()%>/member/memberSsn.jsp	", "check", "width = 640, height=400")
		}
	</script>
</head>
<body>

<%
		//���̵�� �α����ϸ� �α��� - > �α׾ƿ� �ٲ�� �۾���,, session ������,,
		//�α����ϸ� �α��������� session�� �����ϴ°��ϻ�!!!
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
			<!-- =request.getContextPath() �� ������ -->
			<%System.out.println(request.getContextPath()) ;%>
			<%System.out.println(request.getRequestURI()) ;%>
			<a href = " <%=request.getContextPath()%>/index.jsp">main </a>
			
			<% if (isLogin) {%>
			<a href = "<%=request.getContextPath() %>/login/logout.jsp"> �α׾ƿ�</a>	
			<%} else { %>
			<a href = " <%=request.getContextPath()%>/login/login.jsp"> �α��� </a>
			<% } %>
			<a href = "javascript:checkMember()"> ȸ������ </a>
			<!-- ���� ������ �ϳ��� ���������� ������ �� �ִ� ����� �˾ƺ��� -->
			
			<a href = " <%=request.getContextPath()%>/member/memberAll.jsp"> ȸ������</a>
			<a href = " <%=request.getContextPath()%>/member/memberAll.jsp?mode=find"> ȸ��ã��</a>
			<a href = " <%=request.getContextPath() %>/board/list.jsp"	>�Խ���</a>

			</td>
		</tr>

		
		<tr height = "80%">
			<td width = "20%" valign = "top" > 
			<% if(isLogin){%>
				<b>[<%=name %>]���� �α�����,,,,,</b>
			<%}else{%>
				<b>�α����� ���ּ���</b>
<%} %>	
			<br><br>
			<jsp:include page="/count/count.jsp"></jsp:include>
			</td>
			<td>
	