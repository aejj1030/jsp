<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	
		<jsp:useBean id = "obj" class = "my.scope.Counter"  scope = "session"/>
		<b> page : obj�� getCount() �� :</b>
		<jsp:getProperty property="count" name ="obj" />
		<br> 
		<a href="scope.html" > ó������ </a>