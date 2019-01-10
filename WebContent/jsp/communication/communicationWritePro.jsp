<%@page import="Library.Board.CommunicationDAO"%>
<%@page import="Library.Board.CommunicationBean"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

		// writeForm 페이지에서 전달된 정보를 저장->DB 전달,저장
		// 자바빈 파일(객체) 생성 BoardBean 

		// 액션태그 정보 저장객체 생성
		// 액션태그 정보 저장
	%>
	<!-- BoardBean bb = new BoardBean(); -->
	<jsp:useBean id="bb" class="Library.Board.CommunicationBean" />
	<jsp:setProperty property="*" name="bb" />

	<%
		// 디비작업처리 객체 BoardDAO
		CommunicationDAO bdao = new CommunicationDAO();

		// 글쓰기(등록)기능의 메서드 사용  insertBoard(bb);
		bdao.communicationInsert(bb);
	
		// 페이지 번호
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);
		// 글 번호
		int insert_num = bdao.communicationGetCount();
		System.out.println("insert_num  aaaaaaaaaaaaaaaaa : " + insert_num);

		// list.jsp 페이지로 이동
		response.sendRedirect("communicationView.jsp?num=" + insert_num + "&pageNum=" + pageNum);
	%>
</body>
</html>