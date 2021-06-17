<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.board.*"%>
<!-- list.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css"> 
<jsp:useBean id="dao" class="my.board.BoardDataBean" />

<div align="center">
	<b>글 목 록</b>
	<table border="0" width="100%">
		<tr bgcolor="yellow">
			<td align="right">
			<a href="writeForm.jsp">글쓰기</a></td>
		</tr>
	</table>
	<table border="1" width="100%">
		<tr bgcolor="green">
			<th>번호</th>
			<th width="30%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
		</tr>
<%
			int pageSize = 3;
			//번호값,,,
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.trim().equals("")){
				pageNum = "1";
			}
			//현재 페이지
			int currentPage = Integer.parseInt(pageNum);
			//1-5, 6-10, 11-15, 16-20
			//페이지에 출력되는 처음 시작하는 글번호
			int startRow = (currentPage-1) * pageSize + 1;
			//페이지에 출력되는 마지막 글번호
			int endRow = startRow + pageSize - 1;
			
			//글목록에 출력되는 번호구하기
			//rowCount -> 글 갯수!
			int rowCount = dao.getCount();
			//number -> 실제 번호
			int number = rowCount - startRow + 1;
			//endRow가 rowCount보다 크다면
			//마지막 글번호가 글의갯수보다 크다면
			//마지막 글번호를 글의갯수로 맞춰줌
			if (endRow > rowCount) endRow = rowCount;
			
			List<BoardDBBean> list = dao.listBoard(startRow, endRow); 
		
			if (list == null || list.size()==0){%>
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>	
<%		}else {
				for(BoardDBBean dto : list){%>
			<!-- 번호 -->		
		<tr>
			<!-- 찍고 감소하는중,, -->
			<td><%=number--%></td>
			<td>
		
<%		
		//re_level이 값이 있으면 답글임!
		if (dto.getRe_level()>0){ %>
				
				<img src="../img/level.gif" width="<%=dto.getRe_level()*20%>">
				
				<img src="../img/re.gif">
<%		} %>
			<!-- 제목 -->			
			<a href="content.jsp?num=<%=dto.getNum()%>">
			<%=dto.getSubject()%></a>
		
		<!-- 조회수가 10이 넘으면 hot이미지 붙여주기 -->
<%		if (dto.getReadcount()>10){ %>
				<img src="../img/hot.gif">
<%		} %>				
			</td>
			
			<!-- 작성자 -->
			<td><%=dto.getWriter()%></td>
			<!-- 작성일 -->
			<td><%=dto.getReg_date()%></td>
			<!-- 조회수 -->
			<td><%=dto.getReadcount()%></td>
			<!-- 아이피 -->
			<td><%=dto.getIp()%></td>
		</tr>							
<%			}
			}%>
	</table>
	
	<!-- 게시글 몇개 단위로 페이지 나눌건지! 페이지나눠서 게시물 출력하기! -->
<%
		
		if (rowCount>0){
			//3항연산자를 사용해서 나머지값이 0이면 0, 나머지값이 0이아니면 1을 더해준다
			//pageCount값은 글%페이지의출력할 갯수 = 0이면 0 // 0이아니면 1
			int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
			// 1234567페이지라면
			//       123 <다음> startPage 1		endPage3
			// <이전> 456 <다음> startPage 4		endPage6
			// <이전> 7          startPage 7
			//이렇게 출력시켜보고자 한다
			
			int pageBlock = 3;
			//1 4 7
			int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
			//3 6 
			int endPage = startPage + pageBlock - 1;
			//마지막 게시글번호가 pageCount보다 크다면
			//마지막 게시글 번호는 pageCount
			if (endPage > pageCount) endPage = pageCount;
			
			//시작되는값이 페이지블럭보다 크다 -> 다음페이지다 -> 이전이있다
			if (startPage > pageBlock) { %>
				<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
<%		}
			//startPage부터 시작해서 endPage와 같거나 작을때까지 i값을 증가해서 찍어줌
			for (int i=startPage; i<=endPage; ++i){%>
				<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%		} 	
			//끝나는값이 페이지카운트보다 작다 -> 이전페이지다 -> 다음이있다
			if (endPage < pageCount){%>
				<a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
<%		} %>									
<%	}%>	
</div>
<%@ include file="../bottom.jsp"%>









