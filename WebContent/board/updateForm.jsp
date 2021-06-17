<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import="my.board.*" %>
<jsp:useBean id ="dao" class="my.board.BoardDataBean"/>

<%@ include file="../top.jsp" %>

<link rel="stylesheet" type="text/css" href="../style.css">

<%
		String num=request.getParameter("num");
		if(num==null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		//여기는 content 없으니까! 수정할때니까! 조회수가 올라가지 않게한것이지!
		BoardDBBean dto=dao.getBoard(Integer.parseInt(num), "update");
%>


<script type="text/javascript">
	function check(){
		if(f.writer.value==""){
			alert("이름을 입력해주세요")
			f.writer.foucs()
			//return만 쓰면 true가 리턴됨!! 그러므로 false 꼭 써줘야할것! 그래야 onsubmit 실행
			return false
		}
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
		if(f.passwd.value==""){
			alert("비밀번호를 입력해주세요")
			f.passwd.focus()
			return false

		}return true
	}

</script>


<div align="center">
<form name ="f" action="updatePro.jsp" method="post" onsubmit="return check()">
		<input type="hidden" name="num" value="<%=num%>"/>
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<td colspan="2"	 align="center">글수정</td>
			</tr>
			<tr>
				<td align="center" width="20%">이름</td>
				<td><input type="text"name="writer" class="box" value="<%=dto.getWriter()%>"></td>
			</tr>
			<tr>
				<td align="center" width="20%">제목</td>
				<td><input type="text"	name="subject" size="40" class="box"value="<%=dto.getSubject()%>"></td>
			</tr>
			<tr>
				<td align="center" width="20%" >Email</td>
				<td><input type="text" name="subjecct" size="40" class="box"value="<%=dto.getEmail()%>"></td>
			</tr>
			<tr>
				<td align="center" width="20%" >내용</td>
				<td><textarea rows="11" cols="40"	name ="content" class="box"></textarea>></td>
			</tr>
			<tr>
				<td align="center" width="20%">비밀번호</td>
				<td><input type="password" name="passwd"	class="box"><%=dto.getContent() %></td>
			</tr>
			<tr>
				<td colspan="3" bgcolor="yellow" align="center">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성"	>
					<input type="button" value="목록보기" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
		</form>
</div>
<%@ include file="../bottom.jsp" %>