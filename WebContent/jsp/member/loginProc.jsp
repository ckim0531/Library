<%@page import="Library.Member.MemberDAO"%>
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
			// id, pass 파라미터 값 가져오기
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
				
			// 디비 처리 객체 MemberDAO 생성, 체크 메서드 생성
			MemberDAO mdao = new MemberDAO();
			int check = mdao.loginCheck(id, pass);
			
			// check == 1  로그인 처리, index.jsp 이동
			if(check == 1) {
				session.setAttribute("id", id);
				session.setAttribute("pass", pass);
				response.sendRedirect("../../index.html");
			}
			else if(check == 0) { // check == 0 "비밀번호 오류", 뒤로 이동
				%>
					<script type="text/javascript">
						alert("비밀번호 오류");
						history.back();
					</script>
				<%
			}
			else { // check = -1 "아이디 없음", 뒤로 이동
				%>
					<script type="text/javascript">
						alert("아이디가 없습니다. 회원가입 해주세요.");
						history.back();
					</script>
				<%
			}
		%>
	</body>
</html>