<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

		<jsp:useBean id = "obj" class = "my.scope.Counter"  scope = "session" />
		<jsp:setProperty name = "obj" property="*"/>
		<h2>page scope</h2>
		<b>obj�� getCount()ȣ�Ⱚ :</b>
		<jsp:getProperty property = "count" name = "obj" />
		<br>
		<jsp:forward page= "result.jsp"/>