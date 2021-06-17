<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*" %>


<jsp:useBean id="dto" class="my.board2.Board2DBBean"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id = "dao" class="my.board2.Board2DataBean"/>
<jsp:useBean id = "pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property ="pool" name="dao" value="<%=pool%>" />

<%

	MultipartRequest mr = null;
	String upPath=config.getServletContext().getRealPath("/board3");
	int len = 10*1024*1024;
	try{
		mr=new MultipartRequest(request,upPath,len,"EUC-KR");
	}catch(IOException e){
		e.printStackTrace();
	}
	
		
	String writer=mr.getParameter("writer");
	if(writer==null|| writer.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
		
	}
	String ip = request.getRemoteAddr();
	int res=dao.insertBoard(mr,ip);
	
	if(res>0){%>
	<script type="text/javascript">
		alert("게시글 등록 성공,, 게시글 목록 페이지로 이동")
		location.href="list.jsp"
	</script>
	
<%} else{%>
	<script type="text/javascript">
		alert("게시글 등록 실패,, 게시글 등록 페이지로 이동")
		location.href="writeForm.jsp"
	</script>
<%} %>