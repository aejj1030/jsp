<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

		<jsp:useBean id = "obj" class = "my.scope.Counter"  scope = "session" />
		<jsp:setProperty name = "obj" property="*"/>
		<h2>page scope</h2>
		<b>obj의 getCount()호출값 :</b>
		<jsp:getProperty property = "count" name = "obj" />
		<br>
		<jsp:forward page= "result.jsp"/>