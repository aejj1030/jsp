<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import=" my.board2.*" %>
<jsp:useBean id ="dao" class="my.board2.Board2DataBean"/>
<jsp:useBean id = "pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property ="pool" name="dao" value="<%=pool%>" />


<%@ include file="../top.jsp" %>

<link rel="stylesheete" type="text/css" href="../style.css">

<%

//�Խ��� ��ȸ�� �����ϱ� &nbsp;


		String num=request.getParameter("num");
		if(num==null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		Board2DBBean dto=dao.getBoard(Integer.parseInt(num), "content");
%>


<div align="center">

	<b>�۳��� ����</b>
		<table border="1" width="600">
			<tr>
				<th width="20%"> �۹�ȣ</th>
				<td align="center" width="30%"><%=dto.getNum() %></td>
				<th width="20%">��ȸ��</th>
				<td align="center" width="30%"><%=dto.getReadcount()%></td>
			</tr>
			
				<tr>
				<th width="20%"> �ۼ���</th>
				<td align="center" width="30%"><%=dto.getWriter()%></td>
				<th width="20%">�ۼ���</th>
				<td align="center" width="30%"><%=dto.getReg_date()%></td>
			</tr>
			
				<tr>
				<th width="20%"> ������</th>
				<td width="80%" colspan="3"><%=dto.getSubject()%></td>
				</tr>
				
				<%
					String upPath = config.getServletContext().getRealPath("/board2");
	
				%>
				<tr>
				<th width="20%">���ϸ�</th>
				<td width="80%" colspan="3">
				<!--  ���� ������ �̸���  ���¾ �Ȳ���������,, ��Ȯ�� ��θ� ���ϰ� ������ �����Ծ����,,������!!!!! --> 
				<a href="<%=upPath %>/<%=dto.getFilename()%>"><%=dto.getFilename()%></a></td>
				
				</tr>
				
				<tr>

				<tr>
				<th width="20%">�۳���</th>
				<td width="80%" colspan="3"><%=dto.getContent()%></td>
			</tr>
			
				<tr>
					<td align ="right" colspan="4">
						<!-- �Խ��� ������ֿ� -->
						<input type="button" value="��۾���" 
						onclick="window.location='writeForm.jsp?num=<%=dto.getNum()%>">&nbsp; &nbsp; &nbsp;
					
						<input type="button" value="�ۼ���" 
						onclick="window.location='updateForm.jsp?num=<%=dto.getNum()%>'">&nbsp; &nbsp; &nbsp;
						
						<input type="button" value="�ۻ���" 
						onclick="window.location='deleteForm.jsp?num=<%=dto.getNum()%>'">&nbsp; &nbsp; &nbsp;
						
						<input type="button" value="�۸��" 
						onclick="window.location='list.jsp'">
					</td>
				</tr>	
		</table>
</div>
<%@ include file="../bottom.jsp" %>