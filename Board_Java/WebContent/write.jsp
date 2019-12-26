<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./skin/header.jsp" %>

<div class="container">
	<div class="row">
		<form method="post" action="writeAction.jsp">
			<table class="table table-striped" style="text-align:center; border:1px solid #ddd;">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eee; text-align:center;">게시판 글쓰기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height:350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<!-- 회원만 글쓰게 -->
			<%
				if(session.getAttribute("id") != null){
			%>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			<%
				} else {
			%>
			<button class="btn btn-primary pull-right" onclick="if(confirm('로그인하세요.'))location.href='login.jsp';" type="button">글쓰기</button>
			<%
				}
			%>
		</form>
	</div>
</div>

<%@include file="./skin/footer.jsp" %>