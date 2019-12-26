<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./skin/header.jsp" %>
<%
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
%>
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align:center; border:1px solid #ddd;">
			<thead>
				<tr>
					<th colspan="3" style="background-color:#eee; text-align:center;">글보기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width:20%;">글 제목</td>
					<td colspan="2"><%= bbsDTO.getTitle() %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><%=bbsDTO.getId() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td colspan="2"><%=bbsDTO.getDate() %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2" style="min-height:200px; text-align:left;"><%=bbsDTO.getContent().replace(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></td>
				</tr>
			</tbody>
		</table>
		<a href="bbs.jsp" class="btn btn-primary">목록</a>
	
		<%
			if(id != null && id.equals(bbsDTO.getId())){
		%>
		<a href="update.jsp?bbs_no=<%=bbs_no %>" class="btn btn-primary">수정</a>
		
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbs_no=<%=bbs_no %>" class="btn btn-primary">삭제</a>
		<%
			}
		%>
	</div>
</div>

<%@include file="./skin/footer.jsp" %>