<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "my.login.*" %>
<!DOCTYPE html>

<jsp:useBean id = "loginCheck" class="my.login.LoginCheck"/>
<jsp:setProperty property="*" name="loginCheck"/>
<!-- 세션이 유지될 까지만 저장하는,, scope = session,,, -->
<jsp:useBean id = "loginOk" class = "my.login.LoginOkBean"  scope = "session" />

<%

		if(loginCheck.getId() == null || loginCheck.getId().trim().equals("")){
			//되돌아가기
			response.sendRedirect("login.jsp");
			return;
		}

		String saveId = request.getParameter("saveId");

		int res = loginCheck.loginCheck();
		String msg = null, url = null;
		//리턴 되는것 OK, NOT_ID, ERROR ....
		switch(res){
		
		case LoginCheck.OK :
			//로그인 객체를 만듬
			loginOk.setId(loginCheck.getId());
			//boolean 값으로 받은건,, t/f로 꺼내줘서
			boolean isLogin= loginOk.isSetting();
			
			//로그인 정보 저장 !!
			Cookie ck = new Cookie("saveId", loginOk.getId());
			
			if(saveId == null){
				ck.setMaxAge(0);
			}else{
				ck.setMaxAge(24*60*60);
			}
			
			response.addCookie(ck);
			
			//id와 name 두개 저장
			session.setAttribute("id", loginOk.getId());
			session.setAttribute("name", loginOk.getName());
			
			msg = "로그인 됐음";
			url = request.getContextPath()+"/index.jsp";
			break;
			
		case LoginCheck.NOT_ID :
			msg = "아이디가 없음";
			url = "login.jsp";
			break;
		case LoginCheck.NOT_PW :
			msg = "비밀번호 틀림";
			url = "login.jsp";
		case LoginCheck.ERROR :
			msg = "DB서버 오류 발생";
			url = request.getContextPath()+"/index.jsp";
		}
		


%>

<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
