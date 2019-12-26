<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./skin/header.jsp" %>

<!-- 회원가입 폼 -->
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<!-- 점보트론 -->
		<div class="jumbotron" style="padding-top:20px";>
			<form method="post" action="joinAction.jsp">
				<h3 style="text-align:center;">회원가입</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="50">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="50">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름" name="name" maxlength="50">
				</div>
				<div class="form-group" style="text-align:center;">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary active">
							<input type="radio" name="gender" autocomplete="off" value="남자" checked>남자
						</label>
						<label class="btn btn-primary active">
							<input type="radio" name="gender" autocomplete="off" value="여자" checked>여자
						</label>
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이메일" name="email" maxlength="50">
				</div>
				
				<input type="submit" class="btn btn-primary form-control" value="회원가입">
			</form>
		</div>
	</div>
</div>


<%@include file="./skin/footer.jsp" %>