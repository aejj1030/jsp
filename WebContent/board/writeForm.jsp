<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ include file = "../top.jsp"%>
<%@ include file = "../loginCheck.jsp" %>
<link rel="stylesheete" type="text/css" href="../style.css">


<script type="text/javascript">

	function check(){
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
		if(f.filename.value==""){
			alert("������ �������ּ���")
			f.filename.focus()
		}
		if(f.passwd.value==""){
			alert("��й�ȣ�� �Է����ּ���")
			f.passwd.focus()
			return false
		}
		return true
	}
	<%
		int num=0, re_step=0, re_level=0, re_group=0;
		//�Ѿ�� ������ �ޱ�
	
		String snum = request.getParameter("num");
		//num�� �Ѿ�ö� ->����϶�
		//num�� �ȳѾ�ö�->�۾����ư,, �����϶�! -> num���� 0��
		
		if(snum!=null){ //����̴�? snum�� ��������ʴ�? snum�� ���� ������ t -> ����̾�!
			
			num=Integer.parseInt(snum);
			re_step=Integer.parseInt(request.getParameter("re_step"));
			re_level=Integer.parseInt(request.getParameter("re_level"));
			//3���� �������,, �׷�ȭ �ϴ���
			re_group=Integer.parseInt(request.getParameter("re_group"));
		}
	
	
	%>
	
</script>
<div align="center">
	<!-- onsubmit�� ��ȿ�� �˻��ϴ°�! -->
	<form name ="f" action="writePro.jsp" method="post"  onsubmit="return check()" >
	
		<!-- ��۾����ϰ�� �� �Ѱ���~!~! -->
		<input type="hidden" name="num" value="<%=num%>"/>
		<input type="hidden" name="re_step" value="<%=re_step%>"/>
		<input type="hidden" name="re_level" value="<%=re_level%>"/>
		<input type="hidden" name="re_group" value="<%=re_group%>"/>
		
		<table border="1"  width="500">
			<tr bgcolor="yellow">
				<td colspan="2"	 align="center">�۾���</td>
			</tr>
			<tr>
				<td align="center" width="20%">�̸�</td>
				<td><input type="text"name="writer" class="box" value=<%=mbName%> readOnly></td>
			</tr>
			<tr>
				<td align="center" width="20%">����</td>
				<td><input type="text"	name="subject" size="40" class="box"></td>
			</tr>
			<tr>
				<td align="center" width="20%" >Email</td>
				<td><input type="text" name="email" size="40" class="box"></td>
			</tr>
			<tr>
				<td align="center" width="20%" >����</td>
				<td><textarea rows="11" cols="40"	name ="content" class="box"></textarea></td>
			</tr>
			<tr>
				<td align="center" width="20%">��й�ȣ</td>
				<td><input type="password" name="passwd"	class="box"></td>
			</tr>
			
			<tr>
				<td colspan="2" bgcolor="yellow" align="center">
					<input type="submit" value="�۾���">
					<input type="reset" value="�ٽ��ۼ�"	>
					<input type="button" value="��Ϻ���" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
		</form>
</div>

<%@ include file = "../bottom.jsp"%>