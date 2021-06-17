<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.board.*"%>
<!-- list.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css"> 
<jsp:useBean id="dao" class="my.board.BoardDataBean" />

<div align="center">
	<b>�� �� ��</b>
	<table border="0" width="100%">
		<tr bgcolor="yellow">
			<td align="right">
			<a href="writeForm.jsp">�۾���</a></td>
		</tr>
	</table>
	<table border="1" width="100%">
		<tr bgcolor="green">
			<th>��ȣ</th>
			<th width="30%">����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ</th>
			<th>IP</th>
		</tr>
<%
			int pageSize = 3;
			//��ȣ��,,,
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.trim().equals("")){
				pageNum = "1";
			}
			//���� ������
			int currentPage = Integer.parseInt(pageNum);
			//1-5, 6-10, 11-15, 16-20
			//�������� ��µǴ� ó�� �����ϴ� �۹�ȣ
			int startRow = (currentPage-1) * pageSize + 1;
			//�������� ��µǴ� ������ �۹�ȣ
			int endRow = startRow + pageSize - 1;
			
			//�۸�Ͽ� ��µǴ� ��ȣ���ϱ�
			//rowCount -> �� ����!
			int rowCount = dao.getCount();
			//number -> ���� ��ȣ
			int number = rowCount - startRow + 1;
			//endRow�� rowCount���� ũ�ٸ�
			//������ �۹�ȣ�� ���ǰ������� ũ�ٸ�
			//������ �۹�ȣ�� ���ǰ����� ������
			if (endRow > rowCount) endRow = rowCount;
			
			List<BoardDBBean> list = dao.listBoard(startRow, endRow); 
		
			if (list == null || list.size()==0){%>
		<tr>
			<td colspan="6">��ϵ� �Խñ��� �����ϴ�.</td>
		</tr>	
<%		}else {
				for(BoardDBBean dto : list){%>
			<!-- ��ȣ -->		
		<tr>
			<!-- ��� �����ϴ���,, -->
			<td><%=number--%></td>
			<td>
		
<%		
		//re_level�� ���� ������ �����!
		if (dto.getRe_level()>0){ %>
				
				<img src="../img/level.gif" width="<%=dto.getRe_level()*20%>">
				
				<img src="../img/re.gif">
<%		} %>
			<!-- ���� -->			
			<a href="content.jsp?num=<%=dto.getNum()%>">
			<%=dto.getSubject()%></a>
		
		<!-- ��ȸ���� 10�� ������ hot�̹��� �ٿ��ֱ� -->
<%		if (dto.getReadcount()>10){ %>
				<img src="../img/hot.gif">
<%		} %>				
			</td>
			
			<!-- �ۼ��� -->
			<td><%=dto.getWriter()%></td>
			<!-- �ۼ��� -->
			<td><%=dto.getReg_date()%></td>
			<!-- ��ȸ�� -->
			<td><%=dto.getReadcount()%></td>
			<!-- ������ -->
			<td><%=dto.getIp()%></td>
		</tr>							
<%			}
			}%>
	</table>
	
	<!-- �Խñ� � ������ ������ ��������! ������������ �Խù� ����ϱ�! -->
<%
		
		if (rowCount>0){
			//3�׿����ڸ� ����ؼ� ���������� 0�̸� 0, ���������� 0�̾ƴϸ� 1�� �����ش�
			//pageCount���� ��%������������� ���� = 0�̸� 0 // 0�̾ƴϸ� 1
			int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
			// 1234567���������
			//       123 <����> startPage 1		endPage3
			// <����> 456 <����> startPage 4		endPage6
			// <����> 7          startPage 7
			//�̷��� ��½��Ѻ����� �Ѵ�
			
			int pageBlock = 3;
			//1 4 7
			int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
			//3 6 
			int endPage = startPage + pageBlock - 1;
			//������ �Խñ۹�ȣ�� pageCount���� ũ�ٸ�
			//������ �Խñ� ��ȣ�� pageCount
			if (endPage > pageCount) endPage = pageCount;
			
			//���۵Ǵ°��� ������������ ũ�� -> ������������ -> �������ִ�
			if (startPage > pageBlock) { %>
				<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[����]</a>
<%		}
			//startPage���� �����ؼ� endPage�� ���ų� ���������� i���� �����ؼ� �����
			for (int i=startPage; i<=endPage; ++i){%>
				<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%		} 	
			//�����°��� ������ī��Ʈ���� �۴� -> ������������ -> �������ִ�
			if (endPage < pageCount){%>
				<a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[����]</a>
<%		} %>									
<%	}%>	
</div>
<%@ include file="../bottom.jsp"%>









