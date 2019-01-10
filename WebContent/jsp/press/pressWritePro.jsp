<%@page import="Library.Board.pressDAO"%>
<%@page import="Library.Board.pressBean"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//현재 실행중인 웹프로젝트에 정보를 가지고 있는 객체를 가져오기 
		ServletContext ctx = getServletContext();
	
		// MultipartRequest 객체 사용 파일 업로드
		
		// 파일이 저장될 서버의 경로
		// D:\Project\jsp\Individual Project\Library_Book_Rental\Library_Book_Rental\WebContent/upload
		// upload 앞에 \이 가야되는데 \ 하면 에러떠서 / 로 대체
		String realPath = ctx.getRealPath("upload");
		System.out.println("파일 실제 경로 : " + realPath);
		
		// 파일의 최대 크기 10MB로 제한
		int maxSize = 10 * 1024 * 1024; // 10MB
		
		// MultipartRequest 객체 사용 파일 업로드
		// MultipartRequest 생성만 해주면 파일이 업로드 된다. (파일 자체의 업로드 완료)
		MultipartRequest multi = new MultipartRequest
			(
				request, // request 객체
				realPath, // 저장될 서버 경로
				maxSize, // 파일 최대 크기
				"UTF-8", // 인코딩 방식
				new DefaultFileRenamePolicy() // 같은 이름의 파일명 방지 처리
			);
		
		// MultipartRequest로 전송받은 데이터를 불러온다
		// enctpy은 multipart/form-data로 선언하고 submit한 데이터들은
		// request 객체가 아닌 MultipartRequest 객체로 불러와야한다.
		// 파일의 정보를 포함한 글 전체의 정보 -> DB에 저장
		pressBean bb = new pressBean();
		
		bb.setId(multi.getParameter("id"));
		bb.setName(multi.getParameter("name"));
		bb.setSubject(multi.getParameter("subject"));
		bb.setContent(multi.getParameter("content"));
		// 전송받은 데이터가 파일일 경우 getFilesystemName()으로 파일 이름을 받아올 수 있다.
		if(multi.getFilesystemName("file") != null) {
			bb.setFile(multi.getFilesystemName("file"));
		}
		else {
			bb.setFile("");
		}
	
		// Enumeration 순서를 가지고 있는 배열의 한 종류
		// 사용 범위 : Vector, Hashtable
		// 동작 방법 : nextElemnet() 메소드를 만나면 객체를 가져와서 하나의 열거형 요소로 생성.
		//          그러므로 대용량 데이터에 합하지 안핟.
		// 객체의 전체 컬렉션의 내용을 하나씩 검사 하는 것이 아니라 전체를 한 번에 검사하는 것을 의미
		// nextEelement() 현재 커서가 가리키고 있는 데이터-객체(Object)를 리턴해주고 커서의 위치를 다음칸으로 올믹낟.
		// 커서 : 현재의 위치를 가리키고 있는 것인데 최초 0부터 시작
		// hashMoreElement() : 커서 바로 앞에 데이터가 들어있는지를 체크하는 것
		//                     현재 커서가 0이라면 첫번째칸을 가리키기 때문에 데이터가 하나라도 들어있다면 true
		//                     즉, 요소가 있는지 테스트 함
		Enumeration e = multi.getFileNames();
		
		while (e.hasMoreElements()) {
			// 객체를 가져와서 하나의 열거형 요소로 생성
			// 객체의 전체 컬렉션의 내용을 한번에 검사
			String fileName = (String) e.nextElement();

			System.out.println("클라이언트 -> 서버 업로드 파일의 원본 이름:" + multi.getOriginalFileName(fileName) + "<br>");
			System.out.println("서버에 실제로 업로드된 파일의 이름 :" + multi.getFilesystemName(fileName) + "<br>");
			
			// 서버에 올라가있는 파일의 정보를 받아오기 
			File f = multi.getFile(fileName);

			// 현재 페이지 파라미터값 가져오기
			String pageNum = request.getParameter("pageNum");
			
			// 디비 저장 & 처리 
			pressDAO bdao = new pressDAO();
			bdao.pressBoardInsert(bb);
			
			int insert_num=bdao.pressGetBoardNum();
		
			response.sendRedirect("../../jsp/press/pressView.jsp?num="+insert_num+"&pageNum="+pageNum);
		}
	%>
</body>
</html>