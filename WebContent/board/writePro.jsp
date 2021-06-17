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

	//사용자에 대한 ip주소를 가져와서 집어넣어옴!
	dto.setIp(request.getRemoteAddr());
	//dto에 ip설정해서 dto보내서 넣어준다
	int res=dao.insertBoard(dto);
	
	if(res>0){%>
	<script type="text/javascript">
		alert("게시글 등록 성공,, 게시글 목록 페이지로 이동")
		location.href="list.jsp"
	</script>
	
<%} else{%>
	<script type="text/javascript">
		alert("게시글 등록 실패,, 게시글 등록 페이지로 이동")
		location.href="writeForm.jsp"
	</script>
<%} %>