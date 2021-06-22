<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "my.login.*" %>
<!DOCTYPE html>

<jsp:useBean id = "loginCheck" class="my.login.LoginCheck"/>
<jsp:setProperty property="*" name="loginCheck"/>
<!-- ������ ������ ������ �����ϴ�,, scope = session,,, -->
<jsp:useBean id = "loginOk" class = "my.login.LoginOkBean"  scope = "session" />

<%

		if(loginCheck.getId() == null || loginCheck.getId().trim().equals("")){
			//�ǵ��ư���
			response.sendRedirect("login.jsp");
			return;
		}

		String saveId = request.getParameter("saveId");

		int res = loginCheck.loginCheck();
		String msg = null, url = null;
		//���� �Ǵ°� OK, NOT_ID, ERROR ....
		switch(res){
		
		case LoginCheck.OK :
			//�α��� ��ü�� ����
			loginOk.setId(loginCheck.getId());
			//boolean ������ ������,, t/f�� �����༭
			boolean isLogin= loginOk.isSetting();
			
			//�α��� ���� ���� !!
			Cookie ck = new Cookie("saveId", loginOk.getId());
			
			if(saveId == null){
				ck.setMaxAge(0);
			}else{
				ck.setMaxAge(24*60*60);
			}
			
			response.addCookie(ck);
			
			//id�� name �ΰ� ����
			session.setAttribute("id", loginOk.getId());
			session.setAttribute("name", loginOk.getName());
			
			msg = "�α��� ����";
			url = request.getContextPath()+"/index.jsp";
			break;
			
		case LoginCheck.NOT_ID :
			msg = "���̵� ����";
			url = "login.jsp";
			break;
		case LoginCheck.NOT_PW :
			msg = "��й�ȣ Ʋ��";
			url = "login.jsp";
		case LoginCheck.ERROR :
			msg = "DB���� ���� �߻�";
			url = request.getContextPath()+"/index.jsp";
		}
		


%>

<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
