<%@page import="Library.Board.CommunicationDAO"%>
<%@page import="Library.Board.CommunicationBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); 
	%>
	<jsp:useBean id="bb" class="Library.Board.CommunicationBean"/>
	<jsp:setProperty property="*" name="bb"/>
	<%
		// 파일의 정보를 포함한 글 전체의 정보 -> DB에 저장
		//CommunicationBean bb = new CommunicationBean();
		String id = (String)session.getAttribute("id");
		bb.setId(id);
		System.out.println("bb : " + bb);
		System.out.println("Subject : " + bb.getSubject());
		System.out.println("Content : " + bb.getContent());
		
		// 목록 페이지, 현재 페이지 파라미터값 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("num : " + num);
		bb.setNum(num);
		
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);
		
		CommunicationDAO bdao = new CommunicationDAO();
		bdao.communicationUpdate(bb);
		
		response.sendRedirect("communicationView.jsp?num="+ bb.getNum() +"&pageNum="+pageNum);
	%>
</body>
</html>