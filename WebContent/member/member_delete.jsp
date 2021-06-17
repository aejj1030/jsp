<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

		<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
    	<jsp:useBean id = "pool" class ="my.db.ConnectionPoolBean" scope = "application"/>
    	<jsp:setProperty property="pool" name="mbdao" value = "<%=pool%>"/>
<%
		String no = request.getParameter("no");

		if (no==null || no.trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		}
		
		int res = mbdao.deleteMember(Integer.parseInt(no));
		String msg = null, url = "memberAll.jsp";
		if (res>0){
			msg = "회원삭제 성공!! 회원목록페이지로 이동합니다.";
		}else {
			msg = "회원삭제 실패!! 회원목록페이지로 이동합니다.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>









