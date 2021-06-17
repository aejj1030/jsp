<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_update_ok.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id = "pool" class ="my.db.ConnectionPoolBean" scope = "application"/>
<jsp:setProperty property="pool" name="mbdao" value = "<%=pool%>"/>
<%
		if (mbdto.getPasswd()==null || mbdto.getPasswd().trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		}
 
		int res = mbdao.updateMember(mbdto);
		String msg = null, url = "memberAll.jsp";
		if (res>0){
			msg = "회원수정 성공!! 회원목록페이지로 이동합니다.";
		}else {
			msg = "회원수정 실패!! 회원목록페이지로 이동합니다.";
		}
%>

<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>


ㅣ

