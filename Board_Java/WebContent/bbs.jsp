<%@page import="com.kye.DAO.BbsDAO"%>
<%@page import="javax.security.auth.callback.ConfirmationCallback" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./skin/header.jsp" %>
<!-- 게시판 -->
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align:center; border:1px solid #ddd;">
			<thead>
				<tr>
					<th style="background-color:#eee; text-align:center">번호</th>
					<th style="background-color:#eee; text-align:center">제목</th>
					<th style="background-color:#eee; text-align:center">작성자</th>
					<th style="background-color:#eee; text-align:center">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<BbsDTO> list = bbsDAO.getList(pageNumber);
					for(int i=0; i<list.size();i++){
				%>
				<tr>
					<td><%=list.get(i).getBbs_no() %></td>
					<td><a href="view.jsp?bbs_no=<%=list.get(i).getBbs_no() %>"><%=list.get(i).getTitle() %></a></td>
					<td><%=list.get(i).getId() %></td>
					<td><%=list.get(i).getDate() %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<!-- 페이징 -->
		<%
			if(pageNumber != 1){
		%>
		<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
		<%
			}
			if(bbsDAO.nextPage(pageNumber)){
		%>
		<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
		<%
			}
		%>
		<!-- 회원만 글쓰게 -->
		<%
			if(session.getAttribute("id") != null){
		%>
		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		<%
			} else {
		%>
		<button class="btn btn-primary pull-right" onclick="if(confirm('로그인하세요.'))location.href='login.jsp';" type="button">글쓰기</button>
		<%
			}
		%>
	</div>
</div>


<%@include file="./skin/footer.jsp" %>