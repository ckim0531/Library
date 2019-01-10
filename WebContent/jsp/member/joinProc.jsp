<%@page import="Library.Member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		// post 방식에서의 파라미터 인코딩 설정 // 한글 처리
		request.setCharacterEncoding("utf-8");
	%>
	
	<jsp:useBean id="mb" class="Library.Member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
		// 현재 시간 정보를 저장
		mb.setReg_date(new Timestamp(System.currentTimeMillis()));
	
		// 디비 저장 작업 처리
		MemberDAO mdao = new MemberDAO();
		
		// 회원 가입 처리 메서드 구현
		mdao.joinInsertMember(mb);
	%>
	
	<script type="text/javascript">
		location.href="../../jsp/member/join_welcome.jsp";
	</script>
</body>
</html>