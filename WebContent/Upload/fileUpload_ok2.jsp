<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import = "com.oreilly.servlet.*, java.io.*" %>
    
<!-- com.oreilly.servlet�� cos.jar�� ���Ե��־ import ��ų �� ���� -->

<%
	MultipartRequest mr = null;
	String upPath = config.getServletContext().getRealPath("/Upload");

	
	try{ // (request, ��������ġ, �ִ�ũ��, �۲� ���� ������)

		mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
		out.println("���Ͼ��ε强��");
		
	}catch(IOException e){
		e.printStackTrace();
	}
	//���� ��� ����,, �հ����� �Ѿ��
	//���� ��ü�� ���� ũ�⸦ ���ؾ� �ϰ�,, get���� ���Ҽ��� ����
	
	File file = mr.getFile("filename");
	long filesize = 0L;
	if(file !=null){
		filesize = file.length();
	}
%>


<hr color = "black">
<li> �ø��� : <%=mr.getParameter("name")%> </li>
<li> ���ϸ� : <%=mr.getFilesystemName("filename") %></li>
<li> ����Ʈ Ÿ�� : <%=mr.getContentType("filename") %></li>
<li> ����ũ�� : <%=filesize %> bytes</li>