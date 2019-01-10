<%@page import="Library.Book.BookDAO"%>
<%@page import="Library.Book.BookBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
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
		ServletContext ctx = getServletContext();

		String realpath = ctx.getRealPath("book");
		System.out.println("파일 실제 경로 : " + realpath);

		// 파일의 최대 크기 지정
		int maxSize = 10 * 1024 * 1024; // 10MB
		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 파일의 정보를 포함한 도서 전체의 정보 -> DB에 저장
		BookBean bb = new BookBean();

		bb.setBook_num(Integer.parseInt(multi.getParameter("num"))); // 번호
		bb.setBook_name(multi.getParameter("name")); // 제목
		bb.setBook_author(multi.getParameter("author")); // 저자
		bb.setBook_count(Integer.parseInt(multi.getParameter("count"))); // 수량
		
		if(multi.getFilesystemName("image") == null ){ // 표지
			bb.setBook_image(multi.getParameter("image2"));
		}
		else {
			bb.setBook_image(multi.getFilesystemName("image"));
		}
							
		// 목록 페이지, 현재 페이지 파라미터값 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
					
		BookDAO bdao = new BookDAO();
		bdao.bookBoardUpdate(bb); 

		response.sendRedirect("bookView.jsp?num="+bb.getBook_num()+"&pageNum="+pageNum);
	%>
</body>
</html>