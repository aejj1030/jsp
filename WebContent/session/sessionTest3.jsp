<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

	//session.removeAttribute("id"); // ��������
	session.invalidate(); // ���ǰ� ��ü ����
%>

<script type = "text/javascript">
	alert("�α׾ƿ���. �α��� �������� �̵�")
	location.href = "sessionTest1.jsp"
</script>