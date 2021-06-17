<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String msg = null, url = null;
	
	if(id.equals("admin")){
		if(pwd.equals("1234")){
			session.setAttribute("id", id);
			msg = "로그인,, 성공 회원전용 페이지로 이동"	;
			url = "sessionTest2.jsp";
		}else{
			msg = "비밀번호가 틀렸습니다,,다시,,"	;
			url = "sessionTest1.jsp";
		}
		
	}else{
		msg = "아이디가 틀렸습니다. 다시 로그인해주세요"	;
		url  = "sessionTest1.jsp";
		
	}
%>

<script type = "text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>