<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ include file = "../top.jsp"%>
<%@ include file = "../loginCheck.jsp" %>
<link rel="stylesheete" type="text/css" href="../style.css">


<script type="text/javascript">

	function check(){
		if(f.subject.value==""){
			alert("제목을 입력해주세요")
			f.subject.focus()
			return false
		}
		if(f.content.value==""){
			alert("내용을 입력해주세요")
			f.content.foucs()
			return false
		}
		if(f.filename.value==""){
			alert("파일을 선택해주세요")
			f.filename.focus()
		}
		if(f.passwd.value==""){
			alert("비밀번호를 입력해주세요")
			f.passwd.focus()
			return false
		}
		return true
	}
	<%
		int num=0, re_step=0, re_level=0, re_group=0;
		//넘어온 데이터 받기
	
		String snum = request.getParameter("num");
		//num이 넘어올때 ->답글일때
		//num이 안넘어올때->글쓰기버튼,, 새글일때! -> num값은 0임
		
		if(snum!=null){ //답글이니? snum이 비어있지않니? snum에 값이 있으면 t -> 답글이야!
			
			num=Integer.parseInt(snum);
			re_step=Integer.parseInt(request.getParameter("re_step"));
			re_level=Integer.parseInt(request.getParameter("re_level"));
			//3개로 만드는중,, 그룹화 하는중
			re_group=Integer.parseInt(request.getParameter("re_group"));
		}
	
	
	%>
	
</script>
<div align="center">
	<!-- onsubmit이 유효성 검사하는거! -->
	<form name ="f" action="writePro.jsp" method="post"  onsubmit="return check()" >
	
		<!-- 답글쓰기일경우 값 넘겨줌~!~! -->
		<input type="hidden" name="num" value="<%=num%>"/>
		<input type="hidden" name="re_step" value="<%=re_step%>"/>
		<input type="hidden" name="re_level" value="<%=re_level%>"/>
		<input type="hidden" name="re_group" value="<%=re_group%>"/>
		
		<table border="1"  width="500">
			<tr bgcolor="yellow">
				<td colspan="2"	 align="center">글쓰기</td>
			</tr>
			<tr>
				<td align="center" width="20%">이름</td>
				<td><input type="text"name="writer" class="box" value=<%=mbName%> readOnly></td>
			</tr>
			<tr>
				<td align="center" width="20%">제목</td>
				<td><input type="text"	name="subject" size="40" class="box"></td>
			</tr>
			<tr>
				<td align="center" width="20%" >Email</td>
				<td><input type="text" name="email" size="40" class="box"></td>
			</tr>
			<tr>
				<td align="center" width="20%" >내용</td>
				<td><textarea rows="11" cols="40"	name ="content" class="box"></textarea></td>
			</tr>
			<tr>
				<td align="center" width="20%">비밀번호</td>
				<td><input type="password" name="passwd"	class="box"></td>
			</tr>
			
			<tr>
				<td colspan="2" bgcolor="yellow" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성"	>
					<input type="button" value="목록보기" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
		</form>
</div>

<%@ include file = "../bottom.jsp"%>