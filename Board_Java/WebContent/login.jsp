<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./skin/header.jsp" %>

<!-- 로그인폼 -->
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<!-- 점보트론 -->
		<div class="jumbotron" style="padding-top:20px;">
			<!-- 로그인 정보를 숨기면서 전송 post -->
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align:center;">로그인</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20">
				</div>
				
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="20">
				</div>
				
				<input type="submit" class="btn btn-primary form-control" value="로그인">
			</form>
		</div>
	</div>
</div>


<%@include file="./skin/footer.jsp" %>