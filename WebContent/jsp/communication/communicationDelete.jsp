<%@page import="Library.Board.CommunicationDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");

	// 게시글에서 받아오는 게시글 번호
	String pageNum = request.getParameter("pageNum");
	
	// 폼 태그에서 받아오는 것
	int num = Integer.parseInt(request.getParameter("num"));

	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	
	// 디비 처리 객체
	CommunicationDAO ndao = new CommunicationDAO();
	
	// 삭제할 글 정보 가져온다
	int check = ndao.communicationDelete(num, id);
	
	if(check == 1) {
		%>
			<script type="text/javascript">
				location.href="communicationList.jsp";
			</script>
		<%
	}
	else if(check == 0) {
		%>
			<script type="text/javascript">
				history.back();
			</script>
		<%
	}
	else {
		%>
			<script type="text/javascript">
				history.back();
			</script>
		<%
	}
%>
</body>
</html>