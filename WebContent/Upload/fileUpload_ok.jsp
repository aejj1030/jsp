<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ϳ��뺸��</title>
</head>
<body>
	<div align = "center">
		<h2>���� ���ε� �׽�Ʈ</h2>
		<h3>���۵Ǵ� �������� ���¸� ȭ�� �״�� ����ϱ�</h3>
		<hr color ="blue">
		
		<%
				String type = request.getContentType();
				int len = request.getContentLength();
		
		%>
		
				ContentType = <%=type %><br>
				len = <%=len %><br>
				<hr color = "black">
				
		<%
				ServletInputStream in = request.getInputStream();
				byte data[] = new byte[1024];
				int n = 0;
				while((n=in.read(data)) != -1){
					String str = new String(data,0,n);
					out.println(str);
				}in.close();
		
		%>		
	</div>

</body>
</html>