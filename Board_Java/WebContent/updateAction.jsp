<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kye.DAO.BbsDAO" %>
<%@ page import="com.kye.DTO.BbsDTO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 액션</title>
</head>
<body>
<%
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
	if(id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요.')");
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
	} else {
		if(request.getParameter("title") == null || request.getParameter("content") == null 
				|| request.getParameter("title").equals("") || request.getParameter("content").equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO();
			
			int result = bbsDAO.update(bbs_no, request.getParameter("title"), request.getParameter("content"));
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글수저에에 실패했습니다.')");
				script.println("histoty.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='bbs.jsp'");
				script.println("</script>");
			}
		}
	}
%>
</body>
</html>