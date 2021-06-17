<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    	<jsp:useBean id = "mbdao" class = "my.member.MemberDAO" />
    	<jsp:useBean id = "pool" class ="my.db.ConnectionPoolBean" scope = "application"/>
    	<jsp:setProperty property="pool" name="mbdao" value = "<%=pool%>"/>
    		<!-- 만든 객체 pool을 멤버 dao에 넣어주는것임 
    	 동시에 달라고 하면 한명씩 줄세워서 주겠다 -->
<%

	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	
	if(name ==null || ssn1 == null || ssn2 == null || name.trim().equals("") ||
			ssn1.trim().equals("") || ssn2.trim().equals("")){
		response.sendRedirect("memberSsn.jsp");
		return;
		
	}
	
	boolean isMember = mbdao.checkMember(name, ssn1, ssn2);
	
	if(isMember){%>
		<script type = "text/javascript">
				alert("이미 회원입니다")
				self.close();
		</script> <%
		}else {%>
		
		<form name = "f" action = "member.jsp" method="post">
			<input type = "hidden" name = "name" value = "<%=name%>"/>
			<input type = "hidden" name = "ssn1" value = "<%=ssn1%>"/>
			<input type = "hidden" name = "ssn2" value = "<%=ssn2%>"/>
		</form>
		
		<script type = "text/javascript">
			alert("회원가입 페이지로 이동합니다")
			document.f.submit()
		</script>
		
		
<% }	%> 