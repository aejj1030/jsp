<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	
		<jsp:useBean id = "obj" class = "my.scope.Counter"  scope = "session"/>
		<b> page : obj의 getCount() 값 :</b>
		<jsp:getProperty property="count" name ="obj" />
		<br> 
		<a href="scope.html" > 처음으로 </a>