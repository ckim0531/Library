<%@page import="Library.Board.NoticeDAO"%>
<%@page import="Library.Board.NoticeBean"%>
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

		String realpath = ctx.getRealPath("upload");
		System.out.println("파일 실제 경로 : " + realpath);

		// 파일의 최대 크기 지정
		int maxSize = 10 * 1024 * 1024; // 10MB
		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 파일의 정보를 포함한 글 전체의 정보 -> DB에 저장
		NoticeBean bb = new NoticeBean();

		bb.setNum(Integer.parseInt(multi.getParameter("num")));
		bb.setId(multi.getParameter("id"));
		bb.setName(multi.getParameter("name"));
		bb.setSubject(multi.getParameter("subject"));
		bb.setContent(multi.getParameter("content"));
		
		if(multi.getFilesystemName("file") == null ){
			bb.setFile(multi.getParameter("file2"));
		}else{
			bb.setFile(multi.getFilesystemName("file"));
		}
		
		System.out.println("번호 : " +bb.getNum());
		System.out.println("아이디 : "+bb.getId());
		System.out.println("이름 : "+bb.getName());
		System.out.println("제목 :"+bb.getSubject());
		System.out.println("내용 :"+bb.getContent());
		System.out.println("파일 : "+bb.getFile());
		
		// 목록 페이지, 현재 페이지 파라미터값 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
					
		NoticeDAO bdao = new NoticeDAO();
		bdao.noticeBoardUpdate(bb); 

		int insert_num=bdao.noticeGetBoardNum();
		
		response.sendRedirect("../../jsp/notice/noticeView.jsp?num="+insert_num+"&pageNum="+pageNum);
	%>
</body>
</html>