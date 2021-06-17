<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>

<link rel="stylesheet" type="text/css" href="../style.css">

<%

		String num=request.getParameter("num");
		if(num==null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		%>
		
		
<div align="center">
	<b>글삭제</b>
		<form name="f" action="deletePro.jsp" method="post">
			<input type="hidden" name="num" value="<%=num %>"/>
			<table border="1" width="300">
			
				<tr>
					<th> 비밀번호를 입력해주세요</th>
				</tr>
				<tr>
					<td align = "center"> 비밀번호<input type ="password" name="passwd"></td>
				</tr>
				<tr>
					<td align="center">
						<input type="submit" value="글삭제">
						<input type="button" value="글목록" onclick="window.loaction='list.jsp'">
				</tr>
			
			</table>
		</form>


</div>
<%@ include file="../bottom.jsp"%>
