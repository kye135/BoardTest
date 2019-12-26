<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./skin/header.jsp" %>

<%
if(id == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인하세요.')");
	script.println("location.href='login.jsp'");
	script.println("</script>");
}

int bbs_no = 0;
if(request.getParameter("bbs_no") != null){
	bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
}
if(bbs_no == 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 글 입니다.')");
	script.println("location.href='bbs.jsp'");
	script.println("</script>");
}
BbsDTO bbsDTO = new BbsDAO().getBbsDTO(bbs_no);

if(!id.equals(bbsDTO.getId())){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다.')");
	script.println("location.href='bbs.jsp'");
	script.println("</script>");
}
%>
<div class="container">
	<div class="row">
		<form method="post" action="updateAction.jsp?bbs_no=<%=bbs_no %>">
			<table class="table table-striped" style="text-align:center; border:1px solid #ddd;">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eee; text-align:center;">글 수정</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50" value="<%=bbsDTO.getTitle() %>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height:350px;"><%=bbsDTO.getContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<button class="btn btn-primary pull-right" type="submit">수정</button>
		</form>
	</div>
</div>

<%@include file="./skin/footer.jsp" %>