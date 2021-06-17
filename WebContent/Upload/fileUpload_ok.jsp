<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일내용보기</title>
</head>
<body>
	<div align = "center">
		<h2>파일 업로드 테스트</h2>
		<h3>전송되는 데이터의 형태를 화면 그대로 출력하기</h3>
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