<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import = "com.oreilly.servlet.*, java.io.*" %>
    
<!-- com.oreilly.servlet는 cos.jar에 포함돼있어서 import 시킬 수 있음 -->

<%
	MultipartRequest mr = null;
	String upPath = config.getServletContext().getRealPath("/Upload");

	
	try{ // (request, 저장할위치, 최대크기, 글꼴 값이 들어가야함)

		mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
		out.println("파일업로드성공");
		
	}catch(IOException e){
		e.printStackTrace();
	}
	//파일 쿠기 구함,, 롱값으로 넘어옴
	//파일 객체를 만들어서 크기를 구해야 하고,, get으로 구할수는 없음
	
	File file = mr.getFile("filename");
	long filesize = 0L;
	if(file !=null){
		filesize = file.length();
	}
%>


<hr color = "black">
<li> 올린이 : <%=mr.getParameter("name")%> </li>
<li> 파일명 : <%=mr.getFilesystemName("filename") %></li>
<li> 컨텐트 타입 : <%=mr.getContentType("filename") %></li>
<li> 파일크기 : <%=filesize %> bytes</li>