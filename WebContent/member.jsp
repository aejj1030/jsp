<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>회원가입 </title>
	<link rel="stylesheet" type="text/css" href="../style.css"> 
	<script type = "text/javascript">
		function check(){
			if(f.id.value ==""){
			alert("아이디를 입력해주세요")
			f.id.focus()
			return
		}
			if(f.passwd.value==""){
				alert("비밀번호를 입력해주세요")
				f.passwd.focus()
				return
			}
			document.f.submit()
		}
			
	</script>
</head>


	<body>
	<%
	//hidden으로 전송시킨거 꺼내기
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	
	if(name ==null || ssn1 == null || ssn2 == null || name.trim().equals("") ||
			ssn1.trim().equals("") || ssn2.trim().equals("")){
		response.sendRedirect("memberSsn.jsp");
		return;
		
	}
	
	%>
		<form name="f" method="POST" action="member_input.jsp">
			<table width="600" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">회원가입</td>
 				</tr>
				<tr>
					<td width="150" class="m3">이름</td>
					<td class="m3">
						<input type="text" name="name" class="box" value = "<%=name%>" readOnly>
					</td>
				</tr>
				<tr>
					<td width="150" class="m3">아이디</td>
					<td class="m3">
						<input type="text" name="id" class="box">
					</td>
  				</tr>
  				<tr> 
					<td width="150" class="m3">비밀번호</td>
					<td class="m3">
						<input type="password" name="passwd" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">주민번호</td>
					<td class="m3">
						<input type="text" name="ssn1" class="box" maxlength = "6" value = "<%=ssn1 %>" readOnly> -
				<input type="password" name="ssn2" class="box" maxlength = "7" value = "<%=ssn2 %>" readOnly>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">이메일</td>
					<td class="m3">
						<input type="text" name="email" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">연락처</td>
					<td class="m3">
						<input type="text" name="hp1" class="box" size = "3" maxlength = "3"> -
						<input type="text" name="hp2" class="box" size = "4" maxlength = "4"> -
						<input type="text" name="hp3" class="box" size = "4" maxlength = "4">
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
					<!-- 페이지 자체내에서 유효성 검사하고 넘어가려고,, -->
						<a href="javascript:check()">[전송]</a>
						<a href="#">[취소]</a>
					</td>
  				</tr>
  			</table>
		</form>
	</body>
	</html>
