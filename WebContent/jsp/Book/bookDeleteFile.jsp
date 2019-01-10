<%@page import="Library.Book.BookBean"%>
<%@page import="Library.Book.BookDAO"%>
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
	BookDAO ndao = new BookDAO();
	BookBean nb = ndao.bookBoardGetContentNum(num);
	
	// 삭제할 파일 이름 가져온다
	String fileName = ndao.bookGetFileName(num);
	
	if(fileName != null) {
		// 파일이 있는 폴더의 절대 경로
		String folder = request.getServletContext().getRealPath("book");
		
		// 파일 절대 경로를 만든다.
		String filePath = folder + "/" + fileName;
		
		File file = new File(filePath); // 파일 객체 생성
		
		if(file.exists()) {
			// 파일이 존재할 경우 파일 삭제
			file.delete();
		}
	}
	
	// 삭제할 파일 정보 가져온다
	String name = request.getParameter("name");
	int check = ndao.bookDeleteFile(num, name);
	
	if(check == 1) {
		%>
		<script type="text/javascript">
			location.href="bookUpdate.jsp?num=<%=nb.getBook_num()%>&pageNum=<%=pageNum%>";
		</script>
		<%
	}
	else if(check == 0) {
		%>
			<script type="text/javascript">
				alert("게시물파일 삭제 비밀번호 없음");
				history.back();
			</script>
		<%
	}
	else {
		%>
			<script type="text/javascript">
				alert("게시물 파일 삭제 아이디 없음");
				history.back();
			</script>
		<%
	}
%>
</body>
</html>