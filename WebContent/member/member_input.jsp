<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

		request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id = "mbdto" class = "my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />

		<jsp:useBean id = "mbdao" class = "my.member.MemberDAO" />
    	<jsp:useBean id = "pool" class ="my.db.ConnectionPoolBean" scope = "application"/>
    	<jsp:setProperty property="pool" name="mbdao" value = "<%=pool%>"/>


<%
	if(mbdto.getName() == null || mbdto.getName().trim().equals("")){
		response.sendRedirect("memberSsn.jsp");
		return;
	}

	int res = mbdao.insertMember(mbdto);
	
	if(res>0){%>
		<script type = "text/javascript">
			alert("회원가입성공 로그인해줘")
			self.close()
		</script> 
<% }else { %>
		<script type = "text/javascript">
		alert("회원가입 실패,, 회원가입 페이지로 이동합니다.. 관리자에게 문의해주세요~! ")
		location.href = "memberSsn.jsp"
		
	</script>
	<% 	
	
} %>