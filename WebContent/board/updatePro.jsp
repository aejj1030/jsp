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

	int res=dao.updateBoard(dto);
	
	String msg=null, url=null;
	if(res>0){
		msg="글 수정 공 ,, 목록페이지로 이동";
		url="list.jsp";
	}else if(res<0){
		msg="비밀번호가 틀렸습니다 다시 입력해주세요";
		url="updateForm.jsp?num"+dto.getNum();
	}else{
		msg="글 수정 실패,, 글 보기 페이지로 이동";
		url="content.jsp?num"+dto.getNum();
	}
	
%>

<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"

</script>


%>