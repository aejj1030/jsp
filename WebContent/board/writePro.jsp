<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="dto" class="my.board.BoardDBBean"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id = "dao" class="my.board.BoardDataBean"/>


<%

	if(dto.getWriter()==null || dto.getWriter().trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}

	//����ڿ� ���� ip�ּҸ� �����ͼ� ����־��!
	dto.setIp(request.getRemoteAddr());
	//dto�� ip�����ؼ� dto������ �־��ش�
	int res=dao.insertBoard(dto);
	
	if(res>0){%>
	<script type="text/javascript">
		alert("�Խñ� ��� ����,, �Խñ� ��� �������� �̵�")
		location.href="list.jsp"
	</script>
	
<%} else{%>
	<script type="text/javascript">
		alert("�Խñ� ��� ����,, �Խñ� ��� �������� �̵�")
		location.href="writeForm.jsp"
	</script>
<%} %>