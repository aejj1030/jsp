<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import="my.board.*" %>
<jsp:useBean id ="dao" class="my.board.BoardDataBean"/>

<%@ include file="../top.jsp" %>

<link rel="stylesheet" type="text/css" href="../style.css">

<%
		String num=request.getParameter("num");
		if(num==null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		//����� content �����ϱ�! �����Ҷ��ϱ�! ��ȸ���� �ö��� �ʰ��Ѱ�����!
		BoardDBBean dto=dao.getBoard(Integer.parseInt(num), "update");
%>


<script type="text/javascript">
	function check(){
		if(f.writer.value==""){
			alert("�̸��� �Է����ּ���")
			f.writer.foucs()
			//return�� ���� true�� ���ϵ�!! �׷��Ƿ� false �� ������Ұ�! �׷��� onsubmit ����
			return false
		}
		if(f.subject.value==""){
			alert("������ �Է����ּ���")
			f.subject.focus()
			return false
		}
		if(f.content.value==""){
			alert("������ �Է����ּ���")
			f.content.foucs()
			return false
		}
		if(f.passwd.value==""){
			alert("��й�ȣ�� �Է����ּ���")
			f.passwd.focus()
			return false

		}return true
	}

</script>


<div align="center">
<form name ="f" action="updatePro.jsp" method="post" onsubmit="return check()">
		<input type="hidden" name="num" value="<%=num%>"/>
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<td colspan="2"	 align="center">�ۼ���</td>
			</tr>
			<tr>
				<td align="center" width="20%">�̸�</td>
				<td><input type="text"name="writer" class="box" value="<%=dto.getWriter()%>"></td>
			</tr>
			<tr>
				<td align="center" width="20%">����</td>
				<td><input type="text"	name="subject" size="40" class="box"value="<%=dto.getSubject()%>"></td>
			</tr>
			<tr>
				<td align="center" width="20%" >Email</td>
				<td><input type="text" name="subjecct" size="40" class="box"value="<%=dto.getEmail()%>"></td>
			</tr>
			<tr>
				<td align="center" width="20%" >����</td>
				<td><textarea rows="11" cols="40"	name ="content" class="box"></textarea>></td>
			</tr>
			<tr>
				<td align="center" width="20%">��й�ȣ</td>
				<td><input type="password" name="passwd"	class="box"><%=dto.getContent() %></td>
			</tr>
			<tr>
				<td colspan="3" bgcolor="yellow" align="center">
					<input type="submit" value="�ۼ���">
					<input type="reset" value="�ٽ��ۼ�"	>
					<input type="button" value="��Ϻ���" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
		</form>
</div>
<%@ include file="../bottom.jsp" %>