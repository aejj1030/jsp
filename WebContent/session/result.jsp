<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String msg = null, url = null;
	
	if(id.equals("admin")){
		if(pwd.equals("1234")){
			session.setAttribute("id", id);
			msg = "�α���,, ���� ȸ������ �������� �̵�"	;
			url = "sessionTest2.jsp";
		}else{
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�,,�ٽ�,,"	;
			url = "sessionTest1.jsp";
		}
		
	}else{
		msg = "���̵� Ʋ�Ƚ��ϴ�. �ٽ� �α������ּ���"	;
		url  = "sessionTest1.jsp";
		
	}
%>

<script type = "text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>